# Rollen und Rechte

Jedes Konto hat eine Vereinsrolle und zwei Haken für Admin-Rechte. Die Rolle setzt ein Admin unter **Admin, Mitglieder**. Die Haken stehen am Konto.

## Vereinsrollen

| Rolle | Rechte |
| --- | --- |
| keine (neu registriert) | Touren buchen, eigene Buchung bearbeiten, Hütten buchen. Die Teilnehmerliste einer Tour erst mit einem bestätigten Ticket. |
| Kein Vereinsmitglied | wie oben, dazu die Teilnehmerliste jeder Tour, bei der man angemeldet ist |
| Vereinsmitglied | wie Kein Vereinsmitglied |
| Jugendleiter | wie Kein Vereinsmitglied. Die Rolle steht an Touren als Hinweis, gibt aber keine Rechte zum Anlegen von Touren. |
| Trainer/ Übungsleiter | Touren anlegen und die eigenen verwalten, alle Hütten verwalten |
| Tourenbegleiter | wie Trainer/ Übungsleiter |

Soll ein Jugendleiter Touren anlegen, bekommt er die Rolle Trainer/ Übungsleiter oder Tourenbegleiter.

## Admin-Haken

| Haken | Rechte |
| --- | --- |
| Admin | zusätzlich den Bereich **Mitglieder** im Admin: Rollen setzen, Konten sperren und löschen |
| Global Admin | alles, auch alle Touren, die Einstellungen und die Konten anderer Admins |

Global Admin setzt nur ein globaler Admin unter **System, User** oder `create_user` auf dem Server.

## Eigene Touren

Trainer und Tourenbegleiter verwalten nur Touren, bei denen sie als Verantwortliche eingetragen sind. Verwalten heißt: bearbeiten, löschen, Teilnehmer bestätigen, Preise ändern, Abrechnung, Finanzen und Export.

- Wer eine Tour anlegt, wird ihr Verantwortlicher.
- Weitere Verantwortliche trägt der Verantwortliche selbst oder ein globaler Admin im Admin unter **Event** ein.
- Touren ohne Verantwortliche verwaltet nur ein globaler Admin.
- Klonen geht mit jeder Tour. Die Kopie gehört dem, der sie speichert.

Globale Admins verwalten alle Touren.

## Hütten

Die Buchungen einer Hütte verwalten alle Trainer, Tourenbegleiter und globalen Admins sowie die Hütten-Admins dieser Hütte. Hütten-Admins brauchen dafür keine besondere Vereinsrolle. Siehe [Hütten](../usage/huts.md).

## Übersicht

| Was | Ohne Rolle | Mitglied | Trainer, Tourenbegleiter | Admin | Global Admin |
| --- | --- | --- | --- | --- | --- |
| Touren buchen | ja | ja | ja | ja | ja |
| Teilnehmerliste eigener Anmeldungen | mit bestätigtem Ticket | ja | ja | wie Rolle | ja |
| Touren anlegen | nein | nein | ja | wie Rolle | ja |
| Touren verwalten | nein | nein | nur eigene | wie Rolle | alle |
| Hüttenbuchungen verwalten | als Hütten-Admin | als Hütten-Admin | alle Hütten | wie Rolle | alle Hütten |
| Mitglieder verwalten | nein | nein | nein | ja | ja |
| Einstellungen, Konten, Log | nein | nein | nein | nein | ja |

„Wie Rolle“ heißt: Der Admin-Haken allein gibt dieses Recht nicht, es kommt aus der Vereinsrolle.
