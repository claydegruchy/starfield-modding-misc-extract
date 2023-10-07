ScriptName SE_FAB09_SpawnScript Extends Quest Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property SE_Stage = 11 Auto Const
Quest Property SE_FAB09 Auto Const mandatory
GlobalVariable Property SE_FAB09_SpawnChance Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Int nChance = SE_FAB09_SpawnChance.GetValue() as Int ; #DEBUG_LINE_NO:9
  Int nRoll = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:10
  If Utility.RandomInt(0, 100) <= nChance && !SE_FAB09.IsRunning() ; #DEBUG_LINE_NO:12
    SE_FAB09.SetStage(SE_Stage) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndEvent
