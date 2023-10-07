ScriptName MotionDetectorScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
{ Link from pivot to Trigger }
Keyword Property LinkCustom02 Auto Const mandatory
{ Link from pivot to Motion Detector }
Keyword Property LinkCustom03 Auto Const mandatory
Bool Property UnlockOnOpen = False Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkCustom01) as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:20
EndEvent

Event OnUnload()
  Self.UnregisterForAllRemoteEvents() ; #DEBUG_LINE_NO:24
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  ObjectReference LinkedDoor = Self.GetLinkedRef(LinkCustom03) ; #DEBUG_LINE_NO:29
  If LinkedDoor ; #DEBUG_LINE_NO:30
    If UnlockOnOpen || LinkedDoor.isLocked() == False ; #DEBUG_LINE_NO:31
      LinkedDoor.SetOpen(True) ; #DEBUG_LINE_NO:32
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
