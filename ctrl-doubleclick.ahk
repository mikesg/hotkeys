~Ctrl::
    if (A_PriorHotKey = "~Ctrl" AND A_TimeSincePriorHotkey < 250)
    {
       Send {Enter}
    }
    Sleep 0
    KeyWait Ctrl
    return
