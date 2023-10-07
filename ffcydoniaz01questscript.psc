ScriptName FFCydoniaZ01QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property FFCydoniaZ01_CargoHalfTotal Auto Const mandatory
GlobalVariable Property FFCydoniaZ01_CargoTotal Auto Const mandatory
RefCollectionAlias Property Cargo Auto Const mandatory
RefCollectionAlias Property Leeches Auto Const mandatory

;-- Functions ---------------------------------------

Function SetLeechesAggressive()
  Leeches.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:10
EndFunction

Event OnQuestInit()
  Int TotalCargo = Cargo.GetCount() ; #DEBUG_LINE_NO:14
  Int HalfTotalCargo = TotalCargo / 2 ; #DEBUG_LINE_NO:15
  FFCydoniaZ01_CargoTotal.SetValue(TotalCargo as Float) ; #DEBUG_LINE_NO:16
  FFCydoniaZ01_CargoHalfTotal.SetValue(HalfTotalCargo as Float) ; #DEBUG_LINE_NO:17
  Self.SetLeechesAggressive() ; #DEBUG_LINE_NO:18
EndEvent
