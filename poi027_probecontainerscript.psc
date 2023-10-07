ScriptName POI027_ProbeContainerScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property POI027_ProbeFireEffectsKeyword Auto Const
Keyword Property POI027_WaterEffectsKeyword Auto Const
Keyword Property POI027_CreaturesKeyword Auto Const
Keyword Property LinkCustom01 Auto Const
Faction Property POI027_AngryCreatureFaction Auto Const
ActorValue Property Aggression Auto Const
ActorValue Property POI027_ProbeEngineActive Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.AddInventoryEventFilter(None) ; #DEBUG_LINE_NO:12
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  ObjectReference[] probeFireEffects = Self.GetRefsLinkedToMe(POI027_ProbeFireEffectsKeyword, None) ; #DEBUG_LINE_NO:17
  Int iProbeFireEffect = 0 ; #DEBUG_LINE_NO:19
  While iProbeFireEffect < probeFireEffects.Length ; #DEBUG_LINE_NO:20
    ObjectReference probeFireEffect = probeFireEffects[iProbeFireEffect] ; #DEBUG_LINE_NO:21
    probeFireEffect.Disable(False) ; #DEBUG_LINE_NO:23
    iProbeFireEffect += 1 ; #DEBUG_LINE_NO:25
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] waterEffects = Self.GetRefsLinkedToMe(POI027_WaterEffectsKeyword, None) ; #DEBUG_LINE_NO:29
  Int iWaterEffect = 0 ; #DEBUG_LINE_NO:31
  While iWaterEffect < waterEffects.Length ; #DEBUG_LINE_NO:32
    ObjectReference waterEffect = waterEffects[iWaterEffect] ; #DEBUG_LINE_NO:33
    waterEffect.Disable(False) ; #DEBUG_LINE_NO:35
    iWaterEffect += 1 ; #DEBUG_LINE_NO:37
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] creatures = Self.GetRefsLinkedToMe(POI027_CreaturesKeyword, None) ; #DEBUG_LINE_NO:41
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:43
  Int iCreature = 0 ; #DEBUG_LINE_NO:45
  While iCreature < creatures.Length ; #DEBUG_LINE_NO:46
    Actor creature = creatures[iCreature] as Actor ; #DEBUG_LINE_NO:47
    creature.SetFactionOwner(POI027_AngryCreatureFaction, False) ; #DEBUG_LINE_NO:49
    creature.SetLinkedRef(player as ObjectReference, LinkCustom01, True) ; #DEBUG_LINE_NO:51
    creature.SetValue(POI027_ProbeEngineActive, 0.0) ; #DEBUG_LINE_NO:53
    creature.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:54
    creature.EvaluatePackage(False) ; #DEBUG_LINE_NO:55
    iCreature += 1 ; #DEBUG_LINE_NO:57
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
