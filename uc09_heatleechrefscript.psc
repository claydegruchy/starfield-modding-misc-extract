ScriptName UC09_HeatleechRefScript Extends Actor

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
Keyword Property LinkAmbushTrigger Auto Const mandatory
{ Keyword to connect the Leech to its ambush trigger }

;-- Functions ---------------------------------------

Event OnCellLoad()
  If DisableOnLoadAfterQuestline ; #DEBUG_LINE_NO:25
    If UC09_Result.GetValue() > 0.0 && !Self.IsDisabled() && !Self.IsDestroyed() && Timestamp < Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:28
      Int iRand = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:30
      If iRand <= UC09_LeechNestCleanUpChance.GetValueInt() ; #DEBUG_LINE_NO:34
        Self.Disable(False) ; #DEBUG_LINE_NO:36
        Self.SetDestroyed(True) ; #DEBUG_LINE_NO:37
        ObjectReference AmbushTriggerRef = Self.GetLinkedRef(LinkAmbushTrigger) ; #DEBUG_LINE_NO:42
        If AmbushTriggerRef != None ; #DEBUG_LINE_NO:43
          AmbushTriggerRef.Disable(False) ; #DEBUG_LINE_NO:44
          AmbushTriggerRef.SetDestroyed(True) ; #DEBUG_LINE_NO:45
        EndIf ; #DEBUG_LINE_NO:
        ObjectReference AmbushMarkerRef = Self.GetLinkedRef(DMP_AmbushMarker) ; #DEBUG_LINE_NO:49
        If AmbushMarkerRef != None ; #DEBUG_LINE_NO:50
          AmbushMarkerRef.Disable(False) ; #DEBUG_LINE_NO:51
          AmbushMarkerRef.SetDestroyed(True) ; #DEBUG_LINE_NO:52
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Timestamp = Utility.GetCurrentGameTime() + UC09_LeechNestCleanUpCooldownLength.GetValue() ; #DEBUG_LINE_NO:58
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:68
EndFunction
