﻿IniRead, ChromeScaling, %A_ScriptDir%/config.ini, General, ChromeScaling
IniRead, SnipeITURL, %A_ScriptDir%/config.ini, General, SnipeITURL
IniRead, TagPrefix, %A_ScriptDir%/config.ini, General, TagPrefix
IniRead, DBHost, %A_ScriptDir%/config.ini, Database, DBHost
IniRead, DBPort, %A_ScriptDir%/config.ini, Database, DBPort
IniRead, DBName, %A_ScriptDir%/config.ini, Database, DBName
IniRead, DBSelectUsername, %A_ScriptDir%/config.ini, Database, DBSelectUsername
IniRead, DBSelectPassword, %A_ScriptDir%/config.ini, Database, DBSelectPassword
Title = Asset Check-Out
MenuNumber = 1


;	Setting images to names
F1=%A_ScriptDir%\images\%MenuNumber%\User.PNG
F2=%A_ScriptDir%\images\%MenuNumber%\Asset.PNG
F3=%A_ScriptDir%\images\%MenuNumber%\Location.PNG


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
Gui, Add, Picture, gA1 x5 y10 w357 h220 , %F1%
Gui, Add, Picture, gA2 x367 y10 w357 h220 , %F2%
Gui, Add, Picture, gA3 x729 y10 w357 h220 , %F3%
Gui, Add, Edit, vScannedCode2 x475 y250 w120 h20
Gui, Add, Button, Default gOK2, OK
Gui, Add, Text,  x195 y275 w200 h20, Select the asset location for:  %ScannedCode%
Gui, Show, xCenter yCenter h300 w1091, %Title%
SoundPlay, %A_ScriptDir%\audio\%MenuNumber%-CheckoutToWhat.mp3
return

OK2:
Gui, Submit


If InStr( ScannedCode, %TagPrefix%)
	{
		SendMode, Input

		FormatTime, TimeString,YYMMDDHH24MISS,yyMMddhhmmss
		;MsgBox The current 24-hour time is %TimeString%.

		; Query DB
		;Run, C:\Program Files\MySQL\MySQL Workbench 8.0 CE\mysql.exe %DBName% -u %DBSelectUsername% -p%DBSelectPassword% -h %DBHost% --port %DBPort% -ss -e "SELECT id from assets where asset_tag='%ScannedCode%'" > C:\Users\it_assetmgmt\Desktop\DBTemp\%TimeString%.txt
		FileAppend, "C:\Program Files\MySQL\MySQL Workbench 8.0 CE\mysql.exe" %DBName% -u %DBSelectUsername% -p%DBSelectPassword% -h %DBHost% --port %DBPort% -ss -e "SELECT id from assets where asset_tag='%ScannedCode%'" > C:\Users\it_assetmgmt\Desktop\DBTemp\%TimeString%.txt, C:\Users\it_assetmgmt\Desktop\DBTemp\%TimeString%.bat
		Runwait, C:\Users\it_assetmgmt\Desktop\DBTemp\%TimeString%.bat

		Sleep, 100

		;read sql output file assigned to variable
		FileRead, idOfTag, C:\Users\it_assetmgmt\Desktop\DBTemp\%TimeString%.txt
		;Msgbox, idOfTag is %idOfTag%

		Run, %SnipeITURL%/hardware/%idOfTag%/checkout
		GoTo, Continue

	}

else
{
Run, %ScannedCode%/checkout
}


Continue:
Msgbox, Continuing:: Option Selected: %OptionSelected%

;	if statements to go to proper option if option is typed or scanned in instead of being clicked
if (OptionSelected = 1){
MsgBox, A1 selected
Goto, A1
}
if (OptionSelected = 2){
MsgBox, A2 selected
Goto, A2
}
if (OptionSelected = 3){
MsgBox, A3 selected
Goto, A3
}

