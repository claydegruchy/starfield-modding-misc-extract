ScriptName UCR01_MorphsCollScript Extends RefCollectionAlias

;-- Functions ---------------------------------------

Event OnLoad(ObjectReference akSenderRef)
  Actor currACT = akSenderRef as Actor ; #DEBUG_LINE_NO:4
  If currACT as Bool && !currACT.GetNoBleedoutRecovery() ; #DEBUG_LINE_NO:5
    currACT.SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:6
  EndIf ; #DEBUG_LINE_NO:
EndEvent
