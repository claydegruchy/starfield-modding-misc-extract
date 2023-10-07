ScriptName Fragments:Quests:QF_SE_AF02_00222A40 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
Scene Property SE_AF02_004_RaceScene Auto Const
GlobalVariable Property SE_AF02_GateCount Auto Const
MiscObject Property Credits Auto Const
Scene Property SE_AF02_006_LoseScene Auto Const
Scene Property SE_AF02_007_WinScene Auto Const
Scene Property SE_AF02_001_HailingScene Auto Const mandatory
GlobalVariable Property SE_AF02_CreditCount Auto Const mandatory
GlobalVariable Property SE_AF02_DestroyShip Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  SE_AF02_001_HailingScene.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0007_Item_00()
  spaceshipreference ShipRef = Alias_Ship01.GetShipRef() ; #DEBUG_LINE_NO:15
  If ShipRef.Is3DLoaded() ; #DEBUG_LINE_NO:17
    ShipRef.DisableWithGravJump() ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0007_Item_01()
  Alias_Ship01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0007_Item_02()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:35
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:36
  Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:37
  Self.Stop() ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0010_Item_00()
  If !Self.GetStageDone(7) ; #DEBUG_LINE_NO:47
    Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:48
    Alias_Ship01.GetShipRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:49
  Else ; #DEBUG_LINE_NO:
    Self.Stop() ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
  Self.SetActive(True) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:65
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:74
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:83
  If Self.GetStageDone(32) ; #DEBUG_LINE_NO:84
    SE_AF02_006_LoseScene.Start() ; #DEBUG_LINE_NO:86
    Alias_Ship01.GetShipRef().AddItem(Credits as Form, SE_AF02_CreditCount.GetValueInt(), False) ; #DEBUG_LINE_NO:87
  Else ; #DEBUG_LINE_NO:
    SE_AF02_007_WinScene.Start() ; #DEBUG_LINE_NO:90
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0032_Item_00()
  Self.SetStage(30) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0035_Item_00()
  Alias_Ship01.GetShipRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_0040_Item_00()
  SE_AF02_GateCount.setvalue(1.0) ; #DEBUG_LINE_NO:115
  spaceshipreference raceShip = Alias_Ship01.GetShipRef() ; #DEBUG_LINE_NO:116
  raceShip.BlockActivation(False, False) ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.GetStageDone(32) ; #DEBUG_LINE_NO:126
    SE_AF02_DestroyShip.setvalue(1.0) ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveDisplayed(750, True, False) ; #DEBUG_LINE_NO:136
EndFunction
