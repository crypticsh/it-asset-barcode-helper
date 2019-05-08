IniRead, SnipeITURL, %A_ScriptDir%/config.ini, General, ChromeScaling
IniRead, SnipeITURL, %A_ScriptDir%/config.ini, General, SnipeITURL
Title = Accessory Check-Out
MenuNumber = 4

Gui, Destroy
Gui, Add, Picture, x5 y10 w450 h220 , %A_ScriptDir%\BarcodeImages\%MenuNumber%.PNG
Gui, Add, Edit, vGUICodeScanned x160 y240 w120 h20
Gui, Add, Button, Default gOK, OK
Gui, Add, Text,  x195 y270 w120 h20, or Press ENTER
Gui, Show, xCenter yCenter h300 w450, %Title%
SoundPlay, %A_ScriptDir%\audio\%MenuNumber%.mp3
return

OK:
Gui, Submit

SendMode, Input

Run, %SnipeITURL%/accessories/%GUICodeScanned%/checkout

imagesearch1:				; Image search to look for Select a User (to be able to click it)
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\images\%ChromeScaling%-SelectaUser.PNG
			if ErrorLevel = 0
				{
					;MsgBox, Found the user picker at %FoundX%x%FoundY%, clicking after enter is pressed...				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
					Sleep 20
					Click, %FoundX%, %FoundY%, 1
					;return
					Sleep 20
					SoundPlay, %A_ScriptDir%\audio\Username.mp3
					Sleep 10000
					Goto, EndThisScript
				}
			
			
			
			
			else if ErrorLevel = 1
				{   
				;MsgBox, Not Found2				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
				imagesearch1 :=
				}
			
			
			
			
			else if ErrorLevel = 2
				{   
				MsgBox, Could not conduct search, maybe I could not find the image file?
				break
				}	
			}

EndThisScript:
ExitApp