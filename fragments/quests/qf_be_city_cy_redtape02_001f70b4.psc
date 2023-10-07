ScriptName Fragments:Quests:QF_BE_City_CY_RedTape02_001F70B4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_CY_RedTape02 Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
Faction Property CityCYRedTape02CrimsonFleetNeutralFaction Auto Const mandatory
Topic Property BE_City_CY_RedTape02_Captain_TimesUpTopic Auto Const mandatory
ReferenceAlias Property Alias_Note Auto Const mandatory
Quest Property City_CY_RedTape02_Blackmail Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ActorValue Property SpaceshipGravJumpFuel Auto Const mandatory
Scene Property BE_City_CY_RedTape02_Captain_0020_ForceGreet Auto Const mandatory
Scene Property BE_City_CY_RedTape02_Captain_0020_TimesUp Auto Const mandatory
ActorValue Property City_CY_RedTape02_Foreknowledge_PirateAV Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
ReferenceAlias Property Alias_Corpse Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  Alias_Corpse.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:7
  City_CY_RedTape02.SetStage(610) ; #DEBUG_LINE_NO:8
  Alias_AllCrew.EvaluateAll() ; #DEBUG_LINE_NO:10
  Alias_Captain.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:19
  becitycyredtape02questscript kmyQuest = __temp as becitycyredtape02questscript ; #DEBUG_LINE_NO:20
  kmyQuest.StartCountdown() ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0031_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:31
  becitycyredtape02questscript kmyQuest = __temp as becitycyredtape02questscript ; #DEBUG_LINE_NO:32
  kmyQuest.StopCountdown() ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0032_Item_00()
  BE_City_CY_RedTape02_Captain_0020_ForceGreet.Stop() ; #DEBUG_LINE_NO:43
  Alias_Captain.GetRef().Say(BE_City_CY_RedTape02_Captain_TimesUpTopic, None, False, None) ; #DEBUG_LINE_NO:44
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:45
  Self.SetStage(90) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0033_Item_00()
  BE_City_CY_RedTape02_Captain_0020_ForceGreet.Stop() ; #DEBUG_LINE_NO:54
  Self.SetStage(90) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:63
  Game.GetPlayer().AddItem(Alias_Note.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0041_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:72
  becitycyredtape02questscript kmyQuest = __temp as becitycyredtape02questscript ; #DEBUG_LINE_NO:73
  kmyQuest.RemoveShipParts() ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0042_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:84
  becitycyredtape02questscript kmyQuest = __temp as becitycyredtape02questscript ; #DEBUG_LINE_NO:85
  kmyQuest.RemoveShipParts() ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0050_Item_00()
  City_CY_RedTape02.SetStage(616) ; #DEBUG_LINE_NO:96
  City_CY_RedTape02.SetStage(620) ; #DEBUG_LINE_NO:97
  City_CY_RedTape02.SetStage(700) ; #DEBUG_LINE_NO:98
  Alias_Captain.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0090_Item_00()
  Alias_AllCrew.RemoveFromFaction(CityCYRedTape02CrimsonFleetNeutralFaction) ; #DEBUG_LINE_NO:107
  Actor myCaptain = Alias_Captain.GetActorRef() ; #DEBUG_LINE_NO:108
  myCaptain.RemoveFromFaction(CityCYRedTape02CrimsonFleetNeutralFaction) ; #DEBUG_LINE_NO:109
  Alias_AllCrew.EvaluateAll() ; #DEBUG_LINE_NO:111
  myCaptain.EvaluatePackage(False) ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(150) ; #DEBUG_LINE_NO:120
    City_CY_RedTape02.SetStage(615) ; #DEBUG_LINE_NO:121
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:130
    City_CY_RedTape02.SetStage(615) ; #DEBUG_LINE_NO:131
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  City_CY_RedTape02.SetStage(620) ; #DEBUG_LINE_NO:140
  City_CY_RedTape02.SetStage(630) ; #DEBUG_LINE_NO:141
  City_CY_RedTape02_Blackmail.Start() ; #DEBUG_LINE_NO:142
EndFunction

Function Fragment_Stage_0201_Item_00()
  City_CY_RedTape02.SetStage(620) ; #DEBUG_LINE_NO:150
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:158
  becitycyredtape02questscript kmyQuest = __temp as becitycyredtape02questscript ; #DEBUG_LINE_NO:159
  kmyQuest.ShipUndock() ; #DEBUG_LINE_NO:162
EndFunction
