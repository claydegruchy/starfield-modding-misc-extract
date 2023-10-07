ScriptName TestKurtFormationsSwitchScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Variable01 Auto Const mandatory
Message Property TestKurtFormationMessageBox Auto Const
Keyword Property TestKurtButtonKeyword Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Int messageIndex = TestKurtFormationMessageBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:10
  Self.UpdateLinkedRefs(messageIndex) ; #DEBUG_LINE_NO:11
EndEvent

Function UpdateLinkedRefs(Int messageIndex)
  ObjectReference[] myLinkedRefs = Self.GetRefsLinkedToMe(TestKurtButtonKeyword, None) ; #DEBUG_LINE_NO:15
  Int I = 0 ; #DEBUG_LINE_NO:16
  While I < myLinkedRefs.Length ; #DEBUG_LINE_NO:17
    Actor myLinkedActor = myLinkedRefs[I] as Actor ; #DEBUG_LINE_NO:18
    If myLinkedActor ; #DEBUG_LINE_NO:19
      myLinkedActor.SetValue(Variable01, messageIndex as Float) ; #DEBUG_LINE_NO:20
      myLinkedActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:21
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:23
  EndWhile ; #DEBUG_LINE_NO:
  TestKurtFormationsSwitchScript myLinkedButton = Self.GetLinkedRef(None) as TestKurtFormationsSwitchScript ; #DEBUG_LINE_NO:26
  If myLinkedButton ; #DEBUG_LINE_NO:27
    myLinkedButton.UpdateLinkedRefs(messageIndex) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndFunction
