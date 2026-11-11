# Datenmodell

Die Daten liegen in MongoDB und werden mit MongoEngine gelesen und geschrieben. Die Daten einer Tour sind stark in einem Dokument zusammengefasst.

- **`Event`:** die Tour. `Event.tickets` enthält die Ticket-*Definitionen* (`Ticket`). `Event.participations` enthält pro Anmeldung eine eingebettete `EventParticipation`.
- **`EventParticipation`:** Verweis auf den buchenden `User` und die Liste der gebuchten Tickets (`OwnedTicket`).
- **`EventParticipation.booking_ref`:** kurze Buchungsnummer mit 6 Zeichen, ohne die leicht verwechselbaren 0/O und 1/I/L, über alle Touren eindeutig. Neue Anmeldungen bekommen sie sofort. Ältere bekommen sie beim ersten Aufruf von „Meine Buchung“ oder „Abrechnung“ (`Event.ensure_booking_refs()`). Sie dient als Verwendungszweck bei Überweisungen.
- **`OwnedTicket.ticket_id`:** UUID, fester Bezug für Änderungen per AJAX.
- **`User.event_registrations`:** Rückverweis vom Konto auf seine Touren. Er wird von Hand gepflegt. Wer Tickets anlegt oder entfernt, hält beide Seiten gleich.
- **`Hut`** mit eingebetteten Zimmern (`HutRoom`) und **`HutBooking`** in einer eigenen Collection.
- **`Section`:** eine Sektion mit Adressen, Aussehen, Mailversand, Abo-Daten, `partner_sections` und `require_approval`. Touren, Hütten und Hüttenbuchungen tragen ein Feld `section`; `objects` liefert nur die der Sektion des Requests, `all_objects` alle.
- **`User.memberships`:** eingebettete `Membership` je Sektion mit Rolle, Admin-Haken, Mitgliedsnummer und `guest`. `user.role` und `user.admin` lesen die Mitgliedschaft der Sektion des Requests.
- **`User.join_requests`:** eingebettete `JoinRequest` (Sektion, Mitgliedsnummer, `notified`, Datum) bis die Admins aufnehmen oder ablehnen. Ob ein Konto eingeloggt sein darf, entscheidet `User.may_use_section()`.
- **`Config`:** die Einstellungen aus dem Admin, siehe [Einstellungen im Admin](../config/settings.md).

Hilfsmethoden auf `Event`: `get_booked_ticket`, `get_tickets_of_user`, `delete_ticket`, `get_ticket_stats`, `get_numbers`. Sie sind besser als eine eigene Schleife über die Teilnahmen.

Fast alle Dokumente haben `meta = {'strict': False}`. Ein Tippfehler im Namen eines Attributs fällt deshalb beim Speichern nicht auf.
