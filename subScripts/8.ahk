ChromeScaling = 125
IniRead, SnipeITURL, %A_ScriptDir%/config.ini, General, SnipeITURL
Title = Consumable Receiving
MenuNumber = 8

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

Run, %SnipeITURL%/consumables/%ScannedCode%/edit
Sleep, 2000
Send, {TAB 40}
Sleep, 2000
Send, {Ctrl Down}c{Ctrl Up}
Sleep, 1000
VarInventoryAdd = 5
VarCurrentInventory = %clipboard%
VarSum := (VarInventoryAdd + VarCurrentInventory)
MsgBox, Verify the following before hitting Enter`n`n`n25Current Inventory:%clipboard%`n+ Adding to Inventory:%VarInventoryAdd%`n`n= New Inventory Total:%VarSum%
Sleep 50
Send, %VarSum%

ExitApp