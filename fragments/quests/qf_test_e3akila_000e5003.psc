ScriptName Fragments:Quests:QF_TEST_E3Akila_000E5003 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property TEST_E3_AkilaCityConvoScene Auto Const mandatory
ReferenceAlias Property Alias_RangerMarker Auto Const mandatory
ReferenceAlias Property Alias_GuardMarker Auto Const mandatory
ReferenceAlias Property Alias_Ranger Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
ReferenceAlias Property Alias_RockEntrance Auto Const mandatory
ReferenceAlias Property Alias_Mary Auto Const mandatory
ReferenceAlias Property Alias_Helga Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_RangerMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:7
  Alias_GuardMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:8
  Alias_Helga.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:9
  Alias_Mary.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:10
  Alias_Ranger.GetRef().MoveTo(Alias_RangerMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  Alias_Guard.GetRef().MoveTo(Alias_GuardMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:12
  Game.GetPlayer().MoveTo(Alias_RockEntrance.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0010_Item_00()
  TEST_E3_AkilaCityConvoScene.Start() ; #DEBUG_LINE_NO:21
EndFunction
