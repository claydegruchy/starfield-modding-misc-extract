ScriptName LC088_KeyReactorScript Extends ReactorFloorMidA01Script
{ Script for the Reactors in LC088_Key. }

;-- Variables ---------------------------------------
Int reactorID

;-- Properties --------------------------------------
Group AutofillProperties
  lc088_keyquestscript Property LC088_Key Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function RegisterForReactorEvent(Int newReactorID)
  reactorID = newReactorID ; #DEBUG_LINE_NO:12
  Self.RegisterForCustomEvent(LC088_Key as ScriptObject, "lc088_keyquestscript_LC088ReactorStateChangeEvent") ; #DEBUG_LINE_NO:13
EndFunction

Event LC088_KeyQuestScript.LC088ReactorStateChangeEvent(lc088_keyquestscript akSender, Var[] akArgs)
  Int eventReactorID = akArgs[0] as Int ; #DEBUG_LINE_NO:17
  If eventReactorID == reactorID ; #DEBUG_LINE_NO:18
    Self.SetReactorState(akArgs[1] as Int, True) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent
