ScriptName UC09_HeatleechAmbushMarkerScript Extends ObjectReference

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
Keyword Property DMP_AmbushMarker Auto Const mandatory
{ Keyword to connect the Leech to its ambush marker }

;-- Functions ---------------------------------------

Event OnLoad()
  If DisableOnLoadAfterQuestline ; #DEBUG_LINE_NO:22
    If UC09_Result.GetValue() > 0.0 && !Self.IsDisabled() && !Self.IsDestroyed() && Timestamp < Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:23
      Actor[] LinkedActors = Self.GetActorsLinkedToMe(DMP_AmbushMarker, None) ; #DEBUG_LINE_NO:26
      If LinkedActors.Length <= 0 ; #DEBUG_LINE_NO:29
        Int iRand = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:31
        If iRand <= UC09_LeechNestCleanUpChance.GetValueInt() ; #DEBUG_LINE_NO:34
          Self.Disable(False) ; #DEBUG_LINE_NO:36
          Self.SetDestroyed(True) ; #DEBUG_LINE_NO:37
        Else ; #DEBUG_LINE_NO:
          Timestamp = Utility.GetCurrentRealTime() + UC09_LeechNestCleanUpCooldownLength.GetValue() ; #DEBUG_LINE_NO:40
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
