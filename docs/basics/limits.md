# Grenzen und Schutz

Die Anwendung begrenzt Anfragen und Eingaben, damit niemand Touren oder Hütten blockiert, Passwörter durchprobiert oder Mails in Massen auslöst. Die Zähler liegen in Redis.

## Anmeldung und Konto

| Was | Grenze | Gezählt pro |
| --- | --- | --- |
| Login, auch das Login auf der Seite einer Tour | 10 pro Minute, 60 pro Stunde | IP-Adresse |
| Fehlversuche beim Login | 10 in 15 Minuten, danach 15 Minuten gesperrt | E-Mail-Adresse |
| Registrieren | 4 pro Minute, 1 pro Sekunde | IP-Adresse |
| Passwort vergessen | 5 pro Minute, 20 pro Stunde | IP-Adresse |
| Passwort ändern, zurücksetzen, E-Mail bestätigen | 10 pro Minute | IP-Adresse |
| Mails zum Bestätigen und Zurücksetzen zusammen | 3 pro Stunde | Empfängeradresse |

IPv6-Adressen zählen pro /64-Netz, weil ein Anschluss meist ein ganzes /64 bekommt.

Die Sperre nach Fehlversuchen gilt auch für Adressen ohne Konto. So verrät sie nicht, wer ein Konto hat. Aus demselben Grund antwortet die Registrierung bei einer schon vergebenen Adresse genauso wie bei einer neuen.

## Bestätigung der E-Mail-Adresse

Neue Konten können sich erst anmelden, wenn die Adresse bestätigt ist. Zum Bestätigen braucht es den Link aus der Mail und das Passwort aus der Registrierung. Ein Programm, das Links in Mails automatisch öffnet, bestätigt so nichts. Konten aus dem Admin oder aus `create_user` gelten als bestätigt.

## Buchungen

| Was | Grenze |
| --- | --- |
| Anmeldungen zu Touren | 5 pro Minute, 30 pro Stunde und Konto |
| Hüttenbuchungen | 5 pro Minute, 30 pro Stunde und Konto |
| Tickets einer Ticketart | höchstens **Max. pro Konto**, über alle Anmeldungen des Kontos zusammen |
| Nächte pro Hüttenbuchung | 14 |
| Offene Hüttenbuchungen | 3 pro Hütte und Konto |

Die Grenzen für Hütten gelten nicht für die Hütten-Verwaltung.

Gleichzeitige Anmeldungen zur selben Tour laufen nacheinander. So wird keine Tour überbucht, auch wenn am Stichtag viele gleichzeitig buchen. Dauert das Warten länger als 20 Sekunden, bittet die Seite um einen neuen Versuch.

## Länge von Eingaben

| Feld | Höchstens |
| --- | --- |
| Vor- und Nachname bei der Registrierung | 50 Zeichen, nur Buchstaben und übliche Trennzeichen |
| Name auf einem Ticket | 100 Zeichen |
| E-Mail-Adresse | 254 Zeichen |
| Handynummer, Mitgliedsnummer | 50 Zeichen |
| Kommentar | 1000 Zeichen |
| Antwort auf eine Zusatzfrage | 500 Zeichen |

## Wenn Redis ausfällt

Ohne Redis greifen die Anfragelimits nicht, Login und Mails funktionieren weiter. Buchungen brauchen Redis für die Sperre gegen Überbuchung. Redis sollte deshalb immer laufen. In Produktion startet es von selbst neu.
