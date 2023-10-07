ScriptName DoorBarricade Extends ObjectReference
{ When this locked door barricade is unlocked it is disabled, plays a sound, and unlocks and makes usable a linked door. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkToBarricadedDoor Auto Const mandatory
Int Property LockLevel = 251 Auto Const
wwiseevent Property WwiseEvent_DRS_Barricade_Unlock Auto Const

;-- Functions ---------------------------------------

Function SetupBarricade()
  Self.EnableNoWait(False) ; #DEBUG_LINE_NO:15
  If Self.GetLinkedRef(LinkToBarricadedDoor) ; #DEBUG_LINE_NO:16
    If Self.GetLockLevel() != 0 ; #DEBUG_LINE_NO:17
      Self.GetLinkedRef(LinkToBarricadedDoor).BlockActivation(True, True) ; #DEBUG_LINE_NO:18
      Self.GetLinkedRef(LinkToBarricadedDoor).SetLockLevel(LockLevel) ; #DEBUG_LINE_NO:19
      Self.GetLinkedRef(LinkToBarricadedDoor).Lock(True, False, True) ; #DEBUG_LINE_NO:20
    Else ; #DEBUG_LINE_NO:
      Self.DisableNoWait(False) ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.GoToState("Done") ; #DEBUG_LINE_NO:28
EndFunction

Event OnLockStateChanged()
  If !Self.IsLocked() ; #DEBUG_LINE_NO:32
    If Self.GetLinkedRef(LinkToBarricadedDoor) ; #DEBUG_LINE_NO:35
      WwiseEvent_DRS_Barricade_Unlock.Play(Self.GetLinkedRef(LinkToBarricadedDoor), None, None) ; #DEBUG_LINE_NO:37
      Self.GetLinkedRef(LinkToBarricadedDoor).Lock(False, False, True) ; #DEBUG_LINE_NO:39
      Self.GetLinkedRef(LinkToBarricadedDoor).BlockActivation(False, False) ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
    Self.DisableNoWait(False) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnReset()
  Self.GoToState("Initial") ; #DEBUG_LINE_NO:51
  If Self.GetLinkedRef(None) == None ; #DEBUG_LINE_NO:52
    Self.SetupBarricade() ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
EndEvent

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnCellLoad()
    Self.SetupBarricade() ; #DEBUG_LINE_NO:10
  EndEvent
EndState
