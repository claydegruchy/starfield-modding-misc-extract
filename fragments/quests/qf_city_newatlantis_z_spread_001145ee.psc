ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Spread_001145EE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Book Property pCity_NA_Z_SpreadTheNewsDataSlate Auto Const mandatory
ReferenceAlias Property Tommy Auto Const
ReferenceAlias Property NewsSlate Auto Const
ReferenceAlias Property NewsSlateReview Auto Const
ReferenceAlias Property NewsSlateSanctum Auto Const
ReferenceAlias Property George Auto Const
ReferenceAlias Property Catherine Auto Const
ReferenceAlias Property Royce Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:7
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:8
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:9
  Tommy.GetActorRef().RemoveItem(NewsSlate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:13
  Tommy.GetActorRef().RemoveItem(NewsSlateReview.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:14
  Tommy.GetActorRef().RemoveItem(NewsSlateSanctum.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:15
  Game.GetPlayer().AddItem(NewsSlate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:17
  Game.GetPlayer().AddItem(NewsSlateReview.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:18
  Game.GetPlayer().AddItem(NewsSlateSanctum.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:29
  Game.GetPlayer().RemoveItem(NewsSlate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:30
  George.GetActorRef().AddItem(NewsSlate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:31
  If Self.GetStageDone(30) == True && Self.GetStageDone(40) == True ; #DEBUG_LINE_NO:35
    Self.SetStage(50) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:49
  Game.GetPlayer().RemoveItem(NewsSlateReview.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:50
  Royce.GetActorRef().AddItem(NewsSlateReview.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:51
  If Self.GetStageDone(20) == True && Self.GetStageDone(40) == True ; #DEBUG_LINE_NO:55
    Self.SetStage(50) ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:69
  Game.GetPlayer().RemoveItem(NewsSlateSanctum.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:70
  Catherine.GetActorRef().AddItem(NewsSlateSanctum.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:71
  If Self.GetStageDone(20) == True && Self.GetStageDone(30) == True ; #DEBUG_LINE_NO:75
    Self.SetStage(50) ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:95
  Self.Stop() ; #DEBUG_LINE_NO:96
EndFunction
