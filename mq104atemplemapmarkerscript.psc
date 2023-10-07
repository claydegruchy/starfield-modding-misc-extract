ScriptName MQ104ATempleMapMarkerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet = 405 Auto Const

;-- Functions ---------------------------------------

Event OnMapMarkerDiscovered()
  Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:6
EndEvent
