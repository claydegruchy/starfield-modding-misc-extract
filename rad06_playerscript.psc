ScriptName RAD06_PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property QuestGiverLoc Auto Const

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:7
  If akNewLoc == QuestGiverLoc.GetLocation() ; #DEBUG_LINE_NO:8
    (Self.GetOwningQuest() as rad06script).CargoHoldResourceCheck() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
