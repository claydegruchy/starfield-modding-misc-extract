ScriptName Fragments:Quests:QF_MB_Rescue01_FCR05_0014CF4A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
Quest Property FC02 Auto Const mandatory
ReferenceAlias Property Alias_EnemyShipPilotSeat Auto Const mandatory
ReferenceAlias Property Alias_prisoner Auto Const mandatory
ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const mandatory
RefCollectionAlias Property Alias_enemies Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  If FC02.IsRunning() && FC02.GetStageDone(160) ; #DEBUG_LINE_NO:10
    FC02.SetStage(170) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:20
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_EnemyShipPilotSeat.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:29
  Alias_prisoner.TryToSetValue(SQ_CaptiveStateNoBlockingHellos, 1.0) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0050_Item_00()
  Int enemies = Alias_enemies.GetCount() ; #DEBUG_LINE_NO:41
  Int enemiesDead = Alias_enemies.GetCountDead() ; #DEBUG_LINE_NO:42
  If enemiesDead >= enemies ; #DEBUG_LINE_NO:43
    Self.SetStage(90) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0060_Item_00()
  Int nRand = Utility.RandomInt(0, 20) ; #DEBUG_LINE_NO:54
  Int nReward = 800 + nRand * 50 ; #DEBUG_LINE_NO:55
  Game.GetPlayer().AddItem(Credits as Form, nReward, False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:65
  missionrescuequestscript kmyQuest = __temp as missionrescuequestscript ; #DEBUG_LINE_NO:66
  defaultcaptivealias CaptiveNPC = Alias_prisoner as defaultcaptivealias ; #DEBUG_LINE_NO:69
  CaptiveNPC.FreePrisoner(True, False) ; #DEBUG_LINE_NO:72
  If FC02.IsRunning() && FC02.GetStageDone(160) ; #DEBUG_LINE_NO:75
    FC02.SetStage(180) ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:79
  fcrquestscript myFCRQuest = (kmyQuest as Quest) as fcrquestscript ; #DEBUG_LINE_NO:80
  myFCRQuest.FCRMissionComplete() ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:89
  missionrescuequestscript kmyQuest = __temp as missionrescuequestscript ; #DEBUG_LINE_NO:90
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:93
  kmyQuest.MissionShutdown() ; #DEBUG_LINE_NO:94
  Alias_EnemyShipPilotSeat.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:95
EndFunction
