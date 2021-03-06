﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

snow_leopard_folders := Object()
snow_leopard_folders.insert("\\SNOW-LEOPARD\Work")

cheetah_folders := Object()
cheetah_folders.insert("D:\Mist\Projects\2014")
cheetah_folders.insert("D:\Mist\Projects\2013")

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

#q:: Run, D:\MIST\Projects\2014

:?*:snl::
    Input, proj_code, v,{Enter}{Space}
    proj_folder := ProjectFolder(snow_leopard_folders, proj_code)
    ExpandString(proj_code, proj_folder)
    Return

:?*:prf::
    Input, proj_code, v,{Enter}{Space}
    proj_folder := ProjectFolder(cheetah_folders, proj_code)
    ExpandString(proj_code, proj_folder)
    Return

ExpandString(source, expanded) {
    StringLen, source_len, source
    source_len++
    ;SendInput {BackSpace %source_len%}%expanded%
    ;This is a workaround because e.g. ZWCAD does not recognize correctly the events from SendInput
    SendInput {BackSpace %source_len%}

    clipboard_content := ClipboardAll
    clipboard := expanded
    Send ^v
    Sleep 500
    clipboard := clipboard_content
    clipboard_content =

    return true
}

ProjectFolder(project_folders, proj_code) {
    If (proj_code = "")
    {
        return project_folder
    }
    for index, project_folder in project_folders
    {
        result := ProjectFolderByDir(project_folder, proj_code)
        If (result <> "")
        {
            return result
        }

    }
    return project_folders[1]
}

ProjectFolderByDir(project_folder, proj_code) {
    pattern = %project_folder%\%proj_code%_*
    Loop %pattern%, 2, 0
    {
        result =  %project_folder%\%A_LoopFileName%
        return result
    }
    return ""
}
