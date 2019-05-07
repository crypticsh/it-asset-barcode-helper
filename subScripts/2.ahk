MsgBox, 2.ahk ran!

ChromeScaling = 125
SnipeITURL = https://demo.snipeitapp.com

;!b::
Gui, Destroy
Gui, Add, Picture, x5 y10 w450 h220 , %A_ScriptDir%\BarcodeImages\ScanBin.PNG
Gui, Add, Edit, vBinBarcode x160 y240 w120 h20
Gui, Add, Button, Default gOK, OK
Gui, Add, Text,  x195 y270 w120 h20, or Press ENTER
Gui, Show, xCenter yCenter h300 w450, Asset Check-In
SoundPlay, %A_ScriptDir%\audio\Consumable1.mp3
return

OK:
Gui, Submit

Run, %SnipeITURL%/consumables/%BinBarcode%/checkout
Exit