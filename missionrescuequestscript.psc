ScriptName MissionRescueQuestScript Extends MissionQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group RescueMissionData
  sq_parentscript Property SQ_Parent Auto Const mandatory
  ReferenceAlias Property Prisoner Auto Const mandatory
  { prisoner to rescue }
  Faction Property EnemyShipFaction Auto Const mandatory
  { faction to remove from target ship after rescue }
  Faction Property CaptiveFaction Auto Const mandatory
  { remove this from prisoner after rescue }
  RefCollectionAlias Property Enemies Auto Const mandatory
  { filled with enemies on the target ship (after BE quest starts) }
  ActorValue Property Suspicious Auto Const mandatory
  { clear on hostage so won't have }
  Faction Property ShipOwnerFaction Auto Const
  { optional - if set, ship interior will be set with this ownership }
  Keyword Property SpaceshipLinkedInterior Auto Const mandatory
  { to get ship interior cell }
EndGroup


;-- Functions ---------------------------------------

Function MissionAccepted(Bool bAccepted)
  Parent.MissionAccepted(bAccepted) ; #DEBUG_LINE_NO:30
  If bAccepted ; #DEBUG_LINE_NO:32
    Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_BEStarted") ; #DEBUG_LINE_NO:34
    spaceshipreference targetShip = PrimaryRef.GetShipRef() ; #DEBUG_LINE_NO:37
    targetShip.Enable(False) ; #DEBUG_LINE_NO:38
    targetShip.SetValue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:39
    Actor prisonerRef = Prisoner.GetActorRef() ; #DEBUG_LINE_NO:40
    prisonerRef.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:41
    If ShipOwnerFaction ; #DEBUG_LINE_NO:44
      Cell shipInterior = targetShip.GetLinkedCell(SpaceshipLinkedInterior) ; #DEBUG_LINE_NO:45
      If shipInterior ; #DEBUG_LINE_NO:46
        shipInterior.SetFactionOwner(ShipOwnerFaction) ; #DEBUG_LINE_NO:47
        shipInterior.SetPublic(True) ; #DEBUG_LINE_NO:48
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MissionComplete()
  Self.HandleRescuePrisoner() ; #DEBUG_LINE_NO:56
  Parent.MissionComplete() ; #DEBUG_LINE_NO:57
EndFunction

Function HandleRescuePrisoner()
  Prisoner.TryToRemoveFromFaction(CaptiveFaction) ; #DEBUG_LINE_NO:64
  PrimaryRef.TryToRemoveFromFaction(EnemyShipFaction) ; #DEBUG_LINE_NO:67
  Actor prisonerRef = Prisoner.GetActorRef() ; #DEBUG_LINE_NO:69
  prisonerRef.IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:70
  prisonerRef.SetValue(Suspicious, 0.0) ; #DEBUG_LINE_NO:71
EndFunction

Event SQ_ParentScript.SQ_BEStarted(sq_parentscript akSource, Var[] akArgs)
  spaceshipreference boardedShip = akArgs[0] as spaceshipreference ; #DEBUG_LINE_NO:75
  spaceshipreference targetShip = PrimaryRef.GetShipRef() ; #DEBUG_LINE_NO:76
  If boardedShip == targetShip ; #DEBUG_LINE_NO:78
    bescript boardingQuest = akArgs[1] as bescript ; #DEBUG_LINE_NO:80
    If boardingQuest ; #DEBUG_LINE_NO:82
      Enemies.AddRefCollection(boardingQuest.AllCrew) ; #DEBUG_LINE_NO:83
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
