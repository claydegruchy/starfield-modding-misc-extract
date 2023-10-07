ScriptName Fragments:Quests:QF_RQ_OE_KillCreature_01_0073CEAA Extends Quest Const hidden

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
Potion Property Aid_MedPack Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:8
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:11
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:20
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:21
  If !Self.IsObjectiveDisplayed(100) ; #DEBUG_LINE_NO:24
    Self.SetStage(990) ; #DEBUG_LINE_NO:26
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:28
    Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0390_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:38
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:39
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:42
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:43
  Self.SetStage(990) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:52
EndFunction
