# Tourenanmeldung Dokumentation

MkDocs-Material Quelltext für die Dokumentation der [Tourenanmeldung](https://github.com/bastian-kuhn/eventmanager).

## Lokal bauen

```bash
make venv
make serve
```

Dann http://127.0.0.1:8000 öffnen. `make build` baut mit `--strict` nach `site/`.

## Veröffentlichen

Die gebaute Seite liegt auf dem Hetzner Webspace und wird per SFTP hochgeladen:

```bash
cp deploy/deploy.env.example deploy/deploy.env   # einmal, Host und Benutzer eintragen
make deploy-dry   # baut und zeigt, was hochgeladen würde
make deploy       # baut und lädt hoch
```

Hochgeladen wird nur, auf dem Server wird nichts gelöscht. Seiten, die es nicht mehr gibt, bleiben dort liegen, bis man sie von Hand entfernt.

`.readthedocs.yaml` stammt aus der Zeit, als die Doku auf readthedocs.org lag, und wird nicht mehr genutzt.
