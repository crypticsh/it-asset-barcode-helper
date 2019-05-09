IniRead, ChromeScaling, %A_ScriptDir%/config.ini, General, ChromeScaling
IniRead, SnipeITURL, %A_ScriptDir%/config.ini, General, SnipeITURL
IniRead, DBHost, %A_ScriptDir%/config.ini, Database, DBHost
IniRead, DBPort, %A_ScriptDir%/config.ini, Database, DBPort
IniRead, DBName, %A_ScriptDir%/config.ini, Database, DBName
IniRead, DBSelectUsername, %A_ScriptDir%/config.ini, Database, DBSelectUsername
IniRead, DBSelectPassword, %A_ScriptDir%/config.ini, Database, DBSelectPassword
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

;Disabled for now
;Gui, Destroy
;Gui, Add, Picture, x5 y10 w450 h220 , %A_ScriptDir%\images\%MenuNumber%\User.PNG
;Gui, Add, Picture, x5 y235 w450 h220 , %A_ScriptDir%\images\%MenuNumber%\Asset.PNG
;Gui, Add, Picture, x5 y460 w450 h220 , %A_ScriptDir%\images\%MenuNumber%\Location.PNG
;Gui, Add, Edit, vScannedCode2 x160 y685 w120 h20
;Gui, Add, Button, Default gOK2, OK
;Gui, Add, Text,  x195 y715 w120 h20, or Press ENTER %ScannedCode%
;Gui, Show, xCenter yCenter h735 w450, %Title%
;SoundPlay, %A_ScriptDir%\audio\%MenuNumber%-CheckoutToWhat.mp3
;return
;
;OK2:
;Gui, Submit



SendMode, Input

FormatTime, TimeString,YYMMDDHH24MISS,yyMMddhhmmss
'MsgBox The current 24-hour time is %TimeString%.

; Query DB
Msgbox, About to run the following:    Click OK to run: "C:\Program Files\MySQL\MySQL Workbench 8.0 CE\mysql.exe" %DBName% -u %DBSelectUsername% -p%DBSelectPassword% -h %DBHost% --port %DBPort% -ss -e "SELECT id from assets where asset_tag='%ScannedCode%'" > C:\Users\it_assetmgmt\Desktop\DBTemp\%TimeString%.txt
Run, mysql.exe %DBName% -u %DBSelectUsername% -p%DBSelectPassword% -h %DBHost% --port %DBPort% -ss -e "SELECT id from assets where asset_tag='%ScannedCode%'" > C:\Users\it_assetmgmt\Desktop\DBTemp\%TimeString%.txt, C:\Program Files\MySQL\MySQL Workbench 8.0 CE

Sleep, 5000

;read sql output file assigned to variable
FileRead, idOfTag, C:\Users\nkeller_ladmin\Downloads\%TimeString%.txt
Msgbox, idOfTag is %idOfTag%

Sleep, 1000

Run, %SnipeITURL%/hardware/%idOfTag%


ExitApp