ScriptName Fragments:Quests:QF_MQ207C_RafaelPostquest_00051687 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_RafaelAguerro Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
LocationAlias Property Alias_playerShipInteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_RafaelAguerroPost Auto Const mandatory
Quest Property CREW_EliteCrew_RafaelAguerro Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  SQ_Followers.SetRoleActive(Alias_RafaelAguerro.GetActorRef(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:18
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:19
  Actor rafael = Alias_RafaelAguerro.GetActorRef() ; #DEBUG_LINE_NO:25
  SQ_Followers.SetRoleInactive(rafael, True, False, True) ; #DEBUG_LINE_NO:26
  kmyQuest.AddPassenger(Alias_RafaelAguerro) ; #DEBUG_LINE_NO:27
  If rafael.GetCurrentLocation() != Alias_playerShipInteriorLocation.GetLocation() ; #DEBUG_LINE_NO:30
    rafael.EvaluatePackage(False) ; #DEBUG_LINE_NO:31
    rafael.MoveToPackageLocation() ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:41
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:42
  Actor rafael = Alias_RafaelAguerro.GetActorRef() ; #DEBUG_LINE_NO:48
  kmyQuest.RemovePassengerActor(rafael) ; #DEBUG_LINE_NO:49
  rafael.DisableNoWait(False) ; #DEBUG_LINE_NO:50
  Self.SetStage(200) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_RafaelAguerro.GetActorRef().DisableNoWait(False) ; #DEBUG_LINE_NO:72
  Self.SetStage(200) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0210_Item_00()
  CREW_EliteCrew_RafaelAguerro.SetStage(1) ; #DEBUG_LINE_NO:94
  Self.SetObjectiveDisplayed(210, True, False) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(210, True) ; #DEBUG_LINE_NO:108
  Self.CompleteQuest() ; #DEBUG_LINE_NO:109
  Self.Stop() ; #DEBUG_LINE_NO:110
EndFunction
