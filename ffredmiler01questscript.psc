ScriptName FFRedMileR01QuestScript Extends Quest

;-- Variables ---------------------------------------
inputenablelayer FastTravelInputLayer

;-- Properties --------------------------------------
Quest Property RedMile_HandlerQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function RMDisableFastTravel()
  FastTravelInputLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:10
  FastTravelInputLayer.EnableFastTravel(False) ; #DEBUG_LINE_NO:11
  FastTravelInputLayer.EnableTakeoff(False) ; #DEBUG_LINE_NO:12
EndFunction

Function RMEnableFastTravel()
  If FastTravelInputLayer != None ; #DEBUG_LINE_NO:16
    FastTravelInputLayer.EnableFastTravel(True) ; #DEBUG_LINE_NO:17
    FastTravelInputLayer.EnableTakeoff(True) ; #DEBUG_LINE_NO:18
    FastTravelInputLayer.Delete() ; #DEBUG_LINE_NO:19
    FastTravelInputLayer = None ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SpawnCreatures(Int aiPhase)
  (RedMile_HandlerQuest as redmilehandlerquestscript).RespawnCreatures(aiPhase) ; #DEBUG_LINE_NO:26
EndFunction
