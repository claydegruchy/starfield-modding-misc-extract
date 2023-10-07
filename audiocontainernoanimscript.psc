ScriptName AudioContainerNoAnimScript Extends ObjectReference conditional
{ plays a sound on menu open/close }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property OpenSound Auto Const
wwiseevent Property CloseSound Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForMenuOpenCloseEvent("ContainerMenu") ; #DEBUG_LINE_NO:10
EndEvent

Event OnUnload()
  Self.UnregisterForMenuOpenCloseEvent("ContainerMenu") ; #DEBUG_LINE_NO:16
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "ContainerMenu" ; #DEBUG_LINE_NO:22
    If abOpening == False ; #DEBUG_LINE_NO:23
      CloseSound.PlayAndWait(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:24
    Else ; #DEBUG_LINE_NO:
      OpenSound.PlayAndWait(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:26
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
