ScriptName Fragments:Quests:QF_SE_KT04_000251D1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_KT04_HailStart Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
GlobalVariable Property BE_KT04_AudioSlateSeries Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
GlobalVariable Property BE_KT04_Variant01 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant02 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant03 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant04 Auto Const mandatory
RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const mandatory
RefCollectionAlias Property Alias_CrewWoundedMarkers Auto Const mandatory
Furniture Property NPCWoundedLean Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Quest Property BE_KT04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  BE_KT04_AudioSlateSeries.SetValue(0.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  BE_KT04_AudioSlateSeries.SetValue(1.0) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0003_Item_00()
  BE_KT04_AudioSlateSeries.SetValue(2.0) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0004_Item_00()
  BE_KT04_AudioSlateSeries.SetValue(3.0) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0.0) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0005_Item_01()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:47
  Self.SetStage(1) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0005_Item_02()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:56
  Self.SetStage(2) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0005_Item_03()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:65
  Self.SetStage(3) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0005_Item_04()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:74
  Self.SetStage(4) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0005_Item_05()
  Self.SetStage(6) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0006_Item_00()
  BE_KT04_AudioSlateSeries.SetValue(4.0) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:99
  BE_KT04.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:100
  Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0010_Item_00()
  ObjectReference[] FurnitureRef = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:109
  Int I = 0 ; #DEBUG_LINE_NO:110
  While I < FurnitureRef.Length ; #DEBUG_LINE_NO:111
    Alias_CrewWoundedMarkers.AddRef(FurnitureRef[I].PlaceAtMe(NPCWoundedLean as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:112
    I += 1 ; #DEBUG_LINE_NO:113
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_01()
  Alias_MapMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:122
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:130
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0.0) ; #DEBUG_LINE_NO:138
  HailTemplate_100a_KT04_HailStart.Start() ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:147
  Self.Stop() ; #DEBUG_LINE_NO:148
EndFunction
