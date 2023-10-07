ScriptName Fragments:Quests:QF_COM_Quest_Andreja_Commitm_000B8633 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Andreja Auto Const
sq_companionsscript Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Activator Property COM_CQ_TxtReplace_QuestName_Andreja Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  SQ_Companions.LockInCompanion(Alias_Andreja.GetActorReference() as companionactorscript, True, None, COM_CQ_TxtReplace_QuestName_Andreja) ; #DEBUG_LINE_NO:8
  Alias_MapMarker.GetReference().Enable(False) ; #DEBUG_LINE_NO:11
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:20
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0030_Item_00()
  If Self.IsObjectiveCompleted(10) == False ; #DEBUG_LINE_NO:29
    Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:32
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:41
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:50
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0060_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:59
  com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript ; #DEBUG_LINE_NO:60
  kmyQuest.GiveCommitmentGift() ; #DEBUG_LINE_NO:63
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:64
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:73
  com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript ; #DEBUG_LINE_NO:74
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:77
  kmyQuest.MakeCommitted() ; #DEBUG_LINE_NO:79
  SQ_Companions.LockInCompanion(Alias_Andreja.GetActorReference() as companionactorscript, False, None, None) ; #DEBUG_LINE_NO:82
  Self.Stop() ; #DEBUG_LINE_NO:84
EndFunction
