;	Setting images to names
F1=%A_ScriptDir%\MenuBarcodes\1.png
F2=%A_ScriptDir%\MenuBarcodes\2.png
F3=%A_ScriptDir%\MenuBarcodes\3.png
F4=%A_ScriptDir%\MenuBarcodes\4.png
F5=%A_ScriptDir%\MenuBarcodes\5.png
F6=%A_ScriptDir%\MenuBarcodes\6.png
F7=%A_ScriptDir%\MenuBarcodes\7.png
F8=%A_ScriptDir%\MenuBarcodes\8.png
F9=%A_ScriptDir%\MenuBarcodes\9.png

;	Add Pictures of barcodes to menu
Gui Add, Picture, gA1 x5 y10 w450 h220,%f1%
Gui Add, Picture, gA2 x460 y10 w450 h220,%f2%
Gui Add, Picture, gA3 x915 y10 w450 h220,%f3%

Gui Add, Picture, gA4 x5 y240 w450 h220,%f4%
Gui Add, Picture, gA5 x460 y240 w450 h220,%f5%
Gui Add, Picture, gA6 x915 y240 w450 h220,%f6%

Gui Add, Picture, gA7 x5 y470 w450 h220,%f7%
Gui Add, Picture, gA8 x460 y470 w450 h220,%f8%
Gui Add, Picture, gA9 x915 y470 w450 h220,%f9%

;	Add bottom text and buttons and sound
Gui, Add, Edit, vOptionSelected x600 y800 w120 h20
Gui, Add, Button, Default gOK x630 y825, Continue
Gui, Font, s36
Gui, Add, Text,  x100 y725 w1200 h50, Please touch, click, or scan one of the above barcodes.

SoundPlay, %A_ScriptDir%\audio\MainMenuWelcome.mp3

;	Display GUI
Gui Show
return


OK:
Gui, Submit

;MsgBox, The option is: %OptionSelected%				;For Debugging

;	if statements to go to proper option if option is typed or scanned in instead of being clicked
if (OptionSelected = 1){
Goto, A1
}
if (OptionSelected = 2){
Goto, A2
}
if (OptionSelected = 3){
Goto, A3
}
if (OptionSelected = 4){
Goto, A4
}
if (OptionSelected = 5){
Goto, A5
}
if (OptionSelected = 6){
Goto, A6
}
if (OptionSelected = 7){
Goto, A7
}
if (OptionSelected = 8){
Goto, A8
}
if (OptionSelected = 9){
Goto, A9
}

A1:
SoundPlay, thisfiledoesnotexist.mp3
;msgbox,Clicked %f1% running proper 2ndary ahk script...
Run, %A_ScriptDir%\subScripts\1.ahk
return


A2:
SoundPlay, thisfiledoesnotexist.mp3
;msgbox,Clicked %f1% running proper 2ndary ahk script...
Run, %A_ScriptDir%\subScripts\2.ahk
return

A3:
SoundPlay, thisfiledoesnotexist.mp3
Run, %A_ScriptDir%\subScripts\3.ahk
return

A4:
;msgbox,Clicked %f4%
SoundPlay, thisfiledoesnotexist.mp3
Run, %A_ScriptDir%\subScripts\4.ahk
return

A5:
;msgbox,Clicked %f5%
SoundPlay, thisfiledoesnotexist.mp3
Run, %A_ScriptDir%\subScripts\5.ahk
return

A6:
;msgbox,Clicked %f6%
SoundPlay, thisfiledoesnotexist.mp3
Run, %A_ScriptDir%\subScripts\6.ahk
return

A7:
;msgbox,Clicked %f7%
SoundPlay, thisfiledoesnotexist.mp3
Run, %A_ScriptDir%\subScripts\7.ahk
return

A8:
;msgbox,Clicked %f8%
SoundPlay, thisfiledoesnotexist.mp3
Run, %A_ScriptDir%\subScripts\8.ahk
return

A9:
;msgbox,Clicked %f9%
SoundPlay, thisfiledoesnotexist.mp3
Run, %A_ScriptDir%\subScripts\9.ahk
return


!r::
Reload