# Betrieb bei Hetzner

Diese Seite beschreibt einen erprobten Weg, die Tourenanmeldung auf einem eigenen Server bei Hetzner zu betreiben. Jeder andere Linux-Server mit Docker geht genauso. Namen und Adressen sind Beispiele.

## Server

- Ein Cloud-Server mit 2 vCPU und 4 GB RAM reicht für einen Verein. Mehrere Vereine passen auf denselben Server.
- Betriebssystem: ein aktuelles Ubuntu oder Debian.
- Pakete: Docker mit dem Compose-Plugin, nginx, certbot, git.
- DNS: ein A-Eintrag für die Adresse der Anwendung, zum Beispiel `touren.example.com` auf `203.0.113.10`.

## Firewall

In der Hetzner Cloud Firewall oder mit `ufw` nur diese Ports öffnen:

- 22 für SSH
- 80 und 443 für nginx

Die Anwendung selbst ist nur auf `127.0.0.1` erreichbar. Docker umgeht `ufw` bei veröffentlichten Ports. Deshalb bindet die Produktions-Datei den Port ausdrücklich an `127.0.0.1`.

## Mehrere Instanzen

Für jeden Verein eine eigene Instanz:

- ein eigenes Verzeichnis, zum Beispiel `/opt/verein1` und `/opt/verein2`
- ein eigener Compose-Projektname (`-p verein1`). Damit hat jede Instanz ihre eigene Datenbank.
- eine eigene `.env` mit eigenem `SECRET_KEY` und eigenem `APP_PORT`, zum Beispiel 8002 und 8003
- ein eigener Server-Block in nginx

Die Einrichtung einer Instanz steht unter [Produktion mit Docker Compose](../installation/production.md).

## TLS

```bash
certbot --nginx -d touren.example.com
```

certbot trägt das Zertifikat in den Server-Block ein und erneuert es von selbst.

## Ausrollen per git push

Bequem ist ein Ausrollen per `git push`: Auf dem Server liegt ein leeres Repository, ein Hook baut und startet nach jedem Push die Instanzen.

Auf dem Server:

```bash
git init --bare /srv/git/tourenanmeldung.git
```

Hook `/srv/git/tourenanmeldung.git/hooks/post-receive`, ausführbar:

```bash
#!/bin/sh
set -e
for instance in verein1 verein2; do
    git --work-tree=/opt/$instance --git-dir=/srv/git/tourenanmeldung.git checkout -f main
    cd /opt/$instance
    APP_BUILD=$(git --git-dir=/srv/git/tourenanmeldung.git rev-list --count main) \
        docker compose -f docker-compose.yml -f docker-compose.prod.yml -p $instance up -d --build
done
```

Auf dem eigenen Rechner:

```bash
git remote add deploy deploy@touren.example.com:/srv/git/tourenanmeldung.git
git push deploy main
```

Danach im Fußbereich prüfen, ob die Build-Nummer zu `git rev-list --count HEAD` passt.

## Mail

Die Anwendung braucht einen SMTP-Server mit SSL auf Port 465. Das kann das Postfach eines Webhosting-Pakets sein oder jeder andere Mailanbieter. Damit Mails nicht im Spam landen, für die Absender-Domain SPF und DKIM einrichten. Eingetragen wird der Server unter [Einstellungen im Admin](../config/settings.md#mailversand).

## Backup

- Täglich per Cronjob `mongodump` pro Instanz, siehe [Update und Backup](../installation/updates.md#backup).
- Die Archive auf einen anderen Speicher kopieren, zum Beispiel eine Hetzner Storage Box.
- Zusätzlich lassen sich in der Hetzner Cloud Backups des ganzen Servers einschalten. Sie ersetzen das Datenbank-Backup nicht, weil sie eine laufende Datenbank kopieren.

## Überwachen

- `docker compose ... ps` zeigt, ob alle drei Container laufen.
- `docker compose ... logs application` zeigt Zugriffe und Fehler.
- Ein externer Check auf die Startseite meldet, wenn die Anwendung nicht antwortet.
