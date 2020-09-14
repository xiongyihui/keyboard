navigation := 0

$d:: navigation := A_TickCount

$d Up::
    ;ToolTip % A_PriorKey
    if (A_PriorKey = "d" && (A_TickCount - navigation) < 500)
    {
        SendInput {Blind}d
    }
    navigation := 0
    return

Action(action)
{
    SendInput % "{Blind}{" action "}"
}

#if navigation
    h::Action("Left")
    j::Action("Down")
    k::Action("Up")
    l::Action("Right")
    u::Action("PgUp")
    n::Action("PgDn")
    p::SendInput {Shift Down}{Insert}{Shift Up}
    $Enter::SendInput {Ctrl Down}{Enter}{Ctrl Up}
#if

semicolon := 0

$;::
    semicolon := A_TickCount
    SendInput {Blind}{LCtrl Down}
    return

$; UP::
    SendInput {Blind}{LCtrl Up}
    ;ToolTip % A_PriorKey
    if (A_PriorKey = ";" && (A_TickCount - semicolon) < 500)
    {
        SendInput {Blind};
    }
    semicolon := 0
    return
