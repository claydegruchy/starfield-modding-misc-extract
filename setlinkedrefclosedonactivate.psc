ScriptName SetLinkedRefClosedOnActivate Extends ObjectReference Const
{ Used on doors to keep a paired door shut }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkedRefKeyword Auto Const
{ OPTIONAL: Keyword to check for on the Linked Ref }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference LinkedRef = Self.GetLinkedRef(LinkedRefKeyword) ; #DEBUG_LINE_NO:8
  Int currOpenState = LinkedRef.GetOpenState() ; #DEBUG_LINE_NO:9
  If currOpenState == 1 || currOpenState == 2 ; #DEBUG_LINE_NO:11
    LinkedRef.SetOpen(False) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent
