ScriptName BEBlockPilotSeatScript Extends ReferenceAlias
{ Script placed on a ship's pilot seat. Blocks players from sitting in the seat and taking over the ship, optionally until all enemy crew are dead. }

;-- Variables ---------------------------------------
Bool activationUnblocked

;-- Properties --------------------------------------
Message Property PilotSeatNotAuthorizedMessage Auto Const mandatory
{ Message to display when the player tries to sit in the ship's pilot seat while the block is in place. }
Bool Property ShouldAllowTakeoverWhenAllCrewDead = False Auto Const
{ Default=False; BEScript Quests ONLY. Should we allow the player to sit in the pilot seat and take over the ship once all enemy crew are dead? }

;-- Functions ---------------------------------------

Event OnAliasInit()
  ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:15
  myRef.BlockActivation(True, False) ; #DEBUG_LINE_NO:16
  If ShouldAllowTakeoverWhenAllCrewDead ; #DEBUG_LINE_NO:17
    bescript owningBEQuest = Self.GetOwningQuest() as bescript ; #DEBUG_LINE_NO:18
    If owningBEQuest != None ; #DEBUG_LINE_NO:19
      Self.RegisterForCustomEvent((Self.GetOwningQuest() as bescript) as ScriptObject, "bescript_BEAllCrewDead") ; #DEBUG_LINE_NO:20
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActivator)
  If activationUnblocked == False && (akActivator == Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:26
    If Self.GetRef() is pilotseatfurniturescript == False ; #DEBUG_LINE_NO:28
      PilotSeatNotAuthorizedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:29
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event BEScript.BEAllCrewDead(bescript source, Var[] akArgs)
  ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:35
  myRef.BlockActivation(False, False) ; #DEBUG_LINE_NO:36
  activationUnblocked = True ; #DEBUG_LINE_NO:37
EndEvent
