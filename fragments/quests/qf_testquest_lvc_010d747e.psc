ScriptName Fragments:Quests:QF_TestQuest_LVC_010D747E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property TestQuest_LVC_FaceCycleScene Auto Const mandatory
Message Property DEBUG_GEN_359096_StageSetTestMessage Auto Const mandatory
Spell Property CrTerrormorphMindControl Auto Const mandatory
Quest Property TestQuest_LVC_EndMidLine Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipInventory Auto Const mandatory
ReferenceAlias Property Alias_TestInventoryItem Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Scene Property TestQuest_LVC_ExistsTest Auto Const mandatory
ObjectReference Property LVC_ExistsTestOptionalMarker Auto Const mandatory
ReferenceAlias Property Alias_ExistsTestOptionalAlias Auto Const mandatory
ReferenceAlias Property Alias_TestMorph Auto Const mandatory
ReferenceAlias Property Alias_TestSecurityThrall Auto Const mandatory
Spell Property UC08_CrTerrormorphMindControl_Permanent Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  TestQuest_LVC_FaceCycleScene.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0400_Item_00()
  DEBUG_GEN_359096_StageSetTestMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(801, True, False) ; #DEBUG_LINE_NO:55
  Self.SetObjectiveDisplayed(802, True, False) ; #DEBUG_LINE_NO:56
  Self.SetObjectiveDisplayedAtTop(800) ; #DEBUG_LINE_NO:57
  Utility.Wait(4.0) ; #DEBUG_LINE_NO:58
  Self.SetObjectiveDisplayed(803, True, False) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:67
  test_lvcquestscript kmyQuest = __temp as test_lvcquestscript ; #DEBUG_LINE_NO:68
  kmyQuest.TestEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:71
  kmyQuest.TestEnableLayer.EnableInventoryMenuAccess(False) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0910_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:80
  test_lvcquestscript kmyQuest = __temp as test_lvcquestscript ; #DEBUG_LINE_NO:81
  kmyQuest.TestEnableLayer.Delete() ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayREF = Game.GetPlayer() ; #DEBUG_LINE_NO:92
  CrTerrormorphMindControl.Cast(PlayREF as ObjectReference, PlayREF as ObjectReference) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_1100_Item_00()
  MQ101Debug.Setvalue(8.0) ; #DEBUG_LINE_NO:101
  MQ101.SetStage(0) ; #DEBUG_LINE_NO:102
  Utility.Wait(30.0) ; #DEBUG_LINE_NO:103
  Alias_PlayerShipInventory.GetRef().AddItem(Alias_TestInventoryItem.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:104
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_1200_Item_00()
  TestQuest_LVC_EndMidLine.Start() ; #DEBUG_LINE_NO:113
EndFunction

Function Fragment_Stage_1300_Item_00()
  TestQuest_LVC_ExistsTest.Start() ; #DEBUG_LINE_NO:121
EndFunction

Function Fragment_Stage_1310_Item_00()
  Alias_ExistsTestOptionalAlias.ForceRefTo(LVC_ExistsTestOptionalMarker) ; #DEBUG_LINE_NO:129
EndFunction

Function Fragment_Stage_1400_Item_00()
  UC08_CrTerrormorphMindControl_Permanent.Cast(Alias_TestMorph.GetactorRef() as ObjectReference, Alias_TestSecurityThrall.GetactorRef() as ObjectReference) ; #DEBUG_LINE_NO:137
EndFunction
