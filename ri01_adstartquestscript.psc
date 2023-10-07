ScriptName RI01_AdStartQuestScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI01 Auto Const mandatory
Message Property RI01_AdMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If !RI01.IsActive() && !RI01.IsCompleted() ; #DEBUG_LINE_NO:7
    RI01_AdMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:8
    RI01.Start() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
