ScriptName Fragments:Quests:QF_City_AkilaLife02_00112ACE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_SaharFarmMapMarker Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_FarmContainer Auto Const mandatory
Book Property AkilaLife02_SaharWill Auto Const mandatory
ReferenceAlias Property Alias_SaharWill Auto Const mandatory
ReferenceAlias Property Alias_OETrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_SaharFarmMapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:8
  Alias_OETrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0025_Item_00()
  If !Self.GetStageDone(50) ; #DEBUG_LINE_NO:19
    Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:29
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:38
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:39
  Alias_SaharFarmMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0150_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:64
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:65
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:74
  Alias_SaharWill.GetRef().Delete() ; #DEBUG_LINE_NO:77
  Game.GetPlayer().RemoveItem(AkilaLife02_SaharWill as Form, 1, False, None) ; #DEBUG_LINE_NO:78
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(300, False, False) ; #DEBUG_LINE_NO:89
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:90
  Alias_SaharWill.GetRef().Delete() ; #DEBUG_LINE_NO:93
  Game.GetPlayer().RemoveItem(AkilaLife02_SaharWill as Form, 1, False, None) ; #DEBUG_LINE_NO:94
  Self.SetStage(9000) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:104
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:105
  Self.SetStage(9000) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:115
EndFunction
