#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive Minecraft* 1.


; Mute with Alt-M
volume = 1
!m::
	If volume
		volume=0
	Else
		volume=1

	Run nircmd.exe setappvolume "C:\Program Files (x86)\Minecraft Launcher\runtime\java-runtime-beta\windows-x64\java-runtime-beta\bin\javaw.exe" %volume%
Return


; Auto-mining
; Press Alt-Comma to activate/deactivate
; Runs forward while holding down LMB
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


; Water-bucket help
; Switches to inventory slot 4, then spam clicks RMB to place water bucket 
; Look down and hold 4MB to use
; If you let go on an odd number (water bucket placed down) the script will click one more time to pick up the water
; If you die regularly, adjust the Sleep number until it usually is successful
; Adjust the SendInput number to whichever slot you keep a water bucket in
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

#IfWinActive

