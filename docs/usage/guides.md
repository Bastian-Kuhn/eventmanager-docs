# Für Tourenbegleiter

Diese Seite gilt für Konten mit der Rolle **Tourenbegleiter** oder **Trainer/ Übungsleiter** und für globale Admins. Wer was darf, steht unter [Rollen und Rechte](../basics/roles.md).

## Tour anlegen

In der Navigation **Tour erstellen** wählen.

| Feld | Bedeutung |
| --- | --- |
| Touren Name, Event Teaser | Titel und kurzer Text für die Liste. Pflicht. |
| Kategorie | aus den Kategorien in den Einstellungen |
| Touren Typ | Von Guide geführt, Jugendleiter geführt, Gemeinschafts Tour, Event/ Termin |
| Beschreibung | ausführlicher Text mit Editor, Bilder möglich |
| Hütte (Übernachtung) | optional, legt eine Hüttenbuchung an, siehe unten |
| Plätze auf Tour | Anzahl der Personen. Leer heißt ohne Grenze. |
| Mindestteilnehmerzahl | wird auf der Seite der Tour angezeigt |
| Beginn | Pflicht |
| Ende | leer heißt wie Beginn |
| Buchbar ab, Buchbar bis | leer heißt ab sofort bis zum Beginn |
| Schwierigkeit, Kondition, Länge, Strecke, Höhenmeter | Angaben zur Tour. Beim Typ Event/ Termin werden sie nicht angezeigt. |

Bei einer Gemeinschaftstour oder ohne Trainer oder Jugendleiter unter den Verantwortlichen zeigt die Seite einen Hinweis: Es ist keine geführte Tour, jeder muss sie selbständig gehen können.

### Tickets

Jede Tour braucht mindestens ein Ticket, das kein Zusatzticket ist. Vorgegeben ist ein Ticket „Teilnahme“.

| Feld | Bedeutung |
| --- | --- |
| Name | zum Beispiel Teilnahme, Mitglied, Gast |
| Beschreibung | erscheint bei der Anmeldung |
| Preis | in Euro, 0 heißt kostenlos |
| Max. pro Konto | wie oft ein Konto dieses Ticket insgesamt buchen darf, über alle eigenen Anmeldungen |
| Zusatzticket | belegt keinen Platz, zum Beispiel Leihausrüstung oder Busfahrt |

Gibt es nur ein Ticket und ist **Max. pro Konto** leer oder 0, gilt die Zahl der Plätze. Bei mehreren Tickets muss jedes Hauptticket mindestens 1 haben, sonst lässt es sich nicht buchen. Mit **Weiteres Ticket** kommt eine Ticketart dazu.

Gibt es Haupt- und Zusatztickets, wählen Teilnehmer die Zusatztickets pro Person. Bei Zusatztickets heißt **Max. pro Konto** 0 dann ohne Grenze.

### Zusatzfragen

Unter **Extra Frage** lassen sich Fragen anlegen, zum Beispiel „Brauchst du Leihausrüstung?“. Jede Frage ist bei der Anmeldung Pflicht. Die Antworten stehen in der Teilnehmerliste und im CSV-Export.

### Verantwortliche

Wer eine Tour anlegt, wird ihr Verantwortlicher. Ein globaler Admin wird es nur, wenn er **Mich beim speichern als verantwortlichen eintragen** anhakt. Weitere Verantwortliche trägt man im Admin unter **Event** ein.

Alle Verantwortlichen bekommen bei jeder neuen Anmeldung eine Mail und stehen mit Name und Adresse auf der Seite der Tour.

### Klonen

**Klonen** auf der Seite einer Tour öffnet das Formular mit allen Angaben der Tour. Gespeichert wird eine neue Tour ohne Anmeldungen.

## Teilnehmerliste

Die **Teilnehmerliste** einer Tour hat drei Bereiche: bestätigt, Warteliste, unbestätigt. Pro Ticket:

- **bestätigen** oder **auf die Warteliste** setzen
- **löschen**. Das storniert das Ticket. Ist es das letzte Ticket der Anmeldung, verschwindet die ganze Anmeldung.
- einen **Guide** zuordnen und einen **Kommentar** schreiben, den nur Verantwortliche sehen

Die Spalte Rolle zeigt die Vereinsrolle des Buchenden. „Nicht überprüft“ heißt, ein Admin hat noch keine Rolle gesetzt. „Unbekannt“ heißt, das Ticket läuft auf eine andere Person als den Buchenden.

Weitere Knöpfe:

- **Export CSV:** alle bestätigten Teilnehmer mit Kontakt, Einwilligungen, Alter, Kommentar und Antworten auf die Zusatzfragen
- **Mail an Teilnehmer:** öffnet das eigene Mailprogramm mit allen bestätigten Adressen

Zusatztickets stehen gesammelt unter **Kategorien**. Jede Kategorie lässt sich ausblenden und als eigene Liste mit CSV-Export öffnen.

Über **Meine Buchung** mit einem Teilnehmer lassen sich auch dessen Tickets bearbeiten und neue Tickets für ihn anlegen.

## Abrechnung

Die **Abrechnung** zeigt pro Buchendem, was offen ist. Gezählt werden bestätigte Tickets und unbestätigte Zusatztickets. Pro Ticket gibt es diese Zustände:

- **bezahlt**
- **Überweisung vorgemerkt:** angekündigt, aber noch nicht eingegangen
- **frei:** der Teilnehmer zahlt nichts
- **offen**

Der Preis lässt sich pro Ticket ändern oder für eine Ticketart für alle setzen. Die Buchungsnummer jeder Anmeldung steht dabei, sie hilft beim Abgleich mit dem Kontoauszug.

## Finanzen

Unter **Finanzen** stehen die möglichen Einnahmen der Tour und die Ausgaben. Ausgaben trägt man mit Name, Person, Betrag und Datum ein und markiert sie als ausgezahlt.

## Tour löschen

Eine Tour lässt sich über **Bearbeiten** löschen. Das löscht auch alle Anmeldungen und die verknüpfte Hüttenbuchung. Es gibt kein Zurück.

## Hütte zur Tour

Ist bei der Tour eine Hütte gewählt, legt die Anwendung eine Hüttenbuchung über den Zeitraum der Tour an, mit so vielen Plätzen wie die Tour hat. Endet die Tour am selben Tag, gilt eine Nacht. Optional lassen sich einzelne Zimmer wählen.

Verlangt die Hütte eine Freigabe, wartet auch diese Buchung darauf. Ändern sich Hütte, Zeitraum, Plätze oder Zimmer, braucht es eine neue Freigabe.
