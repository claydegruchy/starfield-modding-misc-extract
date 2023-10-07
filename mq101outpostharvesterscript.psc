ScriptName MQ101OutpostHarvesterScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property SystemNarionPlanetAnselonMoonNexum Auto Const mandatory
Quest Property MQ101 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  If Game.GetPlayer().IsInLocation(SystemNarionPlanetAnselonMoonNexum) && MQ101.GetStageDone(900) == False ; #DEBUG_LINE_NO:7
    MQ101.SetStage(740) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
