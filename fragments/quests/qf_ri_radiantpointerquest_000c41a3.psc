ScriptName Fragments:Quests:QF_RI_RadiantPointerQuest_000C41A3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const mandatory
Quest Property RIR03 Auto Const mandatory
Quest Property RIR05 Auto Const mandatory
Quest Property RIR06 Auto Const mandatory
Quest Property RIR07 Auto Const mandatory
ReferenceAlias Property Alias_Yuko Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_PointerQuestGiverFurniture Auto Const mandatory
GlobalVariable Property RI05_ImogeneDead Auto Const mandatory
GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Float fQuestGiver = RI_RadiantQuestGiver.GetValue() ; #DEBUG_LINE_NO:11
  If fQuestGiver == 1.0 ; #DEBUG_LINE_NO:13
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef()) ; #DEBUG_LINE_NO:14
  ElseIf fQuestGiver == 2.0 ; #DEBUG_LINE_NO:15
    Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef()) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
  Alias_QuestGiver.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:19
  If RI05_ImogeneDead.GetValueInt() == 0 && RI05_Track_PlayerSidedWithMasako.GetValueInt() == 1 ; #DEBUG_LINE_NO:22
    Alias_Imogene.GetRef().MoveTo(Alias_PointerQuestGiverFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
  Else ; #DEBUG_LINE_NO:
    Alias_Yuko.GetRef().MoveTo(Alias_PointerQuestGiverFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Imogene.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:34
  Alias_Yuko.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:51
  Self.Stop() ; #DEBUG_LINE_NO:52
EndFunction
