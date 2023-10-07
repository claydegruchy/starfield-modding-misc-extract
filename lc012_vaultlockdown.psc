ScriptName LC012_VaultLockdown Extends ObjectReference Const
{ Lock Down the Vault in LC012 when activated. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const
{ Reference to the vault door }
Keyword Property LinkCustom02 Auto Const
{ Reference to Guards who should have UseCombatTravel AV set to 1. }
Keyword Property LinkCustom03 Auto Const
{ Link to collision volume to enable }
ActorValue Property UseCombatTravel Auto Const
{ AV that the linked guards will check in their custom package }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference LockDownDoor = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:15
  ObjectReference VaultDoor = Self.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:16
  Self.GetLinkedRef(LinkCustom03).Enable(False) ; #DEBUG_LINE_NO:19
  LockDownDoor.SetLockLevel(254) ; #DEBUG_LINE_NO:22
  LockDownDoor.SetOpen(False) ; #DEBUG_LINE_NO:23
  VaultDoor.SetLockLevel(254) ; #DEBUG_LINE_NO:24
  VaultDoor.SetOpen(False) ; #DEBUG_LINE_NO:25
  ObjectReference[] Guards = Self.GetLinkedRefChain(LinkCustom02, 100) ; #DEBUG_LINE_NO:28
  Int I = 0 ; #DEBUG_LINE_NO:29
  While I < Guards.Length ; #DEBUG_LINE_NO:30
    Guards[I].SetValue(UseCombatTravel, 1.0) ; #DEBUG_LINE_NO:31
    (Guards[I] as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:32
    I += 1 ; #DEBUG_LINE_NO:33
  EndWhile ; #DEBUG_LINE_NO:
  Int j = 0 ; #DEBUG_LINE_NO:37
  While j <= 9 ; #DEBUG_LINE_NO:38
    If LockDownDoor.GetOpenState() == 3 ; #DEBUG_LINE_NO:40
      LockDownDoor.Lock(True, False, True) ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
    If VaultDoor.GetOpenState() == 3 ; #DEBUG_LINE_NO:43
      VaultDoor.Lock(True, False, True) ; #DEBUG_LINE_NO:44
    EndIf ; #DEBUG_LINE_NO:
    Utility.Wait(0.300000012) ; #DEBUG_LINE_NO:46
    j += 1 ; #DEBUG_LINE_NO:47
  EndWhile ; #DEBUG_LINE_NO:
  VaultDoor.Lock(True, False, True) ; #DEBUG_LINE_NO:50
  LockDownDoor.Lock(True, False, True) ; #DEBUG_LINE_NO:51
EndEvent
