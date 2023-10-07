ScriptName DefaultCounterAliasColIncOnDeathB Extends DefaultCounterQuestRefColIncOnDeath default
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestB script. }

;-- Functions ---------------------------------------

Function Increment(ObjectReference akSenderRef)
  If MaintainTargetValue ; #DEBUG_LINE_NO:5
    (Self.GetOwningQuest() as defaultcounterquestb).TargetValue = Self.GetCount() ; #DEBUG_LINE_NO:6
  EndIf ; #DEBUG_LINE_NO:
  (Self.GetOwningQuest() as defaultcounterquestb).Increment() ; #DEBUG_LINE_NO:8
  If RemoveWhenDead ; #DEBUG_LINE_NO:9
    Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:10
    If MaintainTargetValue ; #DEBUG_LINE_NO:11
      (Self.GetOwningQuest() as defaultcounterquestb).Decrement() ; #DEBUG_LINE_NO:12
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetCount() <= TargetRemainingCount && RemainingStage > -1 ; #DEBUG_LINE_NO:15
    Self.GetOwningQuest().SetStage(RemainingStage) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndFunction
