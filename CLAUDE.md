# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Grundsätze

1. Don't assume. Don't hide confusion. Surface tradeoffs.
2. Minimum code that solves the problem. Nothing speculative.
3. Touch only what you must. Clean up only your own mess.
4. Define success criteria. Loop until verified.
5. Simple is better than Complex, Readability counts.

## Projekt-Notizen

- Reine Dokumentation für die Tourenanmeldung ([eventmanager](https://github.com/bastian-kuhn/eventmanager), Code in `../eventmanager`). MkDocs-Material, Sprache Deutsch, einfache Sätze, keine Gedankenstriche.
- Veröffentlicht auf dem Hetzner Webspace per SFTP: `make deploy-dry` zeigt den Upload, `make deploy` lädt hoch (`deploy/deploy.sh`, Muster wie `../bastian-kuhn.de`). Host und Benutzer stehen in `deploy/deploy.env` (gitignored), Zielordner per `TA_DEPLOY_DIR`. Nur Upload, nie löschen.
- `.readthedocs.yaml` ist aus der RTD-Zeit übrig und wird nicht mehr genutzt.
- Lokaler Build: `make serve` oder `make build` (`mkdocs build --strict`). `--strict` fängt nav-Referenzen auf fehlende Files ab.
- Nur beschreiben, was der Code wirklich tut; vorher in `../eventmanager` nachlesen. Keine echten Vereins- oder Kundendaten, Beispiele mit `example.com` und RFC-5737-IPs.
