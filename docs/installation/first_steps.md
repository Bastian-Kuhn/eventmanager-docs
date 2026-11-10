# Erste Schritte

Nach der Installation gibt es nur das Konto aus `create_user`. Diese Schritte machen die Anwendung für den Verein nutzbar.

## 1. Anmelden

Mit der E-Mail-Adresse und dem ausgegebenen Passwort unter `/login` anmelden. In der Navigation erscheint der Punkt **Admin**.

Das Passwort ändern geht im **Profil** oben rechts.

## 2. Einstellungen anlegen

Unter **Admin, System, Config** einen Eintrag anlegen und **Enabled** anhaken. Dort stehen Mailserver, Logo, Farbe der Navigation und die Kategorien für Touren. Ohne aktiven Eintrag verschickt die Anwendung keine Mails. Details: [Einstellungen im Admin](../config/settings.md).

## 3. Mailversand prüfen

Unter `/user/create` ein Testkonto mit einer eigenen Adresse registrieren. Kommt die Mail zur Bestätigung an, funktioniert der Versand.

## 4. Tourenbegleiter freischalten

Wer Touren anbieten soll, registriert sich selbst. Danach setzt ein Admin unter **Admin, Mitglieder** die Rolle auf **Tourenbegleiter** oder **Trainer/ Übungsleiter**. Siehe [Rollen und Rechte](../basics/roles.md).

## 5. Hütten eintragen (optional)

Hat der Verein Hütten, unter **Admin, Hütten** anlegen, mit Zimmern und Plätzen. Siehe [Hütten](../usage/huts.md).

## 6. Erste Tour anlegen

Über **Tour erstellen** in der Navigation. Siehe [Für Tourenbegleiter](../usage/guides.md).
