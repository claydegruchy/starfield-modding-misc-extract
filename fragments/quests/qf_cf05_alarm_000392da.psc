ScriptName Fragments:Quests:QF_CF05_Alarm_000392DA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property LC043SYFaction Auto Const mandatory
Faction Property LC043SY01Faction Auto Const mandatory
Faction Property LC043SY02Faction Auto Const mandatory
Faction Property LC043SY03Faction Auto Const mandatory
Quest Property CF05 Auto Const mandatory
ObjectReference Property CF05_CommandBayDoorREF Auto Const mandatory
ReferenceAlias Property Alias_CF05_GabrielVogel Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
ReferenceAlias Property Alias_CF05_EngineerMedina Auto Const mandatory
Quest Property LC043 Auto Const mandatory
ReferenceAlias Property Alias_CF05_CargoDoorLock Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0060_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  PlayerRef.RemoveFromFaction(LC043SY01Faction) ; #DEBUG_LINE_NO:8
  Alias_CF05_CargoDoorLock.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:9
  LC043.SetStage(150) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0060_Item_01()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:19
  PlayerRef.RemoveFromFaction(LC043SY02Faction) ; #DEBUG_LINE_NO:20
  CF05_CommandBayDoorREF.Lock(False, False, True) ; #DEBUG_LINE_NO:21
  If CF05.GetStageDone(1029) ; #DEBUG_LINE_NO:23
    Alias_CF05_EngineerMedina.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
  LC043.SetStage(250) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0060_Item_02()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:35
  PlayerRef.RemoveFromFaction(LC043SY03Faction) ; #DEBUG_LINE_NO:36
  Alias_CF05_GabrielVogel.GetActorRef().RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:37
  LC043.SetStage(350) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0060_Item_03()
  CF05.SetStage(60) ; #DEBUG_LINE_NO:47
  CF05.SetObjectiveSkipped(810) ; #DEBUG_LINE_NO:48
  If !CF05.GetStageDone(1200) ; #DEBUG_LINE_NO:50
    CF05.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
  CF05.SetObjectiveSkipped(1014) ; #DEBUG_LINE_NO:54
  CF05.SetObjectiveSkipped(1016) ; #DEBUG_LINE_NO:55
  CF05.SetObjectiveSkipped(1020) ; #DEBUG_LINE_NO:56
  CF05.SetObjectiveSkipped(1030) ; #DEBUG_LINE_NO:57
  CF05.SetObjectiveSkipped(1040) ; #DEBUG_LINE_NO:58
  CF05.SetObjectiveSkipped(1041) ; #DEBUG_LINE_NO:59
  CF05.SetObjectiveSkipped(1050) ; #DEBUG_LINE_NO:60
  CF05.SetObjectiveSkipped(1060) ; #DEBUG_LINE_NO:61
  CF05.SetObjectiveSkipped(1700) ; #DEBUG_LINE_NO:62
  CF05.SetObjectiveSkipped(1710) ; #DEBUG_LINE_NO:63
EndFunction
