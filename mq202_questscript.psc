ScriptName MQ202_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard PetrovLogicGuard

;-- Properties --------------------------------------
Int Property iStageBleedout Auto Const
ReferenceAlias Property CaptainPetrov Auto Const mandatory
ReferenceAlias Property BountyHunter_Bull Auto Const mandatory
ReferenceAlias Property BountyHunter_ErinSeptember Auto Const mandatory
ReferenceAlias Property BountyHunter_Raptor Auto Const mandatory
ReferenceAlias Property AlarmSoundMarker Auto Const mandatory
Faction Property MQ202PetrovGuardsFriendsFaction Auto Const mandatory
Faction Property MQ202PetrovBoardingFaction Auto Const mandatory
Faction Property MQ202PetrovEnemyFaction Auto Const mandatory
Faction Property MQ202PetrovFaction Auto Const mandatory
Scene Property MQ202_008_Petrov_BleedoutScene Auto Const mandatory

;-- Functions ---------------------------------------

Function CheckPetrov()
  Guard PetrovLogicGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:25
    If !Self.GetStageDone(iStageBleedout) ; #DEBUG_LINE_NO:26
      Actor PetrovREF = CaptainPetrov.GetActorRef() ; #DEBUG_LINE_NO:29
      Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:30
      PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction) ; #DEBUG_LINE_NO:32
      PlayerREF.RemoveFromFaction(MQ202PetrovBoardingFaction) ; #DEBUG_LINE_NO:33
      PlayerREF.AddtoFaction(MQ202PetrovEnemyFaction) ; #DEBUG_LINE_NO:34
      PetrovREF.StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:35
    EndIf ; #DEBUG_LINE_NO:
    If Self.GetStageDone(iStageBleedout) ; #DEBUG_LINE_NO:38
      Actor playerref = Game.GetPlayer() ; #DEBUG_LINE_NO:41
      Actor BullREF = BountyHunter_Bull.GetActorRef() ; #DEBUG_LINE_NO:42
      Actor ErinSeptemberREF = BountyHunter_ErinSeptember.GetActorRef() ; #DEBUG_LINE_NO:43
      Actor RaptorREF = BountyHunter_Raptor.GetActorRef() ; #DEBUG_LINE_NO:44
      Actor petrovref = CaptainPetrov.GetActorRef() ; #DEBUG_LINE_NO:45
      playerref.RemoveFromFaction(MQ202PetrovEnemyFaction) ; #DEBUG_LINE_NO:47
      playerref.AddtoFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:48
      playerref.StopCombatAlarm() ; #DEBUG_LINE_NO:49
      BullREF.StopCombatAlarm() ; #DEBUG_LINE_NO:51
      ErinSeptemberREF.StopCombatAlarm() ; #DEBUG_LINE_NO:52
      RaptorREF.StopCombatAlarm() ; #DEBUG_LINE_NO:53
      petrovref.AllowBleedoutDialogue(True) ; #DEBUG_LINE_NO:55
      petrovref.SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:56
      petrovref.StopCombat() ; #DEBUG_LINE_NO:57
      MQ202_008_Petrov_BleedoutScene.Start() ; #DEBUG_LINE_NO:59
      AlarmSoundMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:61
      Self.SetObjectiveCompleted(56, True) ; #DEBUG_LINE_NO:63
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction
