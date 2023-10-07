ScriptName Fragments:Quests:QF_FFClinicR01_001C2C96 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Target Auto Const mandatory
ReferenceAlias Property Alias_AlexeiLebedev Auto Const mandatory
ReferenceAlias Property Alias_JosephManning Auto Const mandatory
ReferenceAlias Property Alias_CharlieFlynn Auto Const mandatory
LocationAlias Property Alias_TargetLocation Auto Const mandatory
GlobalVariable Property FFClinicR01Completions Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  ffclinicr01questscript kmyQuest = __temp as ffclinicr01questscript ; #DEBUG_LINE_NO:8
  kmyQuest.Target_Var = Utility.RandomInt(1, 3) ; #DEBUG_LINE_NO:11
  If kmyQuest.Target_Var == 1 ; #DEBUG_LINE_NO:13
    Alias_Target.ForceRefTo(Alias_AlexeiLebedev.GetReference()) ; #DEBUG_LINE_NO:14
  ElseIf kmyQuest.Target_Var == 2 ; #DEBUG_LINE_NO:15
    Alias_Target.ForceRefTo(Alias_JosephManning.GetReference()) ; #DEBUG_LINE_NO:16
  ElseIf kmyQuest.Target_Var == 3 ; #DEBUG_LINE_NO:17
    Alias_Target.ForceRefTo(Alias_CharlieFlynn.GetReference()) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
  Alias_TargetLocation.ForceLocationTo(Alias_Target.GetReference().GetEditorLocation()) ; #DEBUG_LINE_NO:21
  Self.SetStage(10) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:31
  Game.GetPlayer().AddItem(Alias_Slate.GetReference() as Form, 1, False) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:40
  Game.GetPlayer().RemoveItem(Alias_Slate.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:41
  FFClinicR01Completions.SetValue(FFClinicR01Completions.GetValue() + 1.0) ; #DEBUG_LINE_NO:42
  Self.Stop() ; #DEBUG_LINE_NO:43
EndFunction
