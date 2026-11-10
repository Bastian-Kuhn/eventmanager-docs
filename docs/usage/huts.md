# Hütten

Hat der Verein Hütten, lassen sie sich in der Anwendung anlegen und belegen. Mitglieder buchen selbst, die Hütten-Verwaltung gibt frei oder sperrt Zeiträume. In der Navigation heißt der Punkt **Hütte**, wenn es genau eine gibt, sonst **Hütten**.

## Hütte anlegen

Unter **Admin, Hütten**:

| Feld | Bedeutung |
| --- | --- |
| Name, Region/Ort | Pflicht ist nur der Name |
| Bewirtschaftet | Angabe für die Übersicht |
| Freigabe nötig | an: jede Buchung wartet auf Freigabe. Aus: Buchungen sind sofort bestätigt. |
| Selbstbuchung erlaubt | aus: nur die Hütten-Verwaltung trägt Buchungen ein |
| Hütten-Admins | Konten, die die Buchungen dieser Hütte verwalten dürfen |
| Kontakt, Telefon, Link, Notiz | Angaben für die Detailseite |
| Zimmer | Name und Plätze pro Zimmer oder Lager |

Die Plätze aller Zimmer ergeben die Kapazität der Hütte. Ohne Zimmer ist die Kapazität unbekannt. Dann prüft die Anwendung keine freien Plätze.

Eine Hütte zu löschen löscht auch alle ihre Buchungen.

## Buchen als Mitglied

Auf der Seite der Hütte Anreise und Abreise wählen und **Verfügbarkeit prüfen**. Der Kalender zeigt die Belegung pro Tag. Zum Buchen angemeldet sein, dann Plätze, optional Zimmer und einen Kommentar angeben.

Der Abreisetag zählt nicht als belegt. Von Freitag bis Sonntag sind also zwei Nächte.

Grenzen für Mitglieder:

- höchstens 14 Nächte pro Buchung
- höchstens 3 offene Buchungen pro Hütte und Konto
- keine Anreise in der Vergangenheit
- nicht in gesperrten Zeiträumen und nicht über die freien Plätze hinaus

Die eigenen Buchungen stehen im **Profil** und lassen sich dort stornieren.

## Hütten-Verwaltung

Die Buchungen einer Hütte verwalten:

- alle Trainer und Tourenbegleiter sowie globale Admins, für alle Hütten
- die eingetragenen Hütten-Admins, für ihre Hütte

Für sie gibt es in der Navigation **Hütten-Freigaben**. Dort stehen pro Hütte die wartenden und die bestätigten Buchungen. Sie können:

- eine wartende Buchung **freigeben**
- eine Buchung **stornieren** oder ablehnen. Dabei wird sie gelöscht.
- einen Zeitraum **sperren**. Die Sperre belegt alle Plätze.

Für die Hütten-Verwaltung gelten die Grenzen der Mitglieder nicht. Sie darf auch vergangene Belegungen nachtragen und trotz abgeschalteter Selbstbuchung buchen.

Alle Buchungen lassen sich außerdem unter **Admin, Hüttenbuchungen** bearbeiten. Diese Seite sehen Trainer, Tourenbegleiter und globale Admins.

## Hütte bei einer Tour

Eine Tour mit Hütte legt ihre eigene Hüttenbuchung an. Siehe [Für Tourenbegleiter](guides.md#hutte-zur-tour).
