ScriptName MS03JunoQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  ReferenceAlias Property JunoMoveToMarker Auto Const mandatory
  ReferenceAlias Property JunoShip Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property RyujinShip Auto Const mandatory
  RefCollectionAlias Property EclipticShips Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.MoveJuno() ; #DEBUG_LINE_NO:14
  Self.StartCombat() ; #DEBUG_LINE_NO:15
EndEvent

Function MoveJuno()
  JunoShip.GetReference().MoveTo(JunoMoveToMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:21
  RyujinShip.GetReference().Enable(False) ; #DEBUG_LINE_NO:22
EndFunction

Function StartCombat()
  spaceshipreference[] enemyShips = EclipticShips.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:28
  Int I = 0 ; #DEBUG_LINE_NO:29
  While I < enemyShips.Length ; #DEBUG_LINE_NO:30
    spaceshipreference currentShipRef = enemyShips[I] ; #DEBUG_LINE_NO:31
    currentShipRef.StartCombat(Game.GetPlayerHomeSpaceShip(), False) ; #DEBUG_LINE_NO:33
    I += 1 ; #DEBUG_LINE_NO:34
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:43
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:47
EndFunction
