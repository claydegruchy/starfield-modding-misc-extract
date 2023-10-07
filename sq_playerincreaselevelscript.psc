ScriptName SQ_PlayerIncreaseLevelScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MB_MaxTargetLevel Auto Const mandatory
{ global for max encounter level }
Int Property encounterLevelMaxAdjustment = 10 Auto Const
{ how much to add to player level to get max encounter level global }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:10
  Int playerLevel = playerRef.GetLevel() ; #DEBUG_LINE_NO:11
  MB_MaxTargetLevel.SetValueInt(playerLevel + encounterLevelMaxAdjustment) ; #DEBUG_LINE_NO:15
  Self.Stop() ; #DEBUG_LINE_NO:17
EndEvent
