ScriptName RI07_NeurosurgeryTableScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI07 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If !RI07.GetStageDone(700) || RI07.GetStageDone(800) ; #DEBUG_LINE_NO:7
    Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
