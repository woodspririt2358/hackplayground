#NoEnv
#SingleInstance Force

; Funktion, die die Postleitzahl und den Eintrag verarbeitet (noch nicht implementiert)
processEntry(plz, entry) {
    
    
    MouseClick "left", 111, 76
    Sleep 1500
    MouseClick "left", 1312, 250
    Sleep 2300
    Send {tab}{tab}{tab}{tab}{tab}{tab}{tab}

    ; titel
    Send entry[0]
    Send {tab}{tab}

    ; money
    Send entry[1]
    Send {tab}{space}{Down}{enter}{tab}

    ; beschreibung
    Send entry[2]
    Send {tab}

    ; bilder
    for index, value in entry[3] {
        Send {space}value{enter}
        Sleep 2000
    }


}

; Funktion, die über die PLZ und Einträge loopt und pro Eintrag die 'processEntry'-Funktion aufruft
handleEntries(plzs, entries) {
    global  ; Ermöglicht den Zugriff auf globale Variablen
    ; Schleife über die PLZ-Array-Elemente
    for index, plz in plzs {
        ; Schleife über die Einträge für jede PLZ
        for entryIndex, entry in entries {
            ; Rufe die Funktion für die Verarbeitung der PLZ und des Eintrags auf
            processEntry(plz, entry)
        }
    }
}

; Definiere den Hotkey, der die Funktion mit den Array-Parametern aufruft
^!a::  ; Strg + Alt + A als Hotkey festlegen
    ; Beispiel-Arrays für PLZ und Einträge
    plzs := ["12345", "54321"]
    entries := ["Eintrag 1", "Eintrag 2", "Eintrag 3"]

    ; Rufe die Funktion auf, um über PLZ und Einträge zu iterieren und 'processEntry' aufzurufen
    handleEntries(plzs, entries)
return
