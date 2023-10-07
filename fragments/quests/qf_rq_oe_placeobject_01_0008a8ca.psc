ScriptName Fragments:Quests:QF_RQ_OE_PlaceObject_01_0008A8CA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory
ReferenceAlias Property Alias_ObjectToPlace Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rq_placeobjectscript kmyQuest = __temp as rq_placeobjectscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_Calm_PreAccept() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:20
  rq_placeobjectscript kmyQuest = __temp as rq_placeobjectscript ; #DEBUG_LINE_NO:21
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0075_Item_00()
  Alias_QuestGiver.TryToEvaluatePackage() ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:41
  rq_placeobjectscript kmyQuest = __temp as rq_placeobjectscript ; #DEBUG_LINE_NO:42
  Self.SetStage(200) ; #DEBUG_LINE_NO:45
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:47
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:49
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept() ; #DEBUG_LINE_NO:50
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:62
  rq_placeobjectscript kmyQuest = __temp as rq_placeobjectscript ; #DEBUG_LINE_NO:63
  kmyQuest.PlaceInteractionActivators() ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:75
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:84
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:86
    Self.SetStage(995) ; #DEBUG_LINE_NO:87
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:97
    Self.SetStage(990) ; #DEBUG_LINE_NO:98
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:118
  rq_placeobjectscript kmyQuest = __temp as rq_placeobjectscript ; #DEBUG_LINE_NO:119
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:123
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:124
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:125
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:128
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:136
  rq_placeobjectscript kmyQuest = __temp as rq_placeobjectscript ; #DEBUG_LINE_NO:137
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:141
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:142
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:143
    kmyQuest.SetDialogueAV_Hello_Calm_Success() ; #DEBUG_LINE_NO:144
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0999_Item_00()
  ObjectReference QuestObject = Alias_ObjectToPlace.GetRef() ; #DEBUG_LINE_NO:155
  If Game.GetPlayer().GetItemCount(QuestObject as Form) >= 1 ; #DEBUG_LINE_NO:157
    Game.GetPlayer().RemoveItem(QuestObject as Form, 99, True, None) ; #DEBUG_LINE_NO:158
  EndIf ; #DEBUG_LINE_NO:
EndFunction
