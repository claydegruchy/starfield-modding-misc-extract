ScriptName UC09_LeechNestRefScript Extends ObjectReference

;-- Variables ---------------------------------------
Float Timestamp = 0.0

;-- Properties --------------------------------------
GlobalVariable Property UC09_Result Auto Const mandatory
{ Global used to manage the player's gameplay results after the UC questline }
GlobalVariable Property UC09_LeechNestCleanUpChance Auto Const mandatory
{ Percent chance a Heatleech nest will clean itself up when its loaded post-UC questline }
GlobalVariable Property UC09_LeechNestCleanUpCooldownLength Auto Const mandatory
{ If this nest isn't turned off, this global is used to manage how long we wait before checking again }
Bool Property DisableOnLoadAfterQuestline = True Auto Const
{ If you don't want this Heatleech nest disabling automatically on load, set this to "FALSE". 
NOTE: This should only be used for quest-related or scene objects. Ambiently placed ones should be always be marked "TRUE" }

;-- Functions ---------------------------------------

Event OnCellLoad()
  If DisableOnLoadAfterQuestline ; #DEBUG_LINE_NO:19
    If UC09_Result.GetValue() > 0.0 && !Self.IsDisabled() && !Self.IsDestroyed() && Timestamp < Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:20
      Int iRand = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:22
      If iRand <= UC09_LeechNestCleanUpChance.GetValueInt() ; #DEBUG_LINE_NO:25
        Self.Disable(False) ; #DEBUG_LINE_NO:26
        Self.SetDestroyed(True) ; #DEBUG_LINE_NO:27
      Else ; #DEBUG_LINE_NO:
        Timestamp = Utility.GetCurrentGameTime() + UC09_LeechNestCleanUpCooldownLength.GetValue() ; #DEBUG_LINE_NO:31
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
