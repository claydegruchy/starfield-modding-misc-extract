ScriptName MS01Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS01_GroupsRescued Auto Const mandatory
ReferenceAlias Property ScientistDoorPackin Auto Const mandatory
Keyword Property Link_AirlockDoor01 Auto Const mandatory
Keyword Property Link_AirlockDoor02 Auto Const mandatory

;-- Functions ---------------------------------------

Int Function SpacerGroupKilled()
  Int nSpacersKilled = 0 ; #DEBUG_LINE_NO:11
  If Self.GetStageDone(410) ; #DEBUG_LINE_NO:14
    nSpacersKilled += 1 ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(420) ; #DEBUG_LINE_NO:17
    nSpacersKilled += 1 ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(430) ; #DEBUG_LINE_NO:20
    nSpacersKilled += 1 ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(440) ; #DEBUG_LINE_NO:23
    nSpacersKilled += 1 ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
  MS01_GroupsRescued.SetValue(nSpacersKilled as Float) ; #DEBUG_LINE_NO:28
  Self.UpdateCurrentInstanceGlobal(MS01_GroupsRescued) ; #DEBUG_LINE_NO:29
  Self.SetObjectiveDisplayed(300, True, True) ; #DEBUG_LINE_NO:30
  If nSpacersKilled >= 4 ; #DEBUG_LINE_NO:33
    Self.SetStage(400) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function LockDoors(Bool bLock)
  ObjectReference myDoor01 = ScientistDoorPackin.GetRef().GetLinkedRef(Link_AirlockDoor01) ; #DEBUG_LINE_NO:41
  ObjectReference myDoor02 = ScientistDoorPackin.GetRef().GetLinkedRef(Link_AirlockDoor02) ; #DEBUG_LINE_NO:42
  myDoor01.Lock(bLock, False, True) ; #DEBUG_LINE_NO:43
  myDoor02.Lock(bLock, False, True) ; #DEBUG_LINE_NO:44
  If bLock == True ; #DEBUG_LINE_NO:45
    myDoor01.SetLockLevel(100) ; #DEBUG_LINE_NO:46
    myDoor02.SetLockLevel(100) ; #DEBUG_LINE_NO:47
  Else ; #DEBUG_LINE_NO:
    myDoor01.SetLockLevel(0) ; #DEBUG_LINE_NO:49
    myDoor02.SetLockLevel(0) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction
