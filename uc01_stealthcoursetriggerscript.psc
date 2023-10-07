ScriptName UC01_StealthCourseTriggerScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool bProcessing
Int iTriggerCount

;-- Properties --------------------------------------
Quest Property UC01 Auto Const mandatory
{ Quest object that manages this stage }
Int Property ShutdownStage = 400 Auto Const
{ Once this stage is set on UC01, shut it all down }
Faction Property UC01_SectorBEnemyFaction Auto Const mandatory
{ Faction to apply to the player if they're in the trigger }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If !UC01.GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:15
    Self.AdjustTriggerCount(True) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If !UC01.GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:21
    Self.AdjustTriggerCount(False) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function AdjustTriggerCount(Bool bAdd)
  While bProcessing ; #DEBUG_LINE_NO:
    Utility.Wait(0.5) ; #DEBUG_LINE_NO:29
  EndWhile ; #DEBUG_LINE_NO:
  bProcessing = True ; #DEBUG_LINE_NO:31
  Actor PlayerACT = Game.GetPlayer() ; #DEBUG_LINE_NO:32
  If bAdd ; #DEBUG_LINE_NO:34
    iTriggerCount += 1 ; #DEBUG_LINE_NO:35
    If iTriggerCount == 1 ; #DEBUG_LINE_NO:36
      PlayerACT.AddToFaction(UC01_SectorBEnemyFaction) ; #DEBUG_LINE_NO:37
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    iTriggerCount -= 1 ; #DEBUG_LINE_NO:40
    If iTriggerCount == 0 ; #DEBUG_LINE_NO:41
      PlayerACT.RemoveFromFaction(UC01_SectorBEnemyFaction) ; #DEBUG_LINE_NO:42
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  bProcessing = False ; #DEBUG_LINE_NO:45
EndFunction
