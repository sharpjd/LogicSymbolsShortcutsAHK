#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Originally made by Jason Dong. 

MsgBox,
(
///////////////////////////////////////////

FN + E types ∃ (backwards E/Existential quantifier)
FN + A types ∀ (upside-down A/Universal quantifier)
FN + = types ≡ (logical equivalency)
FN + N types ¬ (negation/inversion)
FN + & (or number row 7) types ∧ (conjunction/AND)
FN + / types ∨ (disjunction/OR)
FN + X types ⊕ (exclusive disjunction/XOR)
FN + > (or period .) types → (implication)
FN + < (or comma ,) types ↔ (bicondition)

(Capitalization not required)

To close this app, either hit FN + q or RALT + q (RCTR + q does not work). You can also close this app in the system tray by right-clicking the AutoHotKey icon (green icon with a white H) and selecting "Exit".

You can dismiss this window quickly next time by pressing the escape key (ESC).

////////////////////////////////////////////

The keybinds may conflict with existing shortcuts. If so, press FN + Z (or RAlt + Z or RCtrl + Z) to toggle between alternate scheme(s) of using Right Alt or Right Control instead of FN. A small cursor tooltip will be shown to notify you of this change. 

In case this app doesn't work, it unfortunately can't up to one author to modify the program to account for every scenario depending on how far this app spreads. You may need to install AHK from autohotkey.com and edit the source script which can be found here on GitHub:  
)
return

SC178 & q::
exitScript()
return

RAlt & q::
exitScript()
return

LCtrl & q::
exitScript()
return

exitScript(){
	ExitApp
	return
}

SC178 & z::
cycleScheme()
return

RAlt & z::
cycleScheme()
return

RCtrl & z::
cycleScheme()
return

global scheme := 0
; 0 = FN
; 1 = RCtrl
; 2 = RAlt 

cycleScheme(){
	if(scheme < 2) {
		scheme++
		if(scheme == 1){
			notifyScheme("Switched to RAlt scheme")
		}
		if(scheme == 2){
			notifyScheme("Switched to RCtrl scheme")
		}
	} else {
		scheme := 0
		notifyScheme("Switched to FN scheme (default)")
	}
	return
}

notifyScheme(tooltipText){
	Tooltip, %tooltipText%
	SetTimer, RemoveToolTip, 5000
	return
}
RemoveToolTip:
Tooltip
return

#if (scheme == 0) ;FN
SC178 & >::→
SC178 & =::≡
SC178 & <::↔
SC178 & n::¬
SC178 & 7::∧
SC178 & /::∨
SC178 & x::⊕
SC178 & a::∀
SC178 & e::∃

#if (scheme == 1) ;RAlt
RAlt & >::→
RAlt & =::≡
RAlt & <::↔
RAlt & n::¬
RAlt & 7::∧
RAlt & /::∨
RAlt & x::⊕
RAlt & a::∀
RAlt & e::∃

#if (scheme == 2) ;RCtrl
RCtrl & >::→
RCtrl & =::≡
RCtrl & <::↔
RCtrl & n::¬
RCtrl & 7::∧
RCtrl & /::∨
RCtrl & x::⊕
RCtrl & a::∀
RCtrl & e::∃

/* SYMBOLS
→
≡
↔
¬
∧
∨
⊕ XOR
∀
∃ backwards E
*/