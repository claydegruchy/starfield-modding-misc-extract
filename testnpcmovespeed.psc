ScriptName TestNPCMoveSpeed Extends ObjectReference

;-- Variables ---------------------------------------
Int I = 0

;-- Properties --------------------------------------
ObjectReference Property SpawnController Auto Const mandatory
Keyword[] Property DestinationLocationKeywords Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If I < DestinationLocationKeywords.Length - 1 ; #DEBUG_LINE_NO:11
    I += 1 ; #DEBUG_LINE_NO:12
  Else ; #DEBUG_LINE_NO:
    I = 0 ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
  (SpawnController as testnpcarenascript).SetPatrolSpeed(DestinationLocationKeywords[I]) ; #DEBUG_LINE_NO:16
EndEvent
