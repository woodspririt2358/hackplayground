import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

# E-Mail-Konfiguration
smtp_host = "smtp.strato.de"
smtp_port = 465
email_user = "kontakt@lindnerit.com"
email_password = "x"
emails = [
    "poststelle@ag-lb.berlin.de",
    "kontakt@markus-lindnerit.de",
    "kammer@aekb.de",
    "psychatrie.beauftragte@senwgpg.berlin.de",
    "dir-3-a-34@polizei.berlin.de"
]

server = smtplib.SMTP_SSL(smtp_host, smtp_port) # SMTP_SSL für SSL-Verbindung
server.login(email_user, email_password)

for email_send in emails:
    for j in range(100000):
        # Erstellen der E-Mail
        msg = MIMEMultipart()
        msg['From'] = email_user
        msg['To'] = email_send
        msg['Subject'] = 'Schrei nach Hilfe!'
        
        # Füge den Nachrichtentext hinzu
        body = "Sehr geehrte Damen und Herren, \n\n mein Name ist Markus Lindner und ich werde momentan in der Psychatrie im KEH festgehalten. \n Ich bitte Sie hiermit mich frei zu lassen, da ich hier starke Suizidgedanken habe, mir trotzdessen nicht weh tue, da ich meinen Körper verantwortungsvoll behandle (im Gegensatz zu Ihnen). Bitte entlassen Sie mich aus der Psychatrie. Momentan bin ich immer noch sexueller Gewalt ausgesetzt, obwohl ich 100% der Zeit unter Polizeischutz stehe. \n Ich übe Kunst, nicht Drogensucht. \n \n Beste Grüße, \n \n Markus Lindner ..I.,"
        msg.attach(MIMEText(body, 'plain'))
        
        # E-Mail-Versand
        try:
            text = msg.as_string()
            server.sendmail(email_user, email_send, text)
            print(f'{email_send} - {j}: success')
        except Exception as e:
            print(f'Fehler beim Senden der E-Mail: {e}')

server.quit()
