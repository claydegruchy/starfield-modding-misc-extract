ScriptName Fragments:Quests:QF_Rad01_Convo_0018DDF8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor1 Auto Const mandatory
ReferenceAlias Property Alias_Actor2 Auto Const mandatory
Quest Property Rad01_LIST Auto Const mandatory
MiscObject Property Credits Auto Const
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
GlobalVariable Property Rad01_Convo_Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If Rad01_LIST.GetStageDone(290) ; #DEBUG_LINE_NO:7
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:8
  Else ; #DEBUG_LINE_NO:
    Rad01_LIST.SetStage(250) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
  If CityCydoniaLocation == Alias_Actor1.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:15
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:16
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:17
  ElseIf StationTheDenLocation == Alias_Actor1.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:18
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:19
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:20
  ElseIf CityNewAtlantisLocation == Alias_Actor1.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:21
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:22
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:23
  ElseIf SettleHopeTownPitStopLocation == Alias_Actor1.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:24
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:25
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:26
  ElseIf CityAkilaCityStonerootInnLocation == Alias_Actor1.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:27
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:28
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:29
  ElseIf CityAkilaCityTheRockLocation == Alias_Actor1.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:30
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:31
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:32
  ElseIf SettleRedMileLocation == Alias_Actor1.GetActorRef().GetCurrentLocation() ; #DEBUG_LINE_NO:33
    Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionRedMile) ; #DEBUG_LINE_NO:34
    Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionRedMile) ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:44
  Rad01_LIST.SetStage(299) ; #DEBUG_LINE_NO:45
  If Self.GetStageDone(151) ; #DEBUG_LINE_NO:47
    Game.getplayer().removeitem(Credits as Form, Rad01_Convo_Credits.GetValueInt(), False, None) ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveFailed(100, True) ; #DEBUG_LINE_NO:57
  Rad01_LIST.SetStage(500) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0900_Item_00()
  If Self.IsObjectiveCompleted(100) == False ; #DEBUG_LINE_NO:66
    Self.SetObjectiveSkipped(100) ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
  Alias_Actor1.TryToDisable() ; #DEBUG_LINE_NO:69
  Alias_Actor2.TryToDisable() ; #DEBUG_LINE_NO:70
  Self.Stop() ; #DEBUG_LINE_NO:71
EndFunction
