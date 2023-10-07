ScriptName RQ_TransportPersonScript Extends RQScript
{ for RQs with passengers }

;-- Variables ---------------------------------------
Int damageSound
Int onBoardCount = 0

;-- Properties --------------------------------------
Group TransportPerson
  ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
  ReferenceAlias Property Alias_QuestGiverShip Auto Const
  { optional - if this includes a questgiver ship }
  Bool Property DamageShips = True Auto Const
  { if true, put any landed ships in damaged state }
  ActorValue Property ShipSystemEngineHealth Auto Const mandatory
  { engine system health - use to put ships in damaged state }
  LocationAlias Property Alias_PassengerDestination Auto Const mandatory
  { autofill }
  ReferenceAlias Property Alias_PassengerDestinationMarker Auto Const mandatory
  { autofill }
  Int Property InitializeNPCsStage = -1 Auto Const
  { stage to set when NPCs are initialized }
  Int Property AgreeToTransportStage = 100 Auto Const
  { this stage being set means player has agreed to transport passengers }
  Int Property AgreeToTransportObjective = 100 Auto Const
  { objective related to transporting passengers }
  Int Property TransportDoneStage = 390 Auto Const
  { if this stage is set, means passengers have been delivered to destination }
  Keyword Property LocTypeStarSystem Auto Const mandatory
  { autofill }
  wwiseevent Property DamagedEngineSound Auto Const
EndGroup


;-- Functions ---------------------------------------

