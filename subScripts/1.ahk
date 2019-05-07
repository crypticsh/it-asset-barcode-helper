﻿IniRead, SnipeITURL, %A_ScriptDir%/config.ini, General, ChromeScaling
IniRead, SnipeITURL, %A_ScriptDir%/config.ini, General, SnipeITURL
Title = Asset Check-In
MenuNumber = 1

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

Gui, Destroy
Gui, Add, Picture, x5 y10 w450 h220 , %A_ScriptDir%\images\%MenuNumber%\User.PNG
Gui, Add, Picture, x5 y235 w450 h220 , %A_ScriptDir%\images\%MenuNumber%\Asset.PNG
Gui, Add, Picture, x5 y460 w450 h220 , %A_ScriptDir%\images\%MenuNumber%\Location.PNG
Gui, Add, Edit, vScannedCode2 x160 y685 w120 h20
Gui, Add, Button, Default gOK2, OK
Gui, Add, Text,  x195 y715 w120 h20, or Press ENTER %ScannedCode%
Gui, Show, xCenter yCenter h735 w450, %Title%
SoundPlay, %A_ScriptDir%\audio\%MenuNumber%-CheckoutToWhat.mp3
return

OK2:
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
Send, '/checkout {Enter}


ExitApp