ScriptName Fragments:Quests:QF_SE_ZW08_0012C072 Extends Quest Const hidden

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
LocationAlias Property Alias_OrbitLocation Auto Const mandatory
RefCollectionAlias Property Alias_SpaceCellObjectRefs Auto Const mandatory
Quest Property SE_ZW08_SpaceCell Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
GlobalVariable Property SE_ZW08_DoneOnceGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0002_Item_00()
  Alias_OrbitLocation.RefillAlias() ; #DEBUG_LINE_NO:8
  Alias_SpaceCellObjectRefs.RefillAlias() ; #DEBUG_LINE_NO:9
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:26
  se_legendaryscript kmyQuest = __temp as se_legendaryscript ; #DEBUG_LINE_NO:27
  SE_ZW08_SpaceCell.Start() ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0050_Item_00()
  PSE_ZW0801_HailingScene.Start() ; #DEBUG_LINE_NO:40
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:65
  SE_ZW08_DoneOnceGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:74
  SE_ZW08_SpaceCell.Stop() ; #DEBUG_LINE_NO:75
  Self.Stop() ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_1001_Item_00()
  Alias_TheBrute.GetShipRef().DamageValue(SpaceshipEngineHealth, 100000.0) ; #DEBUG_LINE_NO:84
  Alias_GuardShip01.GetShipRef().kill(None) ; #DEBUG_LINE_NO:85
  Alias_GuardShip02.GetShipRef().kill(None) ; #DEBUG_LINE_NO:86
  Alias_GuardShip03.GetShipRef().kill(None) ; #DEBUG_LINE_NO:87
  Alias_playerShip.GetShipRef().InstantDock(Alias_TheBrute.GetShipRef() as ObjectReference) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_1002_Item_00()
  Alias_TheBrute.GetShipRef().DamageValue(SpaceshipEngineHealth, 100000.0) ; #DEBUG_LINE_NO:97
  Alias_GuardShip01.GetShipRef().kill(None) ; #DEBUG_LINE_NO:98
  Alias_GuardShip02.GetShipRef().kill(None) ; #DEBUG_LINE_NO:99
  Alias_GuardShip03.GetShipRef().kill(None) ; #DEBUG_LINE_NO:100
EndFunction
