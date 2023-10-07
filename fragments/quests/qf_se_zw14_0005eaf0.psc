ScriptName Fragments:Quests:QF_SE_ZW14_0005EAF0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
Scene Property PSE_ZW0801_HailingScene Auto Const mandatory
ReferenceAlias Property Alias_TheBrute Auto Const mandatory
Faction Property PPlayerFriendFaction Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_GuardShip01 Auto Const mandatory
ReferenceAlias Property Alias_GuardShip02 Auto Const mandatory
ReferenceAlias Property Alias_GuardShip03 Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ActorValue Property SpaceshipEngineHealth Auto Const mandatory
Quest Property SE_ZW14_SpaceCell Auto Const mandatory
GlobalVariable Property SE_ZW14_DoneOnceGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0025_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0015_Item_00()
  SE_ZW14_SpaceCell.Start() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0050_Item_00()
  PSE_ZW0801_HailingScene.Start() ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:59
  SE_ZW14_DoneOnceGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_1001_Item_00()
  Alias_TheBrute.GetShipRef().DamageValue(SpaceshipEngineHealth, 100000.0) ; #DEBUG_LINE_NO:76
  Alias_GuardShip01.GetShipRef().kill(None) ; #DEBUG_LINE_NO:77
  Alias_GuardShip02.GetShipRef().kill(None) ; #DEBUG_LINE_NO:78
  Alias_GuardShip03.GetShipRef().kill(None) ; #DEBUG_LINE_NO:79
  Alias_playerShip.GetShipRef().InstantDock(Alias_TheBrute.GetShipRef() as ObjectReference) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_1002_Item_00()
  Alias_TheBrute.GetShipRef().DamageValue(SpaceshipEngineHealth, 100000.0) ; #DEBUG_LINE_NO:89
  Alias_GuardShip01.GetShipRef().kill(None) ; #DEBUG_LINE_NO:90
  Alias_GuardShip02.GetShipRef().kill(None) ; #DEBUG_LINE_NO:91
  Alias_GuardShip03.GetShipRef().kill(None) ; #DEBUG_LINE_NO:92
EndFunction
