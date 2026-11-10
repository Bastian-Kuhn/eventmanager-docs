# Lokal mit Docker

So läuft die Tourenanmeldung auf dem eigenen Rechner, zum Ausprobieren oder zum Entwickeln. Für den Vereinsbetrieb gibt es eine eigene Anleitung: [Produktion mit Docker Compose](production.md).

## Voraussetzungen

- Docker
- `docker-compose` als eigenes Programm. Das Skript `./helper` ruft `docker-compose` auf, nicht `docker compose`.
- git

## Starten

```bash
git clone https://github.com/bastian-kuhn/eventmanager.git
cd eventmanager
./helper up
```

`./helper up` baut das Image und startet drei Container: die Anwendung, MongoDB und Redis. Die Anwendung ist danach unter <http://localhost:5004> erreichbar.

Lokal läuft der Flask-Entwicklungsserver mit Debug-Modus. Das Projektverzeichnis ist in den Container eingebunden, Änderungen am Code greifen ohne neuen Build.

## Ersten Admin anlegen

```bash
./helper create_user admin@example.com
```

Der Befehl legt das Konto als globalen Admin an und gibt ein zufälliges Passwort mit 20 Zeichen aus. Gibt es das Konto schon, bekommt es ein neues Passwort und wird wieder globaler Admin. Weiter geht es mit den [Ersten Schritten](first_steps.md).

## Befehle von ./helper

| Befehl | Was passiert |
| --- | --- |
| `./helper up` | Container neu bauen und starten |
| `./helper start` | gestoppte Container starten |
| `./helper stop` | Container stoppen |
| `./helper restart` | Container stoppen und wieder starten |
| `./helper down` | Container und lokal gebaute Images entfernen. Das Datenbank-Volume bleibt. |
| `./helper logs` | Log der Anwendung verfolgen |
| `./helper shell` | Shell im Container der Anwendung |
| `./helper create_user <email>` | globalen Admin anlegen oder dessen Passwort neu setzen |

Alle Befehle nutzen den Compose-Projektnamen `eventtool`. Der Container der Anwendung heißt `eventtool-application-1`.

!!! note "Mails lokal"
    Ohne eingerichteten Mailserver verschickt die Anwendung keine Mails. Dann kommt auch der Link zur Bestätigung der E-Mail-Adresse nicht an. Zum Testen legt man Konten deshalb mit `./helper create_user` an oder richtet den Mailversand ein, siehe [Einstellungen im Admin](../config/settings.md).
