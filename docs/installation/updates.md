# Update und Backup

## Update

Ein Update ist ein neuer Stand aus git und ein neuer Build.

```bash
cd /opt/verein1
git pull
APP_BUILD=$(git rev-list --count HEAD) \
  docker compose -f docker-compose.yml -f docker-compose.prod.yml -p verein1 up -d --build
```

Danach im Fußbereich der Seite die Build-Nummer prüfen. Sie muss zu `git rev-list --count HEAD` passen.

Lokal reicht `git pull` und `./helper up`.

Die Anwendung braucht beim Update keine Migration. Neue Felder bekommen beim ersten Speichern ihren Wert. Buchungen ohne Buchungsnummer bekommen sie beim ersten Aufruf von **Meine Buchung** oder **Abrechnung**.

## Backup

Alle Daten liegen in MongoDB, auch das Logo und die Profilbilder (GridFS). Redis hält nur Sperren und Zähler, die muss man nicht sichern.

Sicherung als Archiv:

```bash
docker compose -f docker-compose.yml -f docker-compose.prod.yml -p verein1 \
  exec -T mongo mongodump --db eventmanger --archive --gzip > backup-$(date +%F).gz
```

Der Name der Datenbank ist `eventmanger`, so steht er in der Konfiguration.

Zurückspielen:

```bash
docker compose -f docker-compose.yml -f docker-compose.prod.yml -p verein1 \
  exec -T mongo mongorestore --archive --gzip < backup-2026-01-01.gz
```

`mongorestore` legt Dokumente an, die fehlen. Bestehende Dokumente mit derselben ID bleiben stehen. Für eine komplette Wiederherstellung die Option `--drop` nutzen, die vorher die Collections leert.

!!! tip "Backup außer Haus"
    Das Archiv gehört nicht nur auf denselben Server. Zum Beispiel per Cronjob täglich sichern und auf einen anderen Speicher kopieren, etwa eine Hetzner Storage Box.
