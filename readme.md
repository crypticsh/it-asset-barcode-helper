# IT Asset Barcode Helper Menu Thing

## Features
* Multiple input modes
* TTS for most prompts (if I remember)
* Quick processing of the differnet tasks including:
First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column

	* Asset Check-Out	(Not Started)*
	* Asset Check-In	(Not Started)*
	* Consumable Check-Out (Testing)
	* Accessory Check-Out	(Not Started)*
	* Accessory Check-In	(Not Started)*
	* License Check-Out	(Not Started)*
	* License Check-In	(Not Started)*
	

## General
This script was designed to be use on a checkout computer (touch screen friendly(ish?)) with a scanner (preferably, but not required)

Below is what the menu looks like.  The operator can do one of the following:
* Barcode Scanner - Scan one of the options (Perferably the scanner should be set to Enter/Carriage Return/Line Feed after successful scan)
	* Note that this will require a scanner that can scan a computer screens (a.k.a. not a traditional Laser Scanner)
		* If you have a normal 1D Laser Scanner, you can simply take a screenshot of the menu or grab the files from /menuBarcodes, or click the below image and download it and print it off.
* Touch Screen - Touch the option you want
* Keyboard - Type in the number of the option you want, and hit **ENTER**


![alt text](/readmeImages/menu.png)

After picking one of the options (1-9), the corresponding .ahk script will be triggered in the /subScripts folder

After successful completion of the subScript, the original **Check-Out-MenuV2.ahk** script will be launched again to be ready for the next task.