

Goto, CheckForOneMatch
CheckForOneMatch:
{
	;msgbox,Running CheckIfSuccess
	imagesearch5:				; Image search to look for Select a User (to be able to click it)
		Loop {
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\images\OneMatchLoadingSelect.PNG
				if ErrorLevel = 0
					{
						;MsgBox, Found Checkout successfull at %FoundX%x%FoundY%, pressing enter after ok...				;Delete the semicolon at char 1 here to debug to display popup box with variable in it
						Sleep 20
						;Click, %FoundX%, %FoundY%, 1
						;SoundPlay, %A_ScriptDir%\audio\1-AssetCheckoutSuccessful.mp3
						Send, {Enter}
						Goto, PostActions
					}
				
				
				
				
				else if ErrorLevel = 1
					{   
					;MsgBox, Did not find checkout successful, searching again...			;Delete the semicolon at char 1 here to debug to display popup box with variable in it
					imagesearch5 :=
					}
				
				
				
				
				else if ErrorLevel = 2
					{   
					MsgBox, CheckIfSuccess - Could not conduct search, maybe I could not find the image file?
					break
					}	
				}
						
	PostActions:
	;MsgBox, Running Post Actions
	Sleep, 1000
	Goto, CheckForOneMatch
}

MsgBox, Closing...
Goto, CheckForOneMatch