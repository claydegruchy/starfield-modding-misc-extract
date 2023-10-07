ScriptName BEAliasScript Extends ReferenceAlias
{ Standard script for aliases on Boarding Encounter quests. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Actor_Properties
  Bool Property ShouldStartDead = False Auto Const
  { DEFAULT=False. If True, if this is an actor, they will be killed after initializing. }
  Int Property KillIfSpaceshipCrewCountAtOrBelow = -1 Auto Const
  { OPTIONAL. Default=-1. If the SpaceshipCrew count starts at or below this value, kill this actor when they spawn. }
  Bool Property ShouldIncludeInCrew = True Auto Const
  { DEFAULT=True. If True, BEScript will add this actor to the AllCrew RefCollectionAlias and count them toward the ship's SpaceshipCrew. }
  Bool Property ShouldIncludeAtFrontOfBoardingParty = False Auto Const
  { DEFAULT=False.
	If True, if ShouldBoardPlayersShip, this actor will be included early in the boarding waves if possible. They may or may not be in the first wave due to timing issues. 
	If both BoardingParty bools are false, this actor will not board the player's ship. }
  Bool Property ShouldIncludeAtBackOfBoardingParty = False Auto Const
  { DEFAULT=False. If True, if ShouldBoardPlayersShip, this actor will be included late in the boarding waves if possible.
	If ShouldIncludeAtFrontOfBoardingParty, this value is ignored. If both BoardingParty bools are false, this actor will not board the player's ship. }
EndGroup

Group AutofillProperties collapsedonbase
  reparentscript Property RE_Parent Auto Const mandatory
  ReferenceAlias Property EnemyShip Auto Const mandatory
  ActorValue Property SpaceshipCrew Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  bescript parentQuest = Self.GetOwningQuest() as bescript ; #DEBUG_LINE_NO:32
  Actor selfActor = Self.GetActorRef() ; #DEBUG_LINE_NO:33
  If parentQuest != None && selfActor != None ; #DEBUG_LINE_NO:34
    If ShouldStartDead || KillIfSpaceshipCrewCountAtOrBelow >= 0 && (KillIfSpaceshipCrewCountAtOrBelow as Float >= EnemyShip.GetRef().GetValue(SpaceshipCrew)) ; #DEBUG_LINE_NO:35
      parentQuest.RegisterBEAliasActor(selfActor, True, ShouldIncludeInCrew, ShouldIncludeAtFrontOfBoardingParty, ShouldIncludeAtBackOfBoardingParty) ; #DEBUG_LINE_NO:36
    Else ; #DEBUG_LINE_NO:
      parentQuest.RegisterBEAliasActor(selfActor, False, ShouldIncludeInCrew, ShouldIncludeAtFrontOfBoardingParty, ShouldIncludeAtBackOfBoardingParty) ; #DEBUG_LINE_NO:38
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
