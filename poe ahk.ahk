IfNotExist, C:\ahk
{
        FileCreateDir, C:\ahk
}
SetWorkingDir, C:\ahk
IfNotExist, cports.exe
{
UrlDownloadToFile, http://lutbot.com/ahk/cports.exe, cports.exe
        if ErrorLevel
                MsgBox, There was a problem downloading cports.exe
UrlDownloadToFile, http://lutbot.com/ahk/cports.chm, cports.chm
        if ErrorLevel
                MsgBox, There was a problem downloading cports.chm     
UrlDownloadToFile, http://lutbot.com/ahk/readme.txt, readme.txt
        if ErrorLevel
                MsgBox, There was a problem downloading readme.txt
}

F4::logoutCommand()
`::oosCommand("/oos")
!WheelUp::vaal()
XButton1::flask()
F2::remaining("/remaining")
F3::hideout("/hideout")
!F1::afk("/afk")
!F2::dnd("/dnd")
#IfWinExist Path of Exile
F12::Pause
#IfWinNotExist Path of Exile
F12::ExitApp

logoutCommand(){
	Run cports.exe /close * * * * PathOfExile.exe
}

afk(String){
	keyout(String)
}

dnd(String){
	keyout(String)
}
 
remaining(String){
	keyout(String)
}
 
hideout(String){
	keyout(String)
}

oosCommand(String){
	keyOut(String)
}

flask(){
	IfWinActive Path of Exile
	{
		start=1
		Loop 5{
			Random, time, 50, 300
			SendInput %start%
			start++
			Sleep %time%
		}
	}
	Return
}

vaal(){
	IfWinActive Path of Exile
	{
		Random, time, 410, 460
		SendInput, {XButton2}
		Sleep %time%
		SendInput, {RButton}
	}
	Return
}

keyOut(String){
	IfWinActive Path of Exile 
	{
		SendInput, {Enter}
		Sleep 2
		SetKeyDelay, 0
		Loop, Parse, String
		SendInput, % "{Asc " . Asc(A_LoopField) . "}"
		SendInput, {Enter}
	}
	Return
}