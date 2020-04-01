SetCapsLockState, AlwaysOff

capslock := 0

*CapsLock:: capslock := A_TickCount

*CapsLock Up::
    ;ToolTip % A_PriorKey
    if (A_PriorKey = "CapsLock" && (A_TickCount - capslock) < 500)
    {
        if GetKeyState("CapsLock", "T") = 0
            SetCapsLockState, On
        else
            SetCapsLockState, AlwaysOff
    }
    capslock := 0
    return

CapsAction(action)
{
    SendInput, % "{Blind}{" action "}"
}

#if capslock
    $*h::CapsAction("Left")
    $*j::CapsAction("Down")
    $*k::CapsAction("Up")
    $*l::CapsAction("Right")
    $*u::CapsAction("PgUp")
    $*n::CapsAction("PgDn")
#if

semicolon := 0

$;::
    semicolon := A_TickCount
    SendInput, {LCtrl Down}
    return

$; UP::
    SendInput, {LCtrl Up}
    ;ToolTip % A_PriorKey
    if (A_PriorKey = ";" && (A_TickCount - semicolon) < 500)
    {
        SendInput,;
    }
    semicolon := 0
    return
