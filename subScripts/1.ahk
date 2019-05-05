﻿;!b::
Gui, Destroy
Gui, Add, Picture, x5 y10 w450 h220 , %A_ScriptDir%\BarcodeImages\ScanBin.PNG
Gui, Add, Edit, vBinBarcode x160 y240 w120 h20
Gui, Add, Button, Default gOK, OK
Gui, Add, Text,  x195 y270 w120 h20, or Press ENTER
Gui, Show, xCenter yCenter h300 w450, Consumable Check-Out
SoundPlay, %A_ScriptDir%\audio\Consumable1.mp3
return

OK:
Gui, Submit

;MsgBox %BinBarcode%				;Delete the semicolon at char 1 here to debug to display popup box with variable in it test

;Open the Snipe IT link of the consumable scanned
Run, https://demo.snipeitapp.com/consumables/%BinBarcode%/checkout

ClickOnSelectUser:
imagesearch1 :=

imagesearch1:				; Image search to look for Select a User (to be able to click it)
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 %A_ScriptDir%\images\UserSelectMiddle.PNG
			if ErrorLevel = 0
				{
					;MsgBox, Found the user picker at %FoundX%x%FoundY%, clicking after enter is pressed...				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
					Sleep 1250
					Click, %FoundX%, %FoundY%, 1
					;return
					Sleep 250
					SoundPlay, %A_ScriptDir%\audio\Username.mp3
					Goto, UserSelectionChecker
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




UserSelectionChecker:
imagesearch2 :=			
			
imagesearch2: ; Image Search to look for the X and Down arrow in the right of the Select a User box that indicated that a user has been selected
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 %A_ScriptDir%\images\UserHasBeenSelected.PNG
			if ErrorLevel = 0
				{
					;MsgBox, User selection has been detected via %FoundX%x%FoundY%, continuting after enter is pressed...				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
					Sleep 250
					;Click, %FoundX%, %FoundY%, 1
					Sleep 250
					Goto, ClickTheCheckoutButton
				}
			
			
			
			
			else if ErrorLevel = 1
				{   
				;MsgBox, User selected detection failed, trying again... in 5 seconds...				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
				;Sleep, 5000
				imagesearch2 :=
				}
			
			
			
			
			else if ErrorLevel = 2
				{   
				MsgBox, Could not conduct search, maybe I could not find the image file?
				break
				}	
			}




ClickTheCheckoutButton:
imagesearch3: ; Image Search to look for the X and Down arrow in the right of the Select a User box that indicated that a user has been selected
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 %A_ScriptDir%\images\CheckoutButton.PNG
			if ErrorLevel = 0
				{
					;MsgBox, Found the checkout button at %FoundX%x%FoundY%, clicking after enter...				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
					Sleep 250
					Click, %FoundX%, %FoundY%, 1
					Goto, VerifySuccessOrFailure
				}
			
			
			
			
			else if ErrorLevel = 1
				{   
				;MsgBox, The Checkout Button was not found, trying again in 2 seconds				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
				;Sleep,  2000
				Goto, ClickTheCheckoutButton
				}
			
			
			
			
			else if ErrorLevel = 2
				{   
				MsgBox, Could not conduct search, maybe I could not find the image file?
				break
				}	
			}
			
			
			
VerifySuccessOrFailure:
imagesearch4: ; Image search to look for either Success: Consumable checked out successfully --or-- if there was an error
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 %A_ScriptDir%\images\ConsumableCheckedOutSuccessfully.PNG
			if ErrorLevel = 0
				{
					;MsgBox, Found the checkout button at %FoundX%x%FoundY%, clicking after enter...				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
					Sleep 250
					SoundPlay, %A_ScriptDir%\audio\consumableCheckoutSuccess.mp3
					return
				}
			
			
			
			
			else if ErrorLevel = 1
				{   
				Loop {
					ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 %A_ScriptDir%\images\ConsumableCheckoutError.PNG
						if ErrorLevel = 0
							{
								SoundPlay, %A_ScriptDir%\audio\consumableCheckoutFailure.mp3
								;MsgBox, Found Error during checkout %FoundX%x%FoundY%, going back to select user				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
								Sleep 1000
								Click, %FoundX%, %FoundY%, 1
								Goto, ClickOnSelectUser
							}
						
						
						
						
						else if ErrorLevel = 1
							{   
							;MsgBox, Can't find the checkout error, trying to look for success again			;Delete the semicolon at char 1 here to debug to display popup box with variable in it
							;Sleep,  2000
							Goto, VerifySuccessOrFailure
							}
						
						
						
						
						else if ErrorLevel = 2
							{   
							MsgBox, Could not conduct search, maybe I could not find the image file?
							break
							}	
					}
				}
			
			
			
			
			else if ErrorLevel = 2
				{   
				MsgBox, Could not conduct search, maybe I could not find the image file?
				break
				}	
			}



exit

!r::
Reload



