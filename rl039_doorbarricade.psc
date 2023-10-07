ScriptName RL039_DoorBarricade Extends ObjectReference Const
{ When this locked door barricade is unlocked it is disabled, plays a sound, and unlocks and makes usable a linked door. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkToBarricadedDoor Auto Const mandatory
Message Property DoorActivationOverrideName Auto Const mandatory
Message Property DoorActivationInfoMessage Auto Const mandatory
Int Property LockLevel = 254 Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  ObjectReference linkedDoor = Self.GetLinkedRef(LinkToBarricadedDoor) ; #DEBUG_LINE_NO:11
  If linkedDoor ; #DEBUG_LINE_NO:13
    linkedDoor.SetLockLevel(LockLevel) ; #DEBUG_LINE_NO:14
    linkedDoor.Lock(True, False, True) ; #DEBUG_LINE_NO:15
    linkedDoor.SetActivateTextOverride(DoorActivationOverrideName) ; #DEBUG_LINE_NO:16
    Self.RegisterForRemoteEvent(linkedDoor as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  DoorActivationInfoMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:23
EndEvent

Event OnActivate(ObjectReference akActionRef)
  ObjectReference linkedDoor = Self.GetLinkedRef(LinkToBarricadedDoor) ; #DEBUG_LINE_NO:28
  If linkedDoor ; #DEBUG_LINE_NO:30
    linkedDoor.Lock(False, False, True) ; #DEBUG_LINE_NO:31
    linkedDoor.SetActivateTextOverride(None) ; #DEBUG_LINE_NO:32
    Self.UnregisterForRemoteEvent(linkedDoor as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
  Self.DisableNoWait(False) ; #DEBUG_LINE_NO:38
EndEvent
