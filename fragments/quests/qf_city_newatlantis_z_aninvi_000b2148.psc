ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_AnInvi_000B2148 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Marcus Auto Const mandatory
ReferenceAlias Property Alias_Slate1 Auto Const mandatory
ReferenceAlias Property Alias_Slate2 Auto Const mandatory
ReferenceAlias Property Alias_Slate3 Auto Const mandatory
ReferenceAlias Property Alias_Tony Auto Const mandatory
ReferenceAlias Property Alias_Johann Auto Const mandatory
ReferenceAlias Property Alias_Evie Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().moveto(Alias_Marcus.GetActorRef() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:16
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:17
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:18
  Alias_Marcus.GetActorRef().RemoveItem(Alias_Slate1.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:21
  Alias_Marcus.GetActorRef().RemoveItem(Alias_Slate2.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:22
  Alias_Marcus.GetActorRef().RemoveItem(Alias_Slate3.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:23
  Game.GetPlayer().AddItem(Alias_Slate1.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:24
  Game.GetPlayer().AddItem(Alias_Slate2.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:25
  Game.GetPlayer().AddItem(Alias_Slate3.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:36
  Game.GetPlayer().RemoveItem(Alias_Slate1.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:37
  Alias_Tony.GetActorRef().AddItem(Alias_Slate1.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:38
  If Self.GetStageDone(30) == True && Self.GetStageDone(40) == True ; #DEBUG_LINE_NO:42
    Self.SetStage(50) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:56
  Game.GetPlayer().RemoveItem(Alias_Slate2.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:57
  Alias_Evie.GetActorRef().AddItem(Alias_Slate2.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:58
  If Self.GetStageDone(20) == True && Self.GetStageDone(40) == True ; #DEBUG_LINE_NO:62
    Self.SetStage(50) ; #DEBUG_LINE_NO:64
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:76
  Game.GetPlayer().RemoveItem(Alias_Slate3.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:77
  Alias_Johann.GetActorRef().AddItem(Alias_Slate3.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:78
  If Self.GetStageDone(20) == True && Self.GetStageDone(30) == True ; #DEBUG_LINE_NO:82
    Self.SetStage(50) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:113
EndFunction
