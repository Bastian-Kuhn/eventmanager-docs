# Sektionen und Konten

Eine Installation kann mehrere Sektionen oder Vereine bedienen. Jede Sektion hat ihre eigene Adresse, zum Beispiel `touren.example.com`, und sieht nur ihre eigenen Touren, Hütten und Mitglieder.

## Ein Konto, mehrere Mitgliedschaften

Ein Konto gilt mit derselben E-Mail-Adresse in allen Sektionen. Was in einer Sektion gilt, steht in einer **Mitgliedschaft**: Rolle, Haken **Admin** und Mitgliedsnummer. Eine Rolle aus der einen Sektion gibt in einer anderen keine Rechte.

In der Mitgliederliste steht in der Spalte **Gast aus** die Heimatsektion, wenn das Konto eigentlich zu einer anderen Sektion gehört.

## Wo man sich anmelden kann

| Konto | Anmeldung in der Sektion |
| --- | --- |
| Mitglied der Sektion | geht |
| Ohne jede Mitgliedschaft, zum Beispiel neu registriert | geht und wird Mitglied ohne Rolle, außer die Sektion verlangt eine Freigabe |
| Mitglied einer Partnersektion | geht und wird Gast, außer die Sektion verlangt eine Freigabe |
| Mitglied einer anderen Sektion | geht nicht, es entsteht eine Beitrittsanfrage |
| Globaler Admin | geht überall, ohne Mitgliedschaft |

Wer abgewiesen wird, sieht einen Hinweis. Die Admins der Sektion bekommen einmal pro Anfrage eine Mail. Weitere Versuche zeigen nur, dass die Anfrage noch offen ist.

Wer schon eingeloggt ist und keine Mitgliedschaft mehr hat, wird beim nächsten Seitenaufruf abgemeldet. Meldet er sich wieder an, entsteht die Anfrage.

## Freigabe für neue Mitglieder

Im Portal unter **Einstellungen, Anmeldung** lässt sich einstellen: **Neue Mitglieder erst nach Freigabe durch die Admins**. Dann gilt:

- Wer sich neu registriert, wird nicht sofort Mitglied. Die Registrierung stellt eine Beitrittsanfrage mit der angegebenen Mitgliedsnummer.
- Die Admins sehen die Anfrage erst, wenn die E-Mail-Adresse bestätigt ist. Die Mail an die Admins geht beim ersten Anmeldeversuch raus.
- Auch Mitglieder von Partnersektionen werden erst nach Freigabe Gast.
- Bisherige Mitglieder bleiben Mitglied.

## Beitrittsanfragen bearbeiten

Im Admin-Panel unter **Beitrittsanfragen** stehen alle offenen Anfragen mit Name, E-Mail-Adresse, Heimatsektion, Mitgliedsnummer und Datum.

- **Aufnehmen:** Das Konto wird Mitglied ohne Rolle, mit der Mitgliedsnummer aus der Anfrage. Gehört es zu einer anderen Sektion, steht es als Gast in der Liste. Die Rolle setzt man danach unter **Mitglieder**.
- **Ablehnen:** Die Anfrage verschwindet. Meldet sich das Konto erneut an, entsteht eine neue.

## Touren mit Partnersektionen teilen

Im Portal unter **Touren teilen** sucht man eine andere Sektion und schickt eine Anfrage. Geteilt wird erst, wenn beide Seiten einander eingetragen haben. **Beenden** hebt das Teilen auf.

- Mitglieder sehen und buchen die Touren der Partner auf der Seite ihrer eigenen Sektion.
- Eine Tour mit dem Haken **Nur für Mitglieder dieser Sektion** im Tourformular wird nicht geteilt.
- Verwaltet wird jede Tour nur in der Sektion, der sie gehört. Dort sehen die Verantwortlichen die Buchungen aus den Partnersektionen.
- Bei einer geteilten Tour gilt der Einwilligungstext für Fotos und Videos der Sektion, der die Tour gehört.

## Portal

Das Portal ist eine eigene Adresse (Server-Variable `PORTAL_HOSTNAME`) ohne Sektion. Dort:

- registriert man eine neue Sektion mit einem Admin-Konto. Danach läuft eine Testphase, 30 Tage, einstellbar mit `TRIAL_DAYS`.
- pflegen Admins einer Sektion Name, Mitgliederzahl, Aussehen, Kategorien, Einwilligungstext, Mailversand und die Freigabe für neue Mitglieder.
- schließen sie unter **Abrechnung** das Abo ab und sehen ihre Rechnungen.
- verwalten sie unter **Touren teilen** ihre Partnersektionen.

Globale Admins sehen im Portal alle Sektionen mit Suche, geben Sektionsadmins frei, deren Bestätigungsmail nicht ankam, und können eine Sektion mit allen Daten löschen. Die Standardsektion und Sektionen mit laufendem Abo lassen sich nicht löschen.
