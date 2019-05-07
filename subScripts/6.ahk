ChromeScaling = 125
IniRead, SnipeITURL, %A_ScriptDir%/config.ini, General, SnipeITURL
Title = New Accessory
MenuNumber = 6

Run, %SnipeITURL%/accessories/create


ExitApp