ScriptName TestIDCardReader Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
conditionform Property ConditionFormToTest Auto Const
{ If set, this condition form must be true for script to excecute it's functionality }
Bool Property AutoOpen Auto Const mandatory
{ If true, linked reference will recieve SetOpen }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If ConditionFormToTest.IsTrue(akActionRef, None) ; #DEBUG_LINE_NO:15
    ObjectReference[] LinkedRefs = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:17
    Int I = 0 ; #DEBUG_LINE_NO:18
    While I < LinkedRefs.Length ; #DEBUG_LINE_NO:19
      LinkedRefs[I].Lock(False, False, True) ; #DEBUG_LINE_NO:20
      If AutoOpen ; #DEBUG_LINE_NO:21
        LinkedRefs[I].SetOpen(True) ; #DEBUG_LINE_NO:22
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:24
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
