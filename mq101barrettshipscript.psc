ScriptName MQ101BarrettShipScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnShipTakeOff(Bool abComplete)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:4
  If abComplete == False && myQuest.GetStageDone(320) ; #DEBUG_LINE_NO:5
    myQuest.SetStage(345) ; #DEBUG_LINE_NO:6
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipLanding(Bool abComplete)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:11
  If abComplete && myQuest.GetStageDone(170) ; #DEBUG_LINE_NO:13
    myQuest.SetStage(180) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndEvent
