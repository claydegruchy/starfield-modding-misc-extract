ScriptName TestGym_FXSeq_Control Extends ObjectReference
{ Runs an FX Seq on activate }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property P_TestGym_FXSeq_ScriptControl Auto Const mandatory
String Property SeqName = "TestImodSeq" Auto

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  P_TestGym_FXSeq_ScriptControl.StartSequence(SeqName, True, 1.0) ; #DEBUG_LINE_NO:13
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:14
  P_TestGym_FXSeq_ScriptControl.StopSequence(SeqName) ; #DEBUG_LINE_NO:15
EndEvent
