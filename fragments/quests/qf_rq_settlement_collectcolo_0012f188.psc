ScriptName Fragments:Quests:QF_RQ_Settlement_CollectColo_0012F188 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_DungeonMapMarker Auto Const
MiscObject Property RQS_CollectColonist_Meat Auto Const mandatory
GlobalVariable Property RQS_CollectColonist_MaxMeat Auto Const mandatory
RefCollectionAlias Property Alias_Creatures Auto Const mandatory
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_Stressed_PreAccept() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:20
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:21
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:33
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:37
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:39
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept() ; #DEBUG_LINE_NO:40
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:45
  RQS_CollectColonist_MaxMeat.SetValue(Alias_Creatures.GetCount() as Float) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:56
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0390_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:65
  Self.SetStage(990) ; #DEBUG_LINE_NO:66
  Game.GetPlayer().RemoveItem(RQS_CollectColonist_Meat as Form, 99, False, None) ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:78
    Self.SetStage(990) ; #DEBUG_LINE_NO:79
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:81
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  Game.GetPlayer().RemoveItem(RQS_CollectColonist_Meat as Form, 99, True, None) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:100
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:108
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:109
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:113
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:114
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:115
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:126
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:127
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:131
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:132
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:133
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:137
EndFunction
