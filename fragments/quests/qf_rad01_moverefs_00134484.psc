ScriptName Fragments:Quests:QF_Rad01_MoveRefs_00134484 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimeFactionUC Auto Const
Location Property CityCydoniaLocation Auto Const
Location Property StationTheDenLocation Auto Const
Location Property CityNewAtlantisLocation Auto Const
Location Property SettleHopeTownPitStopLocation Auto Const
Faction Property CrimeFactionFreestar Auto Const
Location Property CityAkilaCityStonerootInnLocation Auto Const
Location Property CityAkilaCityTheRockLocation Auto Const
Location Property SettleRedMileLocation Auto Const
Faction Property CrimeFactionRedMile Auto Const
ReferenceAlias Property Alias_Secretary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If CityCydoniaLocation == Alias_Secretary.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:11
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:12
  ElseIf StationTheDenLocation == Alias_Secretary.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:13
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:14
  ElseIf CityNewAtlantisLocation == Alias_Secretary.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:15
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:16
  ElseIf SettleHopeTownPitStopLocation == Alias_Secretary.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:17
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:18
  ElseIf CityAkilaCityStonerootInnLocation == Alias_Secretary.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:19
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:20
  ElseIf CityAkilaCityTheRockLocation == Alias_Secretary.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:21
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:22
  ElseIf SettleRedMileLocation == Alias_Secretary.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:23
    Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionRedMile) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.stop() ; #DEBUG_LINE_NO:33
EndFunction