Function QuestStartedSpecific()
  Self.RegisterForRemoteEvent(Alias_PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:46
  If Alias_QuestGiverShip ; #DEBUG_LINE_NO:47
    Self.RegisterForRemoteEvent(Alias_QuestGiverShip as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:48
    Self.RegisterForRemoteEvent(Alias_QuestGiverShip as ScriptObject, "OnLoad") ; #DEBUG_LINE_NO:49
    Self.RegisterForRemoteEvent(Alias_QuestGiverShip as ScriptObject, "OnUnload") ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function AgreeToTransportPassenger()
  oescript myOEScript = (Self as Quest) as oescript ; #DEBUG_LINE_NO:56
  If myOEScript ; #DEBUG_LINE_NO:57
    myOEScript.StopQuestWhenPlayerLeavesPlanet = False ; #DEBUG_LINE_NO:58
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:62
  While I < DialogueAliases.Length ; #DEBUG_LINE_NO:63
    RefCollectionAlias refCollection = DialogueAliases[I] as RefCollectionAlias ; #DEBUG_LINE_NO:64
    If refCollection ; #DEBUG_LINE_NO:65
      Self.RegisterForRemoteEvent(refCollection as ScriptObject, "OnEnterShipInterior") ; #DEBUG_LINE_NO:66
      Self.RegisterForRemoteEvent(refCollection as ScriptObject, "OnExitShipInterior") ; #DEBUG_LINE_NO:67
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForRemoteEvent((DialogueAliases[I] as ReferenceAlias) as ScriptObject, "OnEnterShipInterior") ; #DEBUG_LINE_NO:69
      Self.RegisterForRemoteEvent((DialogueAliases[I] as ReferenceAlias) as ScriptObject, "OnExitShipInterior") ; #DEBUG_LINE_NO:70
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:72
  EndWhile ; #DEBUG_LINE_NO:
  Self.SetDialogueAV_Hello_Calm_PostAccept() ; #DEBUG_LINE_NO:75
EndFunction

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == AgreeToTransportStage ; #DEBUG_LINE_NO:79
    Self.AgreeToTransportPassenger() ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function InitializeNPCs()
  Parent.InitializeNPCs() ; #DEBUG_LINE_NO:86
  If InitializeNPCsStage > -1 ; #DEBUG_LINE_NO:87
    Self.SetStage(InitializeNPCsStage) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
  Self.DamageShip(Alias_QuestGiverShip) ; #DEBUG_LINE_NO:91
EndFunction

Event ReferenceAlias.OnEnterShipInterior(ReferenceAlias akSender, ObjectReference akShip)
  Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnEnterShipInterior") ; #DEBUG_LINE_NO:96
  akSender.GetRef().SetValue(RQ_AV_Hello, RQ_Hello_AboardShipValue.GetValueInt() as Float) ; #DEBUG_LINE_NO:98
EndEvent

Event RefCollectionAlias.OnEnterShipInterior(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akShip)
  onBoardCount += 1 ; #DEBUG_LINE_NO:103
  akSenderRef.SetValue(RQ_AV_Hello, RQ_Hello_AboardShipValue.GetValueInt() as Float) ; #DEBUG_LINE_NO:104
  If onBoardCount >= akSender.GetCount() ; #DEBUG_LINE_NO:105
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnEnterShipInterior") ; #DEBUG_LINE_NO:107
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnExitShipInterior(ReferenceAlias akSender, ObjectReference akShip)
  Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnExitShipInterior") ; #DEBUG_LINE_NO:113
  akSender.GetRef().SetValue(RQ_AV_Hello, RQ_Hello_Calm_SuccessValue.GetValueInt() as Float) ; #DEBUG_LINE_NO:115
EndEvent

Event RefCollectionAlias.OnExitShipInterior(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akShip)
  onBoardCount -= 1 ; #DEBUG_LINE_NO:120
  akSenderRef.SetValue(RQ_AV_Hello, RQ_Hello_Calm_SuccessValue.GetValueInt() as Float) ; #DEBUG_LINE_NO:121
  If onBoardCount <= 0 ; #DEBUG_LINE_NO:122
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnExitShipInterior") ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Alias_PlayerShip ; #DEBUG_LINE_NO:130
    If Self.GetStageDone(AgreeToTransportStage) && Self.GetStageDone(TransportDoneStage) == False ; #DEBUG_LINE_NO:131
      Self.UpdatePassengerDestinationAliases(akNewLoc) ; #DEBUG_LINE_NO:133
    EndIf ; #DEBUG_LINE_NO:
    Self.CheckForShutdown(akNewLoc) ; #DEBUG_LINE_NO:136
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnLoad(ReferenceAlias akSender)
  If akSender == Alias_QuestGiverShip ; #DEBUG_LINE_NO:141
    Self.DamageShip(Alias_QuestGiverShip) ; #DEBUG_LINE_NO:142
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnUnload(ReferenceAlias akSender)
  If akSender == Alias_QuestGiverShip ; #DEBUG_LINE_NO:147
    If DamagedEngineSound as Bool && damageSound > 0 ; #DEBUG_LINE_NO:148
      wwiseevent.StopInstance(damageSound) ; #DEBUG_LINE_NO:149
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function OnAliasChangedSpecific(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  If akSender == Alias_QuestGiverShip ; #DEBUG_LINE_NO:156
    Self.DamageShip(Alias_QuestGiverShip) ; #DEBUG_LINE_NO:157
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DamageShip(ReferenceAlias akShipToDamage)
  If DamageShips && akShipToDamage as Bool ; #DEBUG_LINE_NO:162
    spaceshipreference shipRef = akShipToDamage.GetShipRef() ; #DEBUG_LINE_NO:163
    If shipRef ; #DEBUG_LINE_NO:165
      If shipRef.Is3DLoaded() ; #DEBUG_LINE_NO:166
        Float currentEngineHealth = shipRef.GetValue(ShipSystemEngineHealth) ; #DEBUG_LINE_NO:167
        If currentEngineHealth <= 0.0 ; #DEBUG_LINE_NO:168
          shipRef.RestoreValue(ShipSystemEngineHealth, 99.0) ; #DEBUG_LINE_NO:169
          currentEngineHealth = shipRef.GetValue(ShipSystemEngineHealth) ; #DEBUG_LINE_NO:170
        EndIf ; #DEBUG_LINE_NO:
        shipRef.DamageValue(ShipSystemEngineHealth, currentEngineHealth) ; #DEBUG_LINE_NO:172
        If DamagedEngineSound ; #DEBUG_LINE_NO:173
          damageSound = DamagedEngineSound.Play(shipRef as ObjectReference, None, None) ; #DEBUG_LINE_NO:174
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UpdatePassengerDestinationAliases(Location newLocation)
  Location currentDestination = Alias_PassengerDestination.GetLocation() ; #DEBUG_LINE_NO:182
  If currentDestination.IsSameLocation(newLocation, LocTypeStarSystem) == False ; #DEBUG_LINE_NO:185
    Alias_PassengerDestination.RefillAlias() ; #DEBUG_LINE_NO:186
    Alias_PassengerDestination.RefillDependentAliases() ; #DEBUG_LINE_NO:187
  EndIf ; #DEBUG_LINE_NO:
EndFunction
