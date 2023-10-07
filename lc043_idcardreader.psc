ScriptName LC043_IDCardReader Extends IDCardReader
{ Variant ID Card Reader for LC043, with support for variations needed by the quest. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group LC043IDCardReaderProperties
  Bool Property ShouldAlwaysDeny = False Auto Const
  { If True, this ID Card Reader will always display IDCardReaderFailMissingPrereqMessage, and will never open its door. }
  Bool Property ShouldOnlyOpen = False Auto Const
  { If True, this ID Card Reader will only open its door, not close it. }
  Bool Property ShouldForceOpenDockingPortDoor = False Auto Const
  { If True, if our door is a Docking Port door, open it. }
EndGroup


;-- Functions ---------------------------------------

Function IDReaderOpenDoor(Bool shouldBeOpen)
  If ShouldAlwaysDeny ; #DEBUG_LINE_NO:16
    IDCardReaderFailMissingPrereqMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:17
  ElseIf ShouldOnlyOpen ; #DEBUG_LINE_NO:
    If shouldBeOpen ; #DEBUG_LINE_NO:19
      ObjectReference doorLink = Self.GetLinkedRef(LinkIDReader) ; #DEBUG_LINE_NO:20
      Int openState = doorLink.GetOpenState() ; #DEBUG_LINE_NO:21
      If openState == 3 || openState == 4 ; #DEBUG_LINE_NO:22
        doorLink.SetOpen(True) ; #DEBUG_LINE_NO:23
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  ElseIf ShouldForceOpenDockingPortDoor ; #DEBUG_LINE_NO:
    defaultmultistateactivator doorlink = Self.GetLinkedRef(LinkIDReader) as defaultmultistateactivator ; #DEBUG_LINE_NO:27
    If doorlink != None ; #DEBUG_LINE_NO:28
      doorlink.SetOpen(True) ; #DEBUG_LINE_NO:29
      doorlink.SetAnimationState("Green", False) ; #DEBUG_LINE_NO:30
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Parent.IDReaderOpenDoor(shouldBeOpen) ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
EndFunction
