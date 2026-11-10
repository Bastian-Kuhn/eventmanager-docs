# Einstellungen im Admin

Die Einstellungen, die sich im Betrieb ändern, liegen in der Datenbank. Man pflegt sie unter **Admin, System, Config**. Diese Seite sehen nur globale Admins.

!!! warning "Genau ein aktiver Eintrag"
    Die Anwendung nutzt den Eintrag, bei dem **Enabled** angehakt ist. Ohne aktiven Eintrag verschickt sie keine Mails, ganz ohne Fehlermeldung. Bei mehr als einem aktiven Eintrag fehlen die Kategorien. Deshalb immer genau einen Eintrag aktiv halten.

Änderungen greifen nach spätestens 60 Sekunden. So lange hält die Anwendung die Einstellungen im Speicher.

## Mailversand

| Feld | Bedeutung |
| --- | --- |
| Mail Server | Name des SMTP-Servers, zum Beispiel `mail.example.com` |
| Mail Username | Benutzername für den SMTP-Server |
| Mail Password | Passwort für den SMTP-Server |
| Mail Sender | Absenderadresse, zum Beispiel `touren@example.com` |
| Mail Subject Prefix | Text vor jedem Betreff, zum Beispiel `[Touren]` |

Die Anwendung verbindet sich immer per SSL auf Port 465. Ein Server, der nur Port 587 mit STARTTLS anbietet, funktioniert nicht.

Die Anwendung verschickt diese Mails:

- **E-Mail-Adresse bestätigen** an neue Mitglieder nach der Registrierung
- **Neues Passwort** mit einem Link zum Zurücksetzen, angefordert über „Passwort vergessen“
- **Neue Anmeldung** an alle Verantwortlichen einer Tour, sobald sich jemand anmeldet

Teilnehmer bekommen nach der Anmeldung zu einer Tour keine Mail. Sie sehen ihre Buchung unter **Meine Buchung**.

## Aussehen

| Feld | Bedeutung |
| --- | --- |
| Nav Background Color | Hintergrundfarbe der Navigation als CSS-Farbe, zum Beispiel `#2e7d32`. Ohne aktiven Eintrag ist sie grau. |
| Logo Image | Logo oben links in der Navigation |
| Homepage Link | Ziel beim Klick auf das Logo, zum Beispiel die Website des Vereins |

Auf ausreichenden Kontrast zwischen Navigationsfarbe und weißer Schrift achten.

## Kategorien für Touren

Unter **Event Categories Full** legt man Kategorien mit Name und Farbe an, zum Beispiel „Skitour“ oder „Klettern“. Tourenbegleiter wählen die Kategorie beim Anlegen einer Tour. In der Tourenliste lässt sich danach filtern.

Das Feld **Event Categories** ohne „Full“ nutzt die Anwendung nicht mehr.

## Einwilligungstext Foto und Video

Das Feld **Einwilligungstext Foto/Video (HTML)** erscheint bei der Registrierung, im Profil und bei der Anmeldung zu einer Tour. Die Anwendung zeigt das HTML so an, wie es eingetragen ist. Deshalb nur Text von vertrauenswürdigen Admins hier eintragen.

Leer gelassen zeigt die Anwendung ihren eingebauten Standardtext. Das ist die Einwilligung des Vereins, für den die Anwendung entstanden ist, mit dessen Namen und Kanälen. Jeder andere Verein trägt hier seinen eigenen Text ein.
