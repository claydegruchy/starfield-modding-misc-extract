ScriptName Fragments:Quests:QF_LC082_002BF365 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_CF01InterrogationRoomGuards Auto Const mandatory
RefCollectionAlias Property Alias_BrigClutter Auto Const mandatory
ReferenceAlias Property Alias_VigilanceShip Auto Const mandatory
ReferenceAlias Property Alias_Kibwe Auto Const mandatory
ObjectReference Property LC082_StartDockingBay Auto Const mandatory
ObjectReference Property LC082_InterrogationRoomDoorRef Auto Const mandatory
ObjectReference Property LC082_OperationsCenterElevatorAccessDoorRef Auto Const mandatory
ObjectReference Property LC082_PlayerShipDockingPortAccessDoorRef Auto Const mandatory
ObjectReference Property CF01KibweOpsMarker Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
Quest Property CF01 Auto Const mandatory
Quest Property CF02 Auto Const mandatory
Quest Property CF03 Auto Const mandatory
Quest Property CF04 Auto Const mandatory
Quest Property CF05 Auto Const mandatory
Quest Property CF06 Auto Const mandatory
Quest Property CF07 Auto Const mandatory
Quest Property LC088 Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property CrimsonFleetFaction Auto Const mandatory
Faction Property UCSysDefFaction Auto Const mandatory
Scene Property LC082_SysDefKickoutScene Auto Const mandatory
Perk Property LC088_Space_VigilanceDamageImmunityPerk Auto Const mandatory
Keyword Property DisallowAsCombatTargetKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(LC082_StartDockingBay, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:18
  lc082_vigilancequestscript kmyQuest = __temp as lc082_vigilancequestscript ; #DEBUG_LINE_NO:19
  kmyQuest.DEBUG_SetupVigilanceCombatDemo() ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0006_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:31
  lc082_vigilancequestscript kmyQuest = __temp as lc082_vigilancequestscript ; #DEBUG_LINE_NO:32
  kmyQuest.DEBUG_SetupBatteryCombatDemo() ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0010_Item_00()
  spaceshipreference vigilanceRef = Alias_VigilanceShip.GetShipRef() ; #DEBUG_LINE_NO:47
  vigilanceRef.AddKeyword(DisallowAsCombatTargetKeyword) ; #DEBUG_LINE_NO:48
  vigilanceRef.AddPerk(LC088_Space_VigilanceDamageImmunityPerk, False) ; #DEBUG_LINE_NO:49
  Alias_BrigClutter.DisableAll(False) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0010_Item_01()
  CF01.SetStage(2) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0011_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:68
  lc082_vigilancequestscript kmyQuest = __temp as lc082_vigilancequestscript ; #DEBUG_LINE_NO:69
  LC082_InterrogationRoomDoorRef.Unlock(False) ; #DEBUG_LINE_NO:75
  LC082_OperationsCenterElevatorAccessDoorRef.SetOpen(True) ; #DEBUG_LINE_NO:76
  LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True) ; #DEBUG_LINE_NO:77
  Alias_Kibwe.TryToMoveTo(CF01KibweOpsMarker) ; #DEBUG_LINE_NO:80
  Self.SetStage(25) ; #DEBUG_LINE_NO:83
  If LC088.GetStage() > 0 || CF07.IsRunning() ; #DEBUG_LINE_NO:86
    kmyQuest.UpdateVigilanceLocation("CF07") ; #DEBUG_LINE_NO:87
  ElseIf CF06.IsRunning() ; #DEBUG_LINE_NO:88
    kmyQuest.UpdateVigilanceLocation("CF06") ; #DEBUG_LINE_NO:89
  ElseIf CF05.IsRunning() ; #DEBUG_LINE_NO:90
    kmyQuest.UpdateVigilanceLocation("CF05") ; #DEBUG_LINE_NO:91
  ElseIf CF04.IsRunning() ; #DEBUG_LINE_NO:92
    kmyQuest.UpdateVigilanceLocation("CF04") ; #DEBUG_LINE_NO:93
  Else ; #DEBUG_LINE_NO:
    kmyQuest.UpdateVigilanceLocation("CF01") ; #DEBUG_LINE_NO:95
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_CF01InterrogationRoomGuards.DisableAll(False) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_0210_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:128
  lc082_vigilancequestscript kmyQuest = __temp as lc082_vigilancequestscript ; #DEBUG_LINE_NO:129
  kmyQuest.ProtectVigilanceMainActors(True) ; #DEBUG_LINE_NO:138
EndFunction

Function Fragment_Stage_0211_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:146
  lc082_vigilancequestscript kmyQuest = __temp as lc082_vigilancequestscript ; #DEBUG_LINE_NO:147
  kmyQuest.ProtectVigilanceMainActors(False) ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0250_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:161
  lc082_vigilancequestscript kmyQuest = __temp as lc082_vigilancequestscript ; #DEBUG_LINE_NO:162
  CF_Main.SetStage(300) ; #DEBUG_LINE_NO:173
  kmyQuest.ActivateTurrets() ; #DEBUG_LINE_NO:176
  kmyQuest.SetAllowDockingWithVigilance(False) ; #DEBUG_LINE_NO:179
  kmyQuest.UpdateVigilanceLocation("Shutdown") ; #DEBUG_LINE_NO:182
  kmyQuest.TryToStartKickoutScene() ; #DEBUG_LINE_NO:185
EndFunction

Function Fragment_Stage_0251_Item_00()
  LC082_SysDefKickoutScene.Start() ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0252_Item_00()
  Alias_VigilanceShip.GetShipRef().DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:207
EndFunction
