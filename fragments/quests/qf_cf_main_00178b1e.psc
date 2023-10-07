ScriptName Fragments:Quests:QF_CF_Main_00178B1E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimsonFleetFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Perk Property FactionCrimsonFleetPerk Auto Const mandatory
GlobalVariable Property CF_SysDefShutdown Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Faction Property UCSysDefFaction Auto Const mandatory
Quest Property CFKey Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
GlobalVariable Property PlayerJoined_CrimsonFleet Auto Const mandatory
GlobalVariable Property PlayerJoined_SysDef Auto Const mandatory
Perk Property FactionUnitedColoniesSysDefPerk Auto Const mandatory
Quest Property CF01 Auto Const mandatory
Message Property CF_Main_SysDefKickout Auto Const mandatory
Quest Property LC088 Auto Const mandatory
Quest Property DialogueUCVigilance Auto Const mandatory
ObjectReference Property TheKeyMapMarkerHeadingRef Auto Const mandatory
ObjectReference Property TheKeyOriginMarkerRef Auto Const mandatory
ObjectReference Property TheKeyPlanetUniqueArrivalMarkerRef Auto Const mandatory
ObjectReference Property PrisonMarkerNewAtlantis Auto Const mandatory
GlobalVariable Property CF04_UCArrested Auto Const mandatory
Quest Property CF04 Auto Const mandatory
Quest Property CFSD01 Auto Const mandatory
Faction[] Property FleetFriendFactions Auto Const mandatory
Quest Property CF02 Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0250_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:10
  Self.SetStage(20) ; #DEBUG_LINE_NO:11
  LC082.SetStage(11) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:25
  CFKey.SetStage(200) ; #DEBUG_LINE_NO:26
  DialogueCFTheKey.SetStage(4) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().AddtoFaction(CrimsonFleetFaction) ; #DEBUG_LINE_NO:35
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False) ; #DEBUG_LINE_NO:36
  PlayerJoined_CrimsonFleet.SetValue(1.0) ; #DEBUG_LINE_NO:37
  TheKeyMapMarkerHeadingRef.MoveTo(TheKeyOriginMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:40
  TheKeyPlanetUniqueArrivalMarkerRef.MoveTo(TheKeyOriginMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:41
  Int I = 0 ; #DEBUG_LINE_NO:44
  While I < FleetFriendFactions.Length ; #DEBUG_LINE_NO:46
    CrimsonFleetFaction.SetAlly(FleetFriendFactions[I], True, True) ; #DEBUG_LINE_NO:47
    I += 1 ; #DEBUG_LINE_NO:48
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  PlayerFaction.SetAlly(UCSysDefFaction, False, False) ; #DEBUG_LINE_NO:57
  LC082.SetStage(200) ; #DEBUG_LINE_NO:58
  PlayerJoined_SysDef.SetValue(1.0) ; #DEBUG_LINE_NO:59
  Game.GetPlayer().AddPerk(FactionUnitedColoniesSysDefPerk, False) ; #DEBUG_LINE_NO:60
  DialogueUCVigilance.SetStage(90) ; #DEBUG_LINE_NO:61
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().RemoveFromFaction(CrimsonFleetFaction) ; #DEBUG_LINE_NO:69
  PlayerFaction.SetEnemy(CrimsonFleetFaction, False, False) ; #DEBUG_LINE_NO:70
  Game.GetPlayer().RemovePerk(FactionCrimsonFleetPerk) ; #DEBUG_LINE_NO:71
  Int I = 0 ; #DEBUG_LINE_NO:74
  While I < FleetFriendFactions.Length ; #DEBUG_LINE_NO:76
    CrimsonFleetFaction.SetEnemy(FleetFriendFactions[I], True, True) ; #DEBUG_LINE_NO:77
    I += 1 ; #DEBUG_LINE_NO:78
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0275_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:95
  cf_main_questscript kmyQuest = __temp as cf_main_questscript ; #DEBUG_LINE_NO:96
  kmyQuest.RegisterForLoadScreenEvent() ; #DEBUG_LINE_NO:100
  Game.GetPlayer().MoveTo(PrisonMarkerNewAtlantis, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:101
  kmyQuest.SendPlayerToJail() ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:112
  cf_main_questscript kmyQuest = __temp as cf_main_questscript ; #DEBUG_LINE_NO:113
  PlayerFaction.SetEnemy(UCSysDefFaction, False, False) ; #DEBUG_LINE_NO:116
  CF_SysDefShutdown.SetValue(1.0) ; #DEBUG_LINE_NO:117
  kmyQuest.SysDefShutdown() ; #DEBUG_LINE_NO:118
  LC082.SetStage(250) ; #DEBUG_LINE_NO:119
  Game.GetPlayer().RemovePerk(FactionUnitedColoniesSysDefPerk) ; #DEBUG_LINE_NO:120
  If CF02.GetStageDone(999) && !CF02.GetStageDone(1700) ; #DEBUG_LINE_NO:123
    CF02.SetStage(998) ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
  If CFSD01.GetStageDone(5) == False ; #DEBUG_LINE_NO:128
    CFSD01.SetStage(5) ; #DEBUG_LINE_NO:129
  EndIf ; #DEBUG_LINE_NO:
  If LC088.GetStage() == 0 ; #DEBUG_LINE_NO:133
    CF_Main_SysDefKickout.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:134
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(75) ; #DEBUG_LINE_NO:136
  EndIf ; #DEBUG_LINE_NO:
  CFSD01.SetStage(1500) ; #DEBUG_LINE_NO:139
  If CF01.IsRunning() && CF01.GetStageDone(175) == False ; #DEBUG_LINE_NO:142
    If CF01.GetStageDone(310) == False ; #DEBUG_LINE_NO:143
      CF01.SetStage(230) ; #DEBUG_LINE_NO:144
    ElseIf CF01.GetStageDone(310) == True && CF01.GetStageDone(340) == False ; #DEBUG_LINE_NO:145
      CF01.SetStage(309) ; #DEBUG_LINE_NO:146
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  DialogueUCVigilance.FailAllObjectives() ; #DEBUG_LINE_NO:151
EndFunction
