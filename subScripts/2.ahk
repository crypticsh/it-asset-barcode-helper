﻿ChromeScaling = 125
SnipeITURL = https://demo.snipeitapp.com
Title = Asset Check-Out
MenuNumber = 2

Gui, Destroy
Gui, Add, Picture, x5 y10 w450 h220 , %A_ScriptDir%\BarcodeImages\%MenuNumber%.PNG
Gui, Add, Edit, vScannedCode x160 y240 w120 h20
Gui, Add, Button, Default gOK, OK
Gui, Add, Text,  x195 y270 w120 h20, or Press ENTER
Gui, Show, xCenter yCenter h300 w450, %Title%
SoundPlay, %A_ScriptDir%\audio\%MenuNumber%.mp3
return

OK:
Gui, Submit

SendMode, Input

Run, %SnipeITURL%
Sleep 2000
Send, %ScannedCode% {Enter}
Sleep 1500
Send, {LAlt Down}d{LAlt Up}
Sleep 100
Send, {End}
Sleep 100
Send, '/checkin {Enter}


ExitApp