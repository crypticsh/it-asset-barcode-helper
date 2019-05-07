IniRead, SnipeITURL, %A_ScriptDir%/config.ini, General, ChromeScaling
IniRead, SnipeITURL, %A_ScriptDir%/config.ini, General, SnipeITURL
Title = New Asset
MenuNumber = 3

Run, %SnipeITURL%/hardware/create


ExitApp