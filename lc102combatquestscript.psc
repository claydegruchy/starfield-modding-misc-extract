ScriptName LC102CombatQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property targetQuest Auto Const mandatory
Int Property stageToSet Auto Const mandatory

;-- Functions ---------------------------------------

Function SetTargetQuestStage()
  If !targetQuest.IsStageDone(stageToSet) ; #DEBUG_LINE_NO:7
    targetQuest.SetStage(stageToSet) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndFunction
