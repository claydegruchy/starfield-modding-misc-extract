ScriptName UC05_ArchivalCodeMachineScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool bIncooldown
Bool bIssueLineOnce
Int iTimerID = 1 Const

;-- Properties --------------------------------------
Key Property RequiredKey Auto Const mandatory
{ Key object player must have in order to access this }
Topic Property UC05_PlayerLacksCodeMachineKey Auto Const mandatory
{ Topic to play when the player lacks the key to access this code machine }
Topic Property UC05_IssuingCode Auto Const mandatory
{ Topic to play when issuing the code }
Topic Property UC05_CodeDispensed Auto Const mandatory
{ Topic to play when the player lacks the key to access this code machine }
Quest Property UC05 Auto Const mandatory
{ Quest object for UC05 }
Int Property StageToSet Auto Const mandatory
{ If the player has the required key, set this stage }
Int Property AudioCooldown = 7 Auto Const
{ How long to wait between audio lines }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:30
  If akActionRef == PlayACT as ObjectReference ; #DEBUG_LINE_NO:31
    If UC05.GetStageDone(StageToSet) ; #DEBUG_LINE_NO:32
      If !bIncooldown ; #DEBUG_LINE_NO:34
        bIncooldown = True ; #DEBUG_LINE_NO:35
        Self.StartTimer(AudioCooldown as Float, iTimerID) ; #DEBUG_LINE_NO:36
        Self.Say(UC05_CodeDispensed, None, False, None) ; #DEBUG_LINE_NO:37
      EndIf ; #DEBUG_LINE_NO:
    ElseIf PlayACT.GetItemCount(RequiredKey as Form) < 1 ; #DEBUG_LINE_NO:40
      If !bIncooldown ; #DEBUG_LINE_NO:42
        bIncooldown = True ; #DEBUG_LINE_NO:43
        Self.StartTimer(AudioCooldown as Float, iTimerID) ; #DEBUG_LINE_NO:44
        Self.Say(UC05_PlayerLacksCodeMachineKey, None, False, None) ; #DEBUG_LINE_NO:45
      EndIf ; #DEBUG_LINE_NO:
    ElseIf PlayACT.GetItemCount(RequiredKey as Form) >= 1 ; #DEBUG_LINE_NO:48
      If !UC05.GetStageDone(StageToSet) ; #DEBUG_LINE_NO:50
        If !bIssueLineOnce ; #DEBUG_LINE_NO:52
          bIssueLineOnce = True ; #DEBUG_LINE_NO:53
          Self.Say(UC05_IssuingCode, None, False, None) ; #DEBUG_LINE_NO:54
        EndIf ; #DEBUG_LINE_NO:
        Utility.Wait(2.0) ; #DEBUG_LINE_NO:57
        UC05.SetStage(StageToSet) ; #DEBUG_LINE_NO:58
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID ; #DEBUG_LINE_NO:65
    bIncooldown = False ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndEvent
