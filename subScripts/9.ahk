ChromeScaling = 125
SnipeITURL = https://demo.snipeitapp.com
Title = Component Receiving
MenuNumber = 9

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

Run, %SnipeITURL%/components/%ScannedCode%/edit
Sleep, 1000
Send, {TAB 30}
Sleep, 1000
Send, {Ctrl Down}c{Ctrl Up}
Sleep, 1000
VarInventoryAdd = 5
VarCurrentInventory = %clipboard%
VarSum := (VarInventoryAdd + VarCurrentInventory)
;MsgBox, Verify the following before hitting Enter`n`n`n25Current Inventory:%clipboard%`n+ Adding to Inventory:%VarInventoryAdd%`n`n= New Inventory Total:%VarSum%

Gui, Destroy
Gui, Font, s12
Gui, Add, Button, x275 y175 gOK2, Accept Changes
Gui, Add, Button, x210 gCancel, Cancel, I will manually edit inventory
Gui, Font, s24
Gui, Add, Text,  x15 y15 w725 h45, Verify the following before accepting changes:
Gui, Font, s12
Gui, Add, Text,  x250 y75 w425 h20, Current Inventory:%clipboard%
Gui, Add, Text,  x250 y100 w425 h20, Adding to Inventory:%VarInventoryAdd%
Gui, Add, Text,  x250 y125 w425 h20, New Inventory Total:%VarSum%
Gui, Show, xCenter yCenter h300 w730, Inventory Update Verification
return

Cancel:
ExitApp

OK2:
Gui, Submit


Sleep 50
Send, %VarSum%

ExitApp