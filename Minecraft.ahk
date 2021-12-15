#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive Minecraft


!,::
KeyDown1 := !KeyDown1
If KeyDown1
{
	SendInput {w down}
	SendInput {Tab down}
	Click Left down
}
Else
{
	SendInput {w up}
	SendInput {Tab up}
	Click Left up
}
Return

XButton1::
EvenOdd = 0
SendInput {4}
while GetKeyState("XButton1", "P")
{
	SendInput {Click Right}
	Sleep 65
	EvenOdd++
}
If Mod(EvenOdd,2) == 0
{
	Return
}
Else
{
	SendInput {Click Right}
}
Return