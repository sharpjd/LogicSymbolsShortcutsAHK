#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Originally made by Jason Dong. 
global scheme := 2
messageBox()
return

SC178 & p::
RCtrl & p::
RAlt & p::
RShift & p::
messageBox()
return

messageBox() {
MsgBox,
(
///////////////////////////////////////////

RShift + E types ∃ (backwards E/Existential quantifier)
RShift + A types ∀ (upside-down A/Universal quantifier)
RShift + = types ≡ (logical equivalency)
RShift + N types ¬ (negation/inversion)
RShift + & (or number row 7) types ∧ (conjunction/AND)
RShift + / types ∨ (disjunction/OR)
RShift + X types ⊕ (exclusive disjunction/XOR)
RShift + > (or period .) types → (implication)
RShift + < (or comma ,) types ↔ (bicondition)

////////////////////////////////////////////

The keybinds may flat out not work (or conflict with app shortcuts). You can manually cycle between the following supported key modifiers: RAlt, RCtrl, RShift, and Fn by pressing any one of them + the Z button (e.g. RCtrl + Z). A small cursor tooltip will be shown to notify you of this change. 

To close this app, hit {any supported button} + Q. You can also close this app in the system tray by right-clicking the AutoHotKey icon (green icon with a white H) and selecting "Exit".

You can dismiss this window quickly next time by pressing the escape key (ESC).

You can bring this messagebox back up by pressing {any supported button} + P. 

////////////////////////////////////////////

In case this app completely doesn't work, it unfortunately can't up to one author to modify the program to account for every scenario depending on how far this app spreads. You may need to install AHK from autohotkey.com and edit the source script which can be found here on GitHub: https://github.com/sharpjd/LogicSymbolsShortcutsAHK
)
return
}

SC178 & q::
RAlt & q::
RCtrl & q::
RShift & q::
exitScript()
return

exitScript(){
	ExitApp
	return
}

SC178 & z::
RAlt & z::
RCtrl & z::
RShift & z::
cycleScheme()
return

; global scheme := 2 <---- at the top of the script
; 0 = FN
; 1 = RAlt 
; 2 = RShift
; 3 = RCtrl

cycleScheme(){
	if(scheme < 3) {
		scheme++
		if(scheme == 1){
			notifyScheme("Switched to RAlt scheme")
		}
		if(scheme == 2){
			notifyScheme("Switched to RShift (default)")
		}
		if(scheme == 3){
			notifyScheme("Switched to RCtrl scheme")
		}
	} else {
		scheme := 0
		notifyScheme("Switched to FN scheme")
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

#if (scheme == 2) ;RShift
~RShift & >::→
~RShift & =::≡
~RShift & <::↔
~RShift & n::¬
~RShift & 7::∧
~RShift & /::∨
~RShift & x::⊕
~RShift & a::∀
~RShift & e::∃

#if (scheme == 3) ;RCtrl
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