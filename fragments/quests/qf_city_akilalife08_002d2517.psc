ScriptName Fragments:Quests:QF_City_AkilaLife08_002D2517 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property AkilaLife08_WheatJar Auto Const mandatory
ReferenceAlias Property Alias_WheatDelivery Auto Const mandatory
ReferenceAlias Property Alias_Ashta Auto Const mandatory
ReferenceAlias Property Alias_Ashta02 Auto Const mandatory
ReferenceAlias Property Alias_Ashta03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  If !Self.GetStageDone(100) ; #DEBUG_LINE_NO:8
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:18
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:27
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:28
  Alias_Ashta.GetRef().Enable(False) ; #DEBUG_LINE_NO:29
  Alias_Ashta02.GetRef().Enable(False) ; #DEBUG_LINE_NO:30
  Alias_Ashta03.GetRef().Enable(False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:39
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:48
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:49
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:50
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:51
  If Alias_Ashta.GetActorRef().IsDead() == False ; #DEBUG_LINE_NO:52
    Alias_Ashta.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
  If Alias_Ashta02.GetActorRef().IsDead() == False ; #DEBUG_LINE_NO:55
    Alias_Ashta02.GetRef().Disable(False) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
  If Alias_Ashta03.GetActorRef().IsDead() == False ; #DEBUG_LINE_NO:58
    Alias_Ashta03.GetRef().Disable(False) ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:68
  If Self.GetStageDone(600) && Self.GetStageDone(700) ; #DEBUG_LINE_NO:71
    Self.SetStage(800) ; #DEBUG_LINE_NO:72
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:81
  If Self.GetStageDone(500) && Self.GetStageDone(700) ; #DEBUG_LINE_NO:84
    Self.SetStage(800) ; #DEBUG_LINE_NO:85
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:94
  If Self.GetStageDone(600) && Self.GetStageDone(500) ; #DEBUG_LINE_NO:97
    Self.SetStage(800) ; #DEBUG_LINE_NO:98
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:115
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:116
  Game.GetPlayer().AddAliasedItem(AkilaLife08_WheatJar as Form, Alias_WheatDelivery as Alias, 1, False) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:127
  Game.GetPlayer().RemoveItem(AkilaLife08_WheatJar as Form, 1, False, None) ; #DEBUG_LINE_NO:130
  Self.SetStage(9000) ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:140
EndFunction
