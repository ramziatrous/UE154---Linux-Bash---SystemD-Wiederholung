# Aufgabe 1: Theorie

### Grundlagen von Bash Scripting

   1. Was ist der Zweck des Shebang (`#!/bin/bash`) am Anfang eines Bash-Skripts?

- Der Shebang (#!/bin/bash) am Anfang eines Bash-Skripts dient dazu, dem System mitzuteilen, welche Shell für die Ausführung des Skripts verwendet werden soll. In diesem Fall gibt es an, dass das Skript mit der Bash-Shell interpretiert werden soll.

### Funktionsdefinition in Bash:

  2. Wie definierst und rufst du eine Funktion in Bash auf, die die Netzwerklatenz misst?

- function messung_latenz() {
}
- messung_latenz

### I/O-Redirection in Bash:
   3. Wie leitest du die Ausgabe eines Befehls in eine Datei um, beispielsweise die gemessene Latenz in `latency_data.txt`?
- befehl_zur_messung_latenz > latency_data.txt


### SystemD Unit-Management:
   4. Wie erstellst und aktivierst du eine SystemD Unit, um ein Skript regelmäßig auszuführen?
- [Unit]
Description=Mein Skript

[Service]
ExecStart=/pfad/zum/deinem/skript.sh

[Install]
WantedBy=default.target
- sudo systemctl enable dein-skript.service
- sudo systemctl start dein-skript.service

### BashRc Anpassungen:
   5. Was musst du tun, um Änderungen in der `.bashrc`-Datei sofort wirksam zu machen?
- source ~/.bashrc

