ScriptName Fragments:Quests:QF_LC102Combat_0009CBC7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_LC102DoorsToLock Auto Const mandatory
ReferenceAlias Property Alias_LC102DoorToBallroomKitchen Auto Const mandatory
ReferenceAlias Property Alias_LC102DoorToBallroomKitchenTrigger Auto Const mandatory
ReferenceAlias Property Alias_LC102DoorToEngineeringLevel Auto Const mandatory
ReferenceAlias Property Alias_LC102DoorToEngineeringLevelTrigger Auto Const mandatory
ReferenceAlias Property Alias_LifeSupportMachine01Activator Auto Const mandatory
ReferenceAlias Property Alias_LifeSupportMachine02Activator Auto Const mandatory
ReferenceAlias Property Alias_LifeSupportMachine03Activator Auto Const mandatory
ReferenceAlias Property Alias_EngineeringDeckTrigger Auto Const mandatory
RefCollectionAlias Property Alias_LC102DoorsToLockEngineeringDeck Auto Const mandatory
RefCollectionAlias Property Alias_LC102Passengers Auto Const mandatory
ActorValue Property pSpeedMult Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  lc102combatquestscript kmyQuest = __temp as lc102combatquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetTargetQuestStage() ; #DEBUG_LINE_NO:11
  Alias_LC102Passengers.SetValue(pSpeedMult, 100.0) ; #DEBUG_LINE_NO:13
  Alias_LifeSupportMachine01Activator.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:15
  Alias_LifeSupportMachine02Activator.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:16
  Alias_LifeSupportMachine03Activator.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:17
  ObjectReference[] doorRefs = Alias_LC102DoorsToLock.GetArray() ; #DEBUG_LINE_NO:19
  Int I = 0 ; #DEBUG_LINE_NO:21
  While I < doorRefs.Length ; #DEBUG_LINE_NO:22
    doorRefs[I].SetLockLevel(254) ; #DEBUG_LINE_NO:23
    I += 1 ; #DEBUG_LINE_NO:24
  EndWhile ; #DEBUG_LINE_NO:
  If !Alias_EngineeringDeckTrigger.GetRef().IsInTrigger(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:27
    ObjectReference[] engineeringDoorRefs = Alias_LC102DoorsToLockEngineeringDeck.GetArray() ; #DEBUG_LINE_NO:29
    I = 0 ; #DEBUG_LINE_NO:31
    While I < engineeringDoorRefs.Length ; #DEBUG_LINE_NO:32
      engineeringDoorRefs[I].SetLockLevel(254) ; #DEBUG_LINE_NO:33
      I += 1 ; #DEBUG_LINE_NO:34
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.EvaluateDoorForCloseAndLock(Alias_LC102DoorToBallroomKitchen.GetRef(), Alias_LC102DoorToBallroomKitchenTrigger.GetRef()) ; #DEBUG_LINE_NO:38
  Self.EvaluateDoorForCloseAndLock(Alias_LC102DoorToEngineeringLevel.GetRef(), Alias_LC102DoorToEngineeringLevelTrigger.GetRef()) ; #DEBUG_LINE_NO:40
EndFunction

Function EvaluateDoorForCloseAndLock(ObjectReference doorRef, ObjectReference triggerRef)
  If triggerRef != None ; #DEBUG_LINE_NO:58
    If triggerRef.IsInTrigger(Game.GetPlayer() as ObjectReference) == True ; #DEBUG_LINE_NO:59
      Return  ; #DEBUG_LINE_NO:60
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  doorRef.SetOpen(False) ; #DEBUG_LINE_NO:64
  doorRef.SetLockLevel(254) ; #DEBUG_LINE_NO:65
  doorRef.Lock(True, False, True) ; #DEBUG_LINE_NO:66
EndFunction
