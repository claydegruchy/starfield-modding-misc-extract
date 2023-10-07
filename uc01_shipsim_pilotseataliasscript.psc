ScriptName UC01_ShipSim_PilotSeatAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StartupStage = 150 Auto Const
{ Stage to set when the player sits in the sim seat for the 1st time }

;-- Functions ---------------------------------------

Event OnEnterFurniture(Actor akActionRef)
  uc01_shipsimulationquestscript OQ = Self.GetOwningQuest() as uc01_shipsimulationquestscript ; #DEBUG_LINE_NO:8
  If !OQ.GetStageDone(StartupStage) ; #DEBUG_LINE_NO:9
    OQ.SetStage(StartupStage) ; #DEBUG_LINE_NO:10
  ElseIf OQ.bSequencePaused && !OQ.bResetRequired ; #DEBUG_LINE_NO:11
    OQ.ResumeCombatSequence() ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:20
EndFunction
