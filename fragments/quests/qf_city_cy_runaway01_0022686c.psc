ScriptName Fragments:Quests:QF_City_CY_Runaway01_0022686C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property City_CY_Runaway01_Whiskey Auto Const mandatory
GlobalVariable Property City_CY_Runaway01_WhiskeyPriceNormal Auto Const mandatory
GlobalVariable Property City_CY_Runaway01_WhiskeyPriceReduced Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_Whiskey Auto Const mandatory
GlobalVariable Property City_CY_Runaway01_Ending Auto Const mandatory
ReferenceAlias Property Alias_Rivkah Auto Const mandatory
ReferenceAlias Property Alias_Jack Auto Const mandatory
ReferenceAlias Property Alias_Minerva Auto Const mandatory
ReferenceAlias Property Alias_Natan Auto Const mandatory
ReferenceAlias Property Alias_Guard01 Auto Const mandatory
ReferenceAlias Property Alias_Guard02 Auto Const mandatory
Topic Property City_CY_Runaway01_0415_Natan_ApproachTopic Auto Const mandatory
Quest Property DialogueCydonia Auto Const mandatory
Scene Property City_CY_Runaway01_0190_Companion_Whiskey Auto Const mandatory
ActorValue Property City_CY_Runaway01_Foreknowledge_NatanPeacefulAV Auto Const mandatory
ReferenceAlias Property Alias_GovWhiskey Auto Const mandatory
ReferenceAlias Property Alias_NatanDoor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_Minerva.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:15
  Self.SetStage(105) ; #DEBUG_LINE_NO:16
  Self.SetStage(110) ; #DEBUG_LINE_NO:17
  Self.SetStage(190) ; #DEBUG_LINE_NO:18
  Self.SetStage(200) ; #DEBUG_LINE_NO:19
  Self.SetStage(300) ; #DEBUG_LINE_NO:20
  Self.SetStage(400) ; #DEBUG_LINE_NO:21
  Self.SetStage(2) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(Alias_Natan.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().MoveTo(Alias_Rivkah.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0010_Item_00()
  DialogueCydonia.SetStage(1301) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:56
  Alias_GovWhiskey.GetRef().Enable(False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0190_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:73
  myPlayer.AddItem(Alias_Whiskey.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:74
  myPlayer.RemoveItem(Credits as Form, City_CY_Runaway01_WhiskeyPriceNormal.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:75
  Self.SetStage(200) ; #DEBUG_LINE_NO:76
  City_CY_Runaway01_0190_Companion_Whiskey.Start() ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0191_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:85
  myPlayer.AddItem(Alias_Whiskey.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:86
  myPlayer.RemoveItem(Credits as Form, City_CY_Runaway01_WhiskeyPriceReduced.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:87
  Self.SetStage(200) ; #DEBUG_LINE_NO:88
  City_CY_Runaway01_0190_Companion_Whiskey.Start() ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:97
  If !Self.IsObjectiveCompleted(110) && Self.IsObjectiveDisplayed(110) ; #DEBUG_LINE_NO:98
    Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:109
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:118
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:119
  Alias_Natan.GetRef().Enable(False) ; #DEBUG_LINE_NO:122
  ObjectReference myDoor = Alias_NatanDoor.GetRef() ; #DEBUG_LINE_NO:123
  myDoor.SetDoorInaccessible(False) ; #DEBUG_LINE_NO:124
  myDoor.Unlock(False) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0405_Item_00()
  Game.GetPlayer().RemoveItem(City_CY_Runaway01_Whiskey as Form, 1, False, None) ; #DEBUG_LINE_NO:133
EndFunction

Function Fragment_Stage_0415_Item_00()
  Actor myNatan = Alias_Natan.GetActorRef() ; #DEBUG_LINE_NO:141
  myNatan.EvaluatePackage(False) ; #DEBUG_LINE_NO:142
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:143
  myNatan.Say(City_CY_Runaway01_0415_Natan_ApproachTopic, None, False, None) ; #DEBUG_LINE_NO:144
EndFunction

Function Fragment_Stage_0440_Item_00()
  City_CY_Runaway01_Ending.SetValue(1.0) ; #DEBUG_LINE_NO:152
  Game.GetPlayer().SetValue(City_CY_Runaway01_Foreknowledge_NatanPeacefulAV, 1.0) ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0441_Item_00()
  City_CY_Runaway01_Ending.SetValue(2.0) ; #DEBUG_LINE_NO:161
EndFunction

Function Fragment_Stage_0442_Item_00()
  City_CY_Runaway01_Ending.SetValue(3.0) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0443_Item_00()
  City_CY_Runaway01_Ending.SetValue(4.0) ; #DEBUG_LINE_NO:177
EndFunction

Function Fragment_Stage_0444_Item_00()
  City_CY_Runaway01_Ending.SetValue(6.0) ; #DEBUG_LINE_NO:187
  Alias_Guard01.GetRef().Enable(False) ; #DEBUG_LINE_NO:190
  Alias_Guard02.GetRef().Enable(False) ; #DEBUG_LINE_NO:191
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:199
  Self.SetObjectiveDisplayed(450, True, False) ; #DEBUG_LINE_NO:200
  Alias_Guard01.GetRef().Enable(False) ; #DEBUG_LINE_NO:203
  Alias_Guard02.GetRef().Enable(False) ; #DEBUG_LINE_NO:204
  Alias_Natan.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, True) ; #DEBUG_LINE_NO:207
EndFunction

Function Fragment_Stage_0460_Item_00()
  City_CY_Runaway01_Ending.SetValue(5.0) ; #DEBUG_LINE_NO:215
  Self.SetObjectiveCompleted(450, True) ; #DEBUG_LINE_NO:216
  Self.SetStage(500) ; #DEBUG_LINE_NO:217
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:225
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:226
EndFunction

Function Fragment_Stage_0550_Item_00()
  If Self.GetStageDone(443) ; #DEBUG_LINE_NO:234
    Alias_Rivkah.GetRef().Disable(False) ; #DEBUG_LINE_NO:235
    Self.SetStage(700) ; #DEBUG_LINE_NO:236
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(600) ; #DEBUG_LINE_NO:238
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0610_Item_00()
  City_CY_Runaway01_Ending.SetValue(7.0) ; #DEBUG_LINE_NO:247
EndFunction

Function Fragment_Stage_0701_Item_00()
  Self.SetObjectiveDisplayed(500, False, False) ; #DEBUG_LINE_NO:255
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:256
EndFunction

Function Fragment_Stage_1000_Item_00()
  If Self.IsObjectiveDisplayed(500) ; #DEBUG_LINE_NO:264
    Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:265
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(700) ; #DEBUG_LINE_NO:267
    Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:268
  EndIf ; #DEBUG_LINE_NO:
  Alias_Natan.GetRef().Disable(False) ; #DEBUG_LINE_NO:271
  Self.Stop() ; #DEBUG_LINE_NO:273
EndFunction
