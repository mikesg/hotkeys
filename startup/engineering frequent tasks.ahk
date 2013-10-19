#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#z::
    IfWinExist, ZWCAD+
    {
        WinActivate
    }
    else
    {
        Run C:\Program Files\ZWCAD+ 2014\ZWCAD.exe /product ZWCAD /language "en-US"
        WinWait ZWCAD+
        WinActivate
    }
return

#t::
    IfWinExist, Tower - 3D
    {
        WinActivate
    }
    else
    {
        Run C:\Program Files\Radimpex\Tower 7\TowerPro.exe
        WinWait Tower - 3D
        WinActivate
    }
return

#q:: Run, D:\MIST\Projects\2013
