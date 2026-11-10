# Server-Konfiguration

Was sich nicht im Admin einstellen lässt, steht in `application/config.py` oder kommt aus Umgebungsvariablen.

## Welche Konfiguration geladen wird

Die Umgebungsvariable `config` wählt die Klasse aus `application/config.py`:

| Wert von `config` | Klasse | Wofür |
| --- | --- | --- |
| `prod_compose` | `ComposeProdConfig` | Produktion mit Docker Compose. Zusätzlich: Cookies nur über HTTPS, Client-IP aus den Proxy-Headern, `SECRET_KEY` ist Pflicht. |
| `compose` | `ComposeProdConfig` | Lokal mit `./helper`, über HTTP |
| `prod` | `ProductionConfig` | Produktion ohne Docker. `SECRET_KEY` ist Pflicht. |
| nicht gesetzt | `BaseConfig` | Entwicklung ohne Docker |

Die Compose-Dateien setzen `config` selbst. Unter Docker Compose heißen die Hosts für Datenbank und Redis `mongo` und `redis`.

## Umgebungsvariablen

| Variable | Bedeutung |
| --- | --- |
| `SECRET_KEY` | Schlüssel für Sessions und Links in Mails. In Produktion Pflicht und fest. |
| `APP_PORT` | Port auf `127.0.0.1` in Produktion, Standard `8002` |
| `APP_BUILD` | Build-Nummer im Fußbereich |
| `TZ` | Zeitzone, Standard `Europe/Berlin` |

## Einstellungen im Code

Diese Werte stehen in `BaseConfig` und gelten für alle Varianten:

| Einstellung | Wert | Bedeutung |
| --- | --- | --- |
| `PASSWD_MIN_PASSWD_LENGTH` | 8 | Mindestlänge für Passwörter |
| `PASSWD_SPECIAL_CHARS`, `PASSWD_SEPCIAL_LOWER` | an | Passwörter brauchen Kleinbuchstaben und ein Sonderzeichen |
| `ADMIN_SESSION_HOURS` | 8 | Dauer einer Sitzung ohne „Angemeldet bleiben“ |
| `REMEMBER_COOKIE_DAYS` | 30 | Dauer von „Angemeldet bleiben“ |
| `MONGODB_SETTINGS` | Datenbank `eventmanger` | Verbindung zu MongoDB |

Wer diese Werte ändern will, ändert sie im Code und baut neu.
