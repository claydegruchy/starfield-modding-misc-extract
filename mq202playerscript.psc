ScriptName MQ202PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property MQ202PetrovFaction Auto Const mandatory
Faction Property MQ202PetrovGuardsFaction Auto Const mandatory
Faction Property MQ202PetrovTerminalsFaction Auto Const mandatory
Faction Property MQ202PetrovBoardingFaction Auto Const mandatory
Faction Property MQ202PetrovGuardsFriendsFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Int Property PlayerKillPrereqStage = 410 Auto Const
Int Property PlayerKillSetStage = 420 Auto Const
ReferenceAlias Property ArmoryTerminal Auto Const mandatory
ReferenceAlias Property ZooTerminal Auto Const mandatory
ReferenceAlias Property ZooAreaGuard01 Auto Const mandatory
ReferenceAlias Property ZooAreaGuard02 Auto Const mandatory
ReferenceAlias Property ZooAreaGuard03 Auto Const mandatory
ReferenceAlias Property CaptainPetrov Auto Const mandatory

;-- Functions ---------------------------------------

Event OnKill(ObjectReference akVictim)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:21
  If (akVictim as Actor).IsInFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:24
    If MyQuest.GetStageDone(PlayerKillPrereqStage) ; #DEBUG_LINE_NO:25
      MyQuest.SetStage(PlayerKillSetStage) ; #DEBUG_LINE_NO:26
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnPickLock(ObjectReference akLockedRef, Bool abCrime, Bool abSucceeded, terminalmenu akLockedTerminalMenu, Int aiTerminalMenuItem)
  If (akLockedRef == ZooTerminal.GetRef() || akLockedRef == ArmoryTerminal.GetRef()) && abCrime == True ; #DEBUG_LINE_NO:33
    Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:35
    If ZooAreaGuard01.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference) || ZooAreaGuard02.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference) || ZooAreaGuard03.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference) || CaptainPetrov.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference) ; #DEBUG_LINE_NO:36
      PlayerRef.RemoveFromFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:38
      PlayerRef.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction) ; #DEBUG_LINE_NO:39
      PlayerRef.RemoveFromFaction(MQ202PetrovBoardingFaction) ; #DEBUG_LINE_NO:40
      MQ202PetrovTerminalsFaction.SetEnemy(PlayerFaction, False, False) ; #DEBUG_LINE_NO:41
      MQ202PetrovGuardsFaction.SetEnemy(PlayerFaction, False, False) ; #DEBUG_LINE_NO:42
      MQ202PetrovFaction.SetEnemy(PlayerFaction, False, False) ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
