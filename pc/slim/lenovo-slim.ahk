#Requires AutoHotkey v2.0
#SingleInstance

; https://www.autohotkey.com/docs/v2/Hotkeys.html

CapsLock::ESC
^CapsLock::ESC
+CapsLock::ESC

; #f23 - Lenovo 'O' Copilot key
; Copilot crap key = Left Shift + Windows Key + F23
;+#f23::RCtrl
*#f23::RCtrl



; Win & Shift & d::
; Disable display
;#+d::
;;Sleep 1000
;SendMessage,0x112,0xF170,2,,Program Manager
;return

<#+d::
{
    ;Run rundll32.exe user32.dll,LockWorkStation     ; Lock PC
    Sleep 1000
    ;SendMessage 0x112, 0xF170, 2, , Program Manager  ; Monitor off
    SendMessage 0x112, 0xF170, 2, , "Program Manager"  ; Monitor off
    Return
}

XButton2::Ctrl
