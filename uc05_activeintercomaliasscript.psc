ScriptName UC05_ActiveIntercomAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Bool SetStageOnActivate
Int StageToSet

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If SetStageOnActivate ; #DEBUG_LINE_NO:7
    SetStageOnActivate = False ; #DEBUG_LINE_NO:8
    Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:9
    StageToSet = -1 ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
  (Self.GetOwningQuest() as uc05_questscript).UpdateActiveIntercom(Self as ScriptObject, False, None, -1) ; #DEBUG_LINE_NO:13
EndEvent

Function UpdateStageToSet(Int iStageToSet)
  StageToSet = iStageToSet ; #DEBUG_LINE_NO:17
  SetStageOnActivate = True ; #DEBUG_LINE_NO:18
EndFunction
