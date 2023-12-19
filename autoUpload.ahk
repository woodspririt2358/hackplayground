; Funktion, die die Postleitzahl und den Eintrag verarbeitet 
processEntry(plz, entry) {
    ; Klicks und Tastatureingaben für den Eintrag ausführen
    MouseClick "left", 111, 76
    Sleep 1500
    MouseClick "left", 1312, 250
    Sleep 2300
    Send "{tab 7}"

    ; Titel, Geldbetrag, Beschreibung und Bilder senden
    Send entry[1]
    Sleep 1000
    Send "{tab}"
    Sleep 2000
    MouseClick "left", 600, 650

    Send entry[2]

    Sleep 1000
    MouseClick "left", 900, 650
    Send "{tab}"
    Sleep 1000
    Send "{space}{Down}{enter}{tab}"
    MouseClick "left", 620, 750
    Send entry[3]
    Sleep 2300
    Send "{tab}"

    ; Bilder durchgehen und klicken
    for index, value in entry[4] {
        for _, path in value {
            MouseClick "left", 650, 970
            Sleep 1000
            MouseClick "left", 420, 750
            Send path
            Send "{enter}"
            Sleep 2000
        }
    }

    ; PLZ und Abschluss  
    Send "{tab}plz{tab}{enter}"
}

; Funktion, die über die PLZ und Einträge loopt und pro Eintrag die 'processEntry'-Funktion aufruft
handleEntries(plzs, entries) {
    ; Schleife über die PLZ-Array-Elemente
    for plz in plzs {
        ; Schleife über die Einträge für jede PLZ
        for entry in entries {
            ; Rufe die Funktion für die Verarbeitung der PLZ und des Eintrags auf
            processEntry(plz, entry)
        }
    }
}



; Definiere den Hotkey, der die Funktion mit den Array-Parametern aufruft
^#::
{  
    
    ; hole die anzeigeDatei
    filePath := "C:\Users\marku\Desktop\hackplayground\hackplayground\anzeigeItSupport.txt"

    ; Rufe die Funktion auf, um Daten aus der Datei zu lesen und in die entries-Liste einzufügen
    fileContent := FileRead(filePath)

    ; Beispiel-Arrays für PLZ und Einträge
    plzs := ["12347"]
    entries := [
        [
            "Nachhilfe Informatik", "250", fileContent, [
                ["C:\Users\marku\Desktop\hackplayground\gameOfLife\docu\codeOfInternet.jpg"],
                ["C:\Users\marku\Desktop\hackplayground\gameOfLife\docu\codeOfInternet.jpg"]
            ]
        ]
    ]

    ; Rufe die Funktion auf, um über PLZ und Einträge zu iterieren und 'processEntry' aufzurufen
    handleEntries(plzs, entries)
}
