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
`::keyOut("/oos")
!WheelUp::vaal()
XButton1::flask()
F2::keyOut("/remaining")
F3::keyOut("/hideout")
!F1::keyOut("/afk")
!F2::keyOut("/dnd")
#IfWinExist Path of Exile
F12::Pause
#IfWinNotExist Path of Exile
F12::ExitApp

logoutCommand(){
	Run cports.exe /close * * * * PathOfExile.exe
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