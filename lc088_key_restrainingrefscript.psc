ScriptName LC088_Key_RestrainingRefScript Extends ObjectReference
{ In LC088_Key, script for objects that are restraining actors. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LC088_Key_LinkRestraintKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function ReleaseRestraint()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActivator)
    Self.ReleaseRestraint() ; #DEBUG_LINE_NO:
  EndEvent

  Event OnOpen(ObjectReference akActionRef)
    Self.ReleaseRestraint() ; #DEBUG_LINE_NO:
  EndEvent

  Function ReleaseRestraint()
    Self.GoToState("Done") ; #DEBUG_LINE_NO:
    ObjectReference[] restrainedRefs = Self.GetRefsLinkedToMe(LC088_Key_LinkRestraintKeyword, None) ; #DEBUG_LINE_NO:
    Int I = 0 ; #DEBUG_LINE_NO:
    While I < restrainedRefs.Length ; #DEBUG_LINE_NO:
      Actor currentActor = restrainedRefs[I] as Actor ; #DEBUG_LINE_NO:
      LC088_Key_RestrainingRefScript currentRestrainingRef = restrainedRefs[I] as LC088_Key_RestrainingRefScript ; #DEBUG_LINE_NO:
      If currentActor != None ; #DEBUG_LINE_NO:
        currentActor.SetLinkedRef(None, LC088_Key_LinkRestraintKeyword, True) ; #DEBUG_LINE_NO:
        currentActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:
      ElseIf currentRestrainingRef != None ; #DEBUG_LINE_NO:
        currentRestrainingRef.ReleaseRestraint() ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
  EndFunction

  Event OnTriggerEnter(ObjectReference akTriggerRef)
    Self.ReleaseRestraint() ; #DEBUG_LINE_NO:11
  EndEvent
EndState
