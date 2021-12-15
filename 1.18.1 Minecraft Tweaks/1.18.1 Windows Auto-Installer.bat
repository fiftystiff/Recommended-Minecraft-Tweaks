@echo off

set /p Input1=Is Minecraft installed in the default directory? (y/n):
if /I "%Input1%"=="y" goto yes
goto no

:yes
set pathToMinecraft="%APPDATA%\.minecraft"
goto havePath

:no
set /p pathToMinecraft=Please enter the path to you Minecraft installation:


:havePath
::echo "Minecraft Install Location = %pathToMinecraft%"

::Copy folders
robocopy versions "%pathToMinecraft%\versions" "*" /E >NUL
echo Installed Fabric for 1.18.1!
robocopy mods "%pathToMinecraft%\mods" "*" /E >NUL
echo Mods moved!
robocopy shaderpacks "%pathToMinecraft%\shaderpacks" "*" /E >NUL
echo Shaderpacks moved!
robocopy resourcepacks "%pathToMinecraft%\resourcepacks" "*" /E >NUL
echo Resourcepacks moved!

pause