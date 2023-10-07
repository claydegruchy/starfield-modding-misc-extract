ScriptName MS02_CloneScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MS02 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad()
  If MS02.GetStageDone(1920) ; #DEBUG_LINE_NO:8
    Self.SetEssential(False) ; #DEBUG_LINE_NO:9
    Self.SetProtected(False) ; #DEBUG_LINE_NO:10
    Self.KillSilent(None) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndEvent
