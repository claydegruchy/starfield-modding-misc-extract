ScriptName Fragments:Quests:QF_FFCydoniaZ01_0022E140 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Ship Auto Const mandatory
ReferenceAlias Property Alias_Denis Auto Const mandatory
Scene Property FFCydoniaZ01_0201_Companion_Leech Auto Const mandatory
ActorValue Property FFCydoniaZ01_Foreknowledge_AV Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
RefCollectionAlias Property Alias_RefsToEnable Auto Const mandatory
ReferenceAlias Property Alias_DeadLeech Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_MapMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_Denis.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0100_Item_00()
  ObjectReference myLeech = Alias_DeadLeech.GetRef() ; #DEBUG_LINE_NO:23
  myLeech.Enable(False) ; #DEBUG_LINE_NO:24
  (myLeech as Actor).Kill(None) ; #DEBUG_LINE_NO:25
  Alias_Ship.GetRef().Enable(False) ; #DEBUG_LINE_NO:26
  Alias_RefsToEnable.EnableAll(False) ; #DEBUG_LINE_NO:27
  Alias_MapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:28
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:37
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0201_Item_00()
  FFCydoniaZ01_0201_Companion_Leech.Start() ; #DEBUG_LINE_NO:46
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0251_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:55
  If Self.GetStageDone(252) ; #DEBUG_LINE_NO:56
    Self.SetStage(300) ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0252_Item_00()
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:66
  If Self.GetStageDone(251) ; #DEBUG_LINE_NO:67
    Self.SetStage(300) ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:85
  Game.GetPlayer().SetValue(FFCydoniaZ01_Foreknowledge_AV, 1.0) ; #DEBUG_LINE_NO:86
  Self.Stop() ; #DEBUG_LINE_NO:87
EndFunction
