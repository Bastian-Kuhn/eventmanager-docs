# Produktion mit Docker Compose

Für den Vereinsbetrieb startet man die Anwendung mit zwei Compose-Dateien: `docker-compose.yml` und `docker-compose.prod.yml`. Davor steht ein Webserver wie nginx, der TLS macht.

## Was die Produktions-Datei ändert

- Die Anwendung läuft mit gunicorn (8 Worker, je 4 Threads) statt mit dem Entwicklungsserver.
- Die Konfiguration `prod_compose` wird geladen. Cookies gehen dann nur über HTTPS, und die echte Client-IP kommt aus den Headern `X-Forwarded-For` und `X-Forwarded-Proto` von nginx.
- Der Port der Anwendung ist nur auf `127.0.0.1` offen. Standard ist `8002`, änderbar mit `APP_PORT`.
- Alle Container starten nach einem Neustart des Servers von selbst (`restart: unless-stopped`).
- Die Container haben Speicher- und Prozessgrenzen. Die Anwendung läuft ohne Linux-Capabilities.

## Umgebungsvariablen

Die Variablen stehen am besten in einer Datei `.env` neben den Compose-Dateien. Docker Compose liest sie von selbst.

| Variable | Pflicht | Bedeutung |
| --- | --- | --- |
| `SECRET_KEY` | ja | Geheimer, fester Schlüssel für Sessions und Links in Mails. Ohne ihn startet die Anwendung nicht. |
| `APP_PORT` | nein | Port auf `127.0.0.1`, Standard `8002`. Nötig, wenn mehrere Instanzen auf einem Server laufen. |
| `APP_BUILD` | nein | Wird im Fußbereich als „Build N“ angezeigt. Üblich ist die Anzahl der Commits. |

Einen Schlüssel erzeugen:

```bash
python3 -c 'import secrets; print(secrets.token_urlsafe(48))'
```

!!! warning "SECRET_KEY nicht ändern"
    Der Schlüssel muss über alle Neustarts gleich bleiben. Ein neuer Schlüssel meldet alle Nutzer ab und macht offene Links zum Bestätigen oder Zurücksetzen ungültig.

## Starten

```bash
git clone https://github.com/bastian-kuhn/eventmanager.git /opt/verein1
cd /opt/verein1
cat > .env <<ENV
SECRET_KEY=<erzeugter Schlüssel>
APP_PORT=8002
ENV
APP_BUILD=$(git rev-list --count HEAD) \
  docker compose -f docker-compose.yml -f docker-compose.prod.yml -p verein1 up -d --build
```

`verein1` ist der Projektname. Er trennt die Container und das Datenbank-Volume mehrerer Instanzen auf demselben Server.

## Ersten Admin anlegen

```bash
docker compose -f docker-compose.yml -f docker-compose.prod.yml -p verein1 \
  exec application flask --app app create_user admin@example.com
```

Das Passwort steht danach in der Ausgabe. Weiter mit den [Ersten Schritten](first_steps.md).

## nginx davor

Die Anwendung erwartet, dass genau ein Proxy davor steht und die Header setzt. Ein Beispiel für einen Server-Block:

```nginx
server {
    listen 443 ssl;
    server_name touren.example.com;

    ssl_certificate     /etc/letsencrypt/live/touren.example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/touren.example.com/privkey.pem;

    client_max_body_size 10m;

    location / {
        proxy_pass http://127.0.0.1:8002;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Ohne diese Header teilen sich alle Besucher dieselbe IP, die des Docker-Netzes. Dann greifen die [Anfragelimits](../basics/limits.md) für alle gemeinsam.

## Versionen von MongoDB und Redis

Die Images sind fest auf eine Version gesetzt (MongoDB 7.0, Redis 8). MongoDB nur innerhalb von 7.0 anheben. Ein Sprung auf eine neue Hauptversion braucht die Schritte zur Feature Compatibility Version aus der MongoDB-Dokumentation.
