ScriptName TestPlaceAtMeOnLoad Extends ObjectReference
{ using for testing }

;-- Variables ---------------------------------------
Bool created = False

;-- Properties --------------------------------------
Form Property CreatedForm Auto Const mandatory
Keyword Property LinkKeyword Auto Const
Float Property CreateTimer = 5.0 Auto Const
{ how long to wait before creating }

;-- Functions ---------------------------------------

Event OnLoad()
  If created == False ; #DEBUG_LINE_NO:13
    created = True ; #DEBUG_LINE_NO:14
    Self.StartTimer(CreateTimer, 0) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  ObjectReference newRef = Self.PlaceAtMe(CreatedForm, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:20
  ObjectReference linkedRef = Self.GetLinkedRef(LinkKeyword) ; #DEBUG_LINE_NO:21
  If linkedRef ; #DEBUG_LINE_NO:22
    newRef.SetLinkedRef(linkedRef, LinkKeyword, True) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndEvent
