IniRead, SnipeITURL, %A_ScriptDir%/config.ini, General, ChromeScaling
IniRead, SnipeITURL, %A_ScriptDir%/config.ini, General, SnipeITURL
Title = New Accessory
MenuNumber = 6

Run, %SnipeITURL%/accessories/create


ExitApp