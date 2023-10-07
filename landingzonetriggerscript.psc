ScriptName LandingZoneTriggerScript Extends ObjectReference
{ get creatures to flee when a ship lands }

;-- Variables ---------------------------------------
Bool alerted = False
spaceshipreference landedSpaceship
ObjectReference landingMarker

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard AlertGuard

;-- Properties --------------------------------------
Keyword Property SQ_LinkLandingZoneTrigger Auto Const mandatory
{ keyword to link creatures to the landing zone trigger }
ActorValue Property LandingZoneHot Auto Const mandatory
{ AV to set on creatures when the ship is landing/taking off }
Keyword Property LandingZoneTriggerKeyword Auto Const mandatory
{ keyword that links the landing marker TO the landing zone trigger }
Keyword Property DMP_ShipLandingMarker Auto Const mandatory
{ keyword to find NPCs linked to the landing marker }

;-- Functions ---------------------------------------

Event OnUnload()
  Self.ClearLinks() ; #DEBUG_LINE_NO:24
  Self.AlertLinkedNPCs(False) ; #DEBUG_LINE_NO:25
EndEvent

Event SpaceshipReference.OnShipLanding(spaceshipreference akSource, Bool abComplete)
  If abComplete ; #DEBUG_LINE_NO:30
    Self.ClearLinks() ; #DEBUG_LINE_NO:32
    Self.AlertLinkedNPCs(True) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SpaceshipReference.OnShipTakeOff(spaceshipreference akSource, Bool abComplete)
  If abComplete ; #DEBUG_LINE_NO:40
    landedSpaceship = None ; #DEBUG_LINE_NO:41
    landingMarker = None ; #DEBUG_LINE_NO:42
    Self.ClearLinks() ; #DEBUG_LINE_NO:44
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnShipLanding") ; #DEBUG_LINE_NO:45
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnShipTakeoff") ; #DEBUG_LINE_NO:46
  Else ; #DEBUG_LINE_NO:
    Self.SetLinks() ; #DEBUG_LINE_NO:49
    Self.AlertLinkedNPCs(False) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnCombatListAdded(Actor akSource, Actor akTarget)
  Self.AlertLinkedNPCs(False) ; #DEBUG_LINE_NO:58
EndEvent

Function BeginLanding(spaceshipreference mySpaceship, ObjectReference mylandingMarker)
  If landedSpaceship == None || landedSpaceship != mySpaceship ; #DEBUG_LINE_NO:64
    landedSpaceship = mySpaceship ; #DEBUG_LINE_NO:65
    Self.RegisterForRemoteEvent(mySpaceship as ScriptObject, "OnShipLanding") ; #DEBUG_LINE_NO:66
    Self.RegisterForRemoteEvent(mySpaceship as ScriptObject, "OnShipTakeoff") ; #DEBUG_LINE_NO:67
    Self.SetLinks() ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
  landingMarker = mylandingMarker ; #DEBUG_LINE_NO:70
EndFunction

Function SetLinks()
  Self.SetValue(LandingZoneHot, 1.0) ; #DEBUG_LINE_NO:75
  ObjectReference[] triggerRefs = Self.GetAllRefsInTrigger() ; #DEBUG_LINE_NO:77
  Int I = 0 ; #DEBUG_LINE_NO:80
  While I < triggerRefs.Length ; #DEBUG_LINE_NO:81
    Actor triggerActor = triggerRefs[I] as Actor ; #DEBUG_LINE_NO:82
    If triggerActor ; #DEBUG_LINE_NO:83
      triggerActor.SetLinkedRef(Self as ObjectReference, SQ_LinkLandingZoneTrigger, True) ; #DEBUG_LINE_NO:85
      triggerActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:86
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:88
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ClearLinks()
  Self.SetValue(LandingZoneHot, 0.0) ; #DEBUG_LINE_NO:94
  ObjectReference[] linkedRefs = Self.GetRefsLinkedToMe(SQ_LinkLandingZoneTrigger, None) ; #DEBUG_LINE_NO:95
  Int I = 0 ; #DEBUG_LINE_NO:97
  While I < linkedRefs.Length ; #DEBUG_LINE_NO:98
    ObjectReference theRef = linkedRefs[I] ; #DEBUG_LINE_NO:99
    theRef.SetLinkedRef(None, SQ_LinkLandingZoneTrigger, True) ; #DEBUG_LINE_NO:101
    I += 1 ; #DEBUG_LINE_NO:102
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function AlertLinkedNPCs(Bool bAlerted)
  Guard AlertGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:108
    If landingMarker ; #DEBUG_LINE_NO:110
      If alerted != bAlerted ; #DEBUG_LINE_NO:111
        alerted = bAlerted ; #DEBUG_LINE_NO:112
        ObjectReference[] linkedRefs = landingMarker.GetRefsLinkedToMe(DMP_ShipLandingMarker, None) ; #DEBUG_LINE_NO:113
        Int I = 0 ; #DEBUG_LINE_NO:116
        While I < linkedRefs.Length ; #DEBUG_LINE_NO:117
          Actor triggerActor = linkedRefs[I] as Actor ; #DEBUG_LINE_NO:118
          If triggerActor ; #DEBUG_LINE_NO:119
            If bAlerted ; #DEBUG_LINE_NO:120
              Self.RegisterForRemoteEvent(triggerActor as ScriptObject, "OnCombatListAdded") ; #DEBUG_LINE_NO:122
              triggerActor.SetValue(LandingZoneHot, 1.0) ; #DEBUG_LINE_NO:123
            Else ; #DEBUG_LINE_NO:
              Self.UnregisterForRemoteEvent(triggerActor as ScriptObject, "OnCombatListAdded") ; #DEBUG_LINE_NO:126
              triggerActor.SetValue(LandingZoneHot, 0.0) ; #DEBUG_LINE_NO:127
            EndIf ; #DEBUG_LINE_NO:
            triggerActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:129
          EndIf ; #DEBUG_LINE_NO:
          I += 1 ; #DEBUG_LINE_NO:131
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction
