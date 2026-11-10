# Für Admins

Der Admin-Bereich liegt unter `/admin`. In der Navigation erscheint **Admin** für Konten mit dem Haken **Admin** und für globale Admins.

## Bereiche

| Bereich | Wer ihn sieht | Inhalt |
| --- | --- | --- |
| Event | Trainer, Tourenbegleiter, globale Admins | alle Touren als Tabelle. Trainer und Tourenbegleiter sehen nur ihre eigenen. |
| Hütten, Hüttenbuchungen | Trainer, Tourenbegleiter, globale Admins | siehe [Hütten](huts.md) |
| Mitglieder | Admins und globale Admins | Konten prüfen und Rollen setzen |
| System, User | globale Admins | alle Felder aller Konten |
| System, Config | globale Admins | [Einstellungen](../config/settings.md) |
| System, Log | globale Admins | Protokoll der Anwendung |

Trainer und Tourenbegleiter ohne Haken **Admin** sehen den Punkt nicht in der Navigation. Sie erreichen ihre Bereiche direkt über `/admin`.

## Neue Mitglieder prüfen

Wer sich registriert, hat zuerst keine Vereinsrolle. In der Teilnehmerliste steht er als „Nicht überprüft“. Unter **Admin, Mitglieder** setzt ein Admin die Rolle, zum Beispiel nach einem Abgleich mit der Mitgliederliste des Vereins.

Direkt in der Liste lassen sich ändern: Rolle, Bildfreigabe, Datenfreigabe, Admin und gesperrt (disabled).

Konten, die globaler Admin sind, kann nur ein globaler Admin ändern oder löschen.

## Konten sperren und löschen

- **Sperren** (disabled): Das Konto kann sich nicht mehr anmelden, laufende Sitzungen enden. Die Daten bleiben.
- **Löschen:** Die gebuchten Tickets bleiben für die Abrechnung erhalten und erscheinen als „Gelöschter Account“. Das Konto wird aus den Verantwortlichen aller Touren und aus den Hütten-Admins entfernt. Seine Hüttenbuchungen bleiben ohne Konto stehen.

## Passwort setzen

Unter **System, User** lässt sich ein neues Passwort für ein Konto eintragen. Mit **Force Password Change** muss der Nutzer es bei der nächsten Anmeldung ändern, bevor er etwas anderes tun kann.

Ein vergessenes Admin-Passwort setzt man auf dem Server neu:

```bash
./helper create_user admin@example.com
```

In Produktion mit `docker compose ... exec application flask --app app create_user admin@example.com`, siehe [Produktion mit Docker Compose](../installation/production.md#ersten-admin-anlegen).
