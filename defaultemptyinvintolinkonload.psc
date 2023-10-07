ScriptName DefaultEmptyInvIntoLinkOnLoad Extends ObjectReference default
{ Removes items from self and puts them into Linked Ref OnLoad() }

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State WaitForLoad

  Event OnLoad()
    Self.GoToState("Done") ; #DEBUG_LINE_NO:6
    Self.RemoveAllItems(Self.GetLinkedRef(None), False, False) ; #DEBUG_LINE_NO:7
  EndEvent
EndState
