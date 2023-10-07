ScriptName MQ104AScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TemplePuzzleTrigger Auto Const mandatory
Int Property StageToSet = 500 Auto Const

;-- Functions ---------------------------------------

Function TempleArrived()
  Self.RegisterForCustomEvent((TemplePuzzleTrigger.GetRef() as sbringpuzzlenewscript) as ScriptObject, "sbringpuzzlenewscript_PuzzleSolvedEvent") ; #DEBUG_LINE_NO:7
EndFunction

Event SBRingPuzzleNEWScript.PuzzleSolvedEvent(sbringpuzzlenewscript akSender, Var[] akArgs)
  Self.SetStage(StageToSet) ; #DEBUG_LINE_NO:11
  Self.UnRegisterForCustomEvent((TemplePuzzleTrigger.GetRef() as sbringpuzzlenewscript) as ScriptObject, "sbringpuzzlenewscript_PuzzleSolvedEvent") ; #DEBUG_LINE_NO:12
EndEvent
