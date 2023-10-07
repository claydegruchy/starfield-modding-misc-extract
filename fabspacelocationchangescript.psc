ScriptName FABSpaceLocationChangeScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property LocationToCheck Auto Const mandatory
Int Property StageToSet Auto Const
Int Property ConditionalStage Auto Const

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:9
  If MyQuest.GetStageDone(ConditionalStage) ; #DEBUG_LINE_NO:11
    If akNewLoc == LocationToCheck ; #DEBUG_LINE_NO:12
      MyQuest.SetStage(StageToSet) ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
