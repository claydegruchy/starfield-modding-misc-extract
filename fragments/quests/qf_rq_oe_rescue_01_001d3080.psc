ScriptName Fragments:Quests:QF_RQ_OE_Rescue_01_001D3080 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
ReferenceAlias Property Alias_Victim Auto Const mandatory
ReferenceAlias Property Alias_Item Auto Const mandatory
RefCollectionAlias Property Alias_Passengers Auto Const mandatory
RefCollectionAlias Property Alias_Actors Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_Calm_PreAccept() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:20
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:21
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:33
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:37
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:39
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept() ; #DEBUG_LINE_NO:40
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:61
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:62
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:65
  kmyQuest.SetDialogueAV_SecondaryObjectiveKnown() ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:75
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:76
  Self.SetObjectiveFailedIfNotCompleted(200) ; #DEBUG_LINE_NO:79
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:80
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:81
  kmyQuest.AddPassenger(Alias_Victim) ; #DEBUG_LINE_NO:83
  kmyQuest.AddPassengers(Alias_Actors) ; #DEBUG_LINE_NO:84
  ((Self as Quest) as rqscript).SetDialogueAV_Hello_AboardShip() ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:93
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:94
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:97
  kmyQuest.SetDialogueAV_SecondaryObjectiveSuccess() ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0490_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:107
  Self.SetStage(495) ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_0495_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:116
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:117
  kmyQuest.SetDialogueAV_Hello_DepartingShip() ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:128
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:130
    Self.SetStage(995) ; #DEBUG_LINE_NO:131
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:140
    Self.SetStage(995) ; #DEBUG_LINE_NO:141
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:151
    Self.SetStage(990) ; #DEBUG_LINE_NO:152
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:154
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0850_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:164
    Self.SetStage(990) ; #DEBUG_LINE_NO:165
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:167
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:176
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:185
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:193
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:194
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:198
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:199
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:200
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:203
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:211
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:212
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:216
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:217
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:218
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:219
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:222
EndFunction