A1:
{
	;Run, %ScannedCode%/checkout
	;msgbox,Clicked %f1% a.k.a. User
	imagesearch1:				; Image search to look for Select a User (to be able to click it)
		Loop {
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\images\%MenuNumber%\%ChromeScaling%-UserSelected.PNG
				if ErrorLevel = 0
					{
						MsgBox, Found the user picker at %FoundX%x%FoundY%, clicking after enter is pressed...				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
						Sleep 20
						Click, %FoundX%, %FoundY%, 1
						;return
						Sleep 250
						SoundPlay, %A_ScriptDir%\audio\Username.mp3
						Goto, PostActions1
					}
				
				
				
				
				else if ErrorLevel = 1
					{   
					MsgBox, Not Found2				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
					imagesearch1 :=
					}
				
				
				
				
				else if ErrorLevel = 2
					{   
					MsgBox, Could not conduct search, maybe I could not find the image file?
					break
					}	
				}	
	PostActions1:			
	Sleep, 100
	Send, {Tab 2}
	Sleep, 100
	Send, {Space}
	Sleep 5000
	Goto, ClickIfOneOption
}


A2:
{
	;Run, %ScannedCode%/checkout
	;msgbox,Clicked %f1% a.k.a. User
	imagesearch2:				; Image search to look for Select a User (to be able to click it)
		Loop {
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\images\%MenuNumber%\%ChromeScaling%-AssetNotSelected.PNG
				if ErrorLevel = 0
					{
						;MsgBox, Found the user picker at %FoundX%x%FoundY%, clicking after enter is pressed...				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
						Sleep 20
						Click, %FoundX%, %FoundY%, 1
						;return
						Sleep 250
						SoundPlay, %A_ScriptDir%\audio\1-CheckoutToAsset.mp3
						Goto, PostActions2
					}
				
				
				
				
				else if ErrorLevel = 1
					{   
					;MsgBox, Not Found2				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
					imagesearch2 :=
					}
				
				
				
				
				else if ErrorLevel = 2
					{   
					MsgBox, Could not conduct search, maybe I could not find the image file?
					break
					}	
				}
						
	PostActions2:			
	Sleep, 100
	Send, {Tab 2}
	Sleep, 100
	Send, {Space}
	Sleep 5000
	Goto, ClickIfOneOption
}

A3:
{
	;Run, %ScannedCode%/checkout
	;msgbox,Clicked %f1% a.k.a. User
	imagesearch3:				; Image search to look for Select a User (to be able to click it)
		Loop {
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\images\%MenuNumber%\%ChromeScaling%-LocationNotSelected.PNG
				if ErrorLevel = 0
					{
						;MsgBox, Found the user picker at %FoundX%x%FoundY%, clicking after enter is pressed...				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
						Sleep 20
						Click, %FoundX%, %FoundY%, 1
						;return
						Sleep 250
						SoundPlay, %A_ScriptDir%\audio\1-CheckoutToLocation.mp3
						Goto, PostActions3
					}
				
				
				
				
				else if ErrorLevel = 1
					{   
					;MsgBox, Not Found2				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
					imagesearch3 :=
					}
				
				
				
				
				else if ErrorLevel = 2
					{   
					MsgBox, Could not conduct search, maybe I could not find the image file?
					break
					}	
				}
						
	PostActions3:			
	Sleep, 100
	Send, {Tab 2}
	Sleep, 100
	Send, {Space}
	Sleep 5000
	Goto, ClickIfOneOption
}

ClickIfOneOption:
{
	msgbox,Running ClickIfOneOption
	imagesearch4:				; Image search to look for Select a User (to be able to click it)
		Loop {
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *75 %A_ScriptDir%\images\%MenuNumber%\%ChromeScaling%-LoadingMoreResults.png
				if ErrorLevel = 0
					{
						MsgBox, Found the Loading more results... at %FoundX%x%FoundY%, pressing enter after ok...				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
						Sleep 20
						;Click, %FoundX%, %FoundY%, 1
						Send, {Enter}
						;return
						Sleep 250
						SoundPlay, %A_ScriptDir%\audio\Username.mp3
						Goto, PostActions4
					}
				
				
				
				
				else if ErrorLevel = 1
					{   
					;MsgBox, Not Found2				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
					imagesearch3 :=
					}
				
				
				
				
				else if ErrorLevel = 2
					{   
					MsgBox, Could not conduct search, maybe I could not find the image file?
					break
					}	
				}
						
	PostActions4:			
	ExitApp
}


ExitApp


;Esc::ExitApp
Esc::Reload