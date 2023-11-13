#NoEnv
;#MenuMaskKey vkE8  ; Change the masking key to something unassigned such as vkE8.
#SingleInstance, force
#UseHook On
SetWorkingDir, %A_ScriptDir%

Insert::Reload
Pause::Suspend

; LCtrl::Alt
; LAlt::Ctrl
; *Tab::
; {
;     if (GetKeyState("LAlt", "P"))
;     {
;         if (GetKeyState("LShift", "P"))
;         {
;             Send {LAlt up}{Ctrl down}{Shift down}{Tab}{LCtrl up}{LShift up}
;         } else {
;             Send {LAlt up}{Ctrl down}{Tab}{LCtrl up}
;         }
;     } else {
;         Send {blind}{Tab}
;     }
;     Return
; }

!Tab::Send, ^{Tab}
!+Tab::Send, ^+{Tab}

LCtrl & Tab::AltTab

^Backspace::
Send, {Space}
Send, +{Home}
Send, {Backspace}
return

#Backspace::Send, ^{Backspace}

#Left::Send, ^{Left}
^Left::Send, {Home}

#Right::Send, ^{Right}
^Right::Send, {End}

#IfWinActive ahk_exe WindowsTerminal.exe
{
    LAlt::Ctrl
    LCtrl & C::
    {
        Send {Ctrl down}{Shift down}C{Shift up}{Ctrl up}
        Return
    }
}
