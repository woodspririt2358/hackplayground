; Funktion, die die Postleitzahl und den Eintrag verarbeitet (noch nicht implementiert)
processEntry(plz, entry) {
    ; Klicks und Tastatureingaben für den Eintrag ausführen
    MouseClick "left", 111, 76
    Sleep 1500
    MouseClick "left", 1312, 250
    Sleep 2300
    Send "{tab 7}"

    ; Titel, Geldbetrag, Beschreibung und Bilder senden
    Send "{entry[0]}Informatik nachhilfe"
    Sleep 3000  
    Send "{tab}{tab}"
    Send "{entry[1]}250"
    Sleep 3000
    MouseClick "left", 900, 650
    Send "{tab}"
    Sleep 1000
    Send "{space}{Down}{enter}{tab}"
    Send "{entry[2]}test"
    Sleep 2300
    Send "{tab}"

    ; Bilder durchgehen und klicken
    for index, value in entry[3] {
        for _, path in value {
            MouseClick "left", 650, 950
            Send "{path}C:\Users\marku\Desktop\businees\img_0008_v2_1.jpg{enter}"
            Sleep 2000
        }
    }

    ; PLZ und Abschluss
    Send "{tab}plz{tab}{enter}"
}

; Funktion, die über die PLZ und Einträge loopt und pro Eintrag die 'processEntry'-Funktion aufruft
handleEntries(plzs, entries) {
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
^#::
{  
    ; Beispiel-Arrays für PLZ und Einträge
    plzs := ["12345"]
    entries := [
        ["rawr", "250", "test", "test", [
            ["C:\Users\marku\Desktop\businees\img_0008_v2_1.jpg"],
            ["C:\Users\marku\Desktop\businees\img_0008_v2_2.jpg"]
        ]]
    ]
    ; Rufe die Funktion auf, um über PLZ und Einträge zu iterieren und 'processEntry' aufzurufen
    handleEntries(plzs, entries)
}
