# Ohne Docker

Die Anwendung läuft auch direkt mit Python. Das ist für die Entwicklung gedacht. Beim Start steht dann der Hinweis `STANDALONE MODE - NOT FOR PROD`.

!!! note "Kein PyPI-Paket"
    Im Repository liegt eine `pyproject.toml` für das Paket `dav-eventmanager`. Auf PyPI ist es bisher nicht veröffentlicht. Installiert wird aus dem Quellcode.

## Voraussetzungen

- Python 3.10 oder neuer
- MongoDB auf `127.0.0.1:27017`
- Redis auf `localhost:6379`
- die Locale `de_DE.UTF-8`. Die Anwendung stellt sie beim Start ein und bricht ab, wenn sie fehlt.

## Installieren und starten

```bash
git clone https://github.com/bastian-kuhn/eventmanager.git
cd eventmanager
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
.venv/bin/flask --app app run
```

Ohne gesetzte Variable `config` lädt die Anwendung die Grundkonfiguration `BaseConfig`. Die Datenbank heißt dann `eventmanger` auf dem lokalen MongoDB.

## Ersten Admin anlegen

```bash
.venv/bin/flask --app app create_user admin@example.com
```

Weiter mit den [Ersten Schritten](first_steps.md).
