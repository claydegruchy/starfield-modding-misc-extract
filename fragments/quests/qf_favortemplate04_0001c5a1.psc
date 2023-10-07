ScriptName Fragments:Quests:QF_FavorTemplate04_0001C5A1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_AmbushEncounter Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Scene Property FavorTemplate04_002_Ambush Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Self.GetStageDone(100) == False ; #DEBUG_LINE_NO:8
    Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(10) == True ; #DEBUG_LINE_NO:19
    Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:20
    Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
  Alias_AmbushEncounter.EnableAll(False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0110_Item_00()
  FavorTemplate04_002_Ambush.Start() ; #DEBUG_LINE_NO:33
  If Self.GetStageDone(10) == True ; #DEBUG_LINE_NO:36
    Self.SetObjectiveDisplayed(20, False, False) ; #DEBUG_LINE_NO:37
    Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_AmbushEncounter.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0135_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetStage(160) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0160_Item_00()
  If Self.GetStageDone(10) == True ; #DEBUG_LINE_NO:75
    Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:76
    Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:86
  Self.Stop() ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:95
  Self.Stop() ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_AmbushEncounter.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:105
EndFunction
