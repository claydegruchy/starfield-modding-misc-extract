ScriptName Fragments:Quests:QF_DialogueUCFactionAlwaysOn_0014618F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_ReconstructionMarker Auto Const mandatory
GlobalVariable Property UC04_PostAttackDialogueActive Auto Const mandatory
ReferenceAlias Property Alias_OverhangMarker Auto Const mandatory
Quest Property DialogueUCFactionNewAtlantis Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  ucparentfactionquestscript kmyQuest = __temp as ucparentfactionquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.BeginStateChangeTimer() ; #DEBUG_LINE_NO:11
  DialogueUCFactionNewAtlantis.SetStage(990) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_ReconstructionMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:21
  Alias_OverhangMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:22
  UC04_PostAttackDialogueActive.SetValue(0.0) ; #DEBUG_LINE_NO:23
  DialogueUCFactionNewAtlantis.SetStage(1000) ; #DEBUG_LINE_NO:25
EndFunction
