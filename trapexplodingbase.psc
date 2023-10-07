ScriptName TrapExplodingBase Extends TrapBase
{ base script for traps that explode when they take damage }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TrapExplodingData
  Explosion Property TrapExplosion Auto Const mandatory
  ActorValue Property Stim_Health_Piercing Auto Const mandatory
  ActorValue Property Stim_Health_Flame Auto Const mandatory
  ActorValue Property Stim_Health_Freezing Auto Const mandatory
  ActorValue Property Stim_Health_Energy Auto Const mandatory
  Float Property DamageThresholdPiercing = 100.0 Auto
  Float Property DamageThresholdFlame = 100.0 Auto
  Float Property DamageThresholdCryo = 100.0 Auto
  Float Property DamageThresholdEnergy = 100.0 Auto
  Float Property FreezeHealthMult = 1.5 Auto Const
  { health multiplier on flame and piercing damage when frozen }
EndGroup


;-- Functions ---------------------------------------

Function HandleOnLoad()
  If bDisarmed == False ; #DEBUG_LINE_NO:26
    ObjectReference tank = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:27
    Self.RegisterForActorValueLessThanEvent(tank, Stim_Health_Piercing, DamageThresholdPiercing) ; #DEBUG_LINE_NO:28
    Self.RegisterForActorValueLessThanEvent(tank, Stim_Health_Flame, DamageThresholdFlame) ; #DEBUG_LINE_NO:29
    Self.RegisterForActorValueLessThanEvent(tank, Stim_Health_Freezing, DamageThresholdCryo) ; #DEBUG_LINE_NO:30
    Self.RegisterForActorValueLessThanEvent(tank, Stim_Health_Energy, DamageThresholdEnergy) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandleOnUnload()
  ObjectReference tank = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:36
  Self.UnregisterForAllEvents() ; #DEBUG_LINE_NO:37
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == Stim_Health_Freezing ; #DEBUG_LINE_NO:43
    If Self.GetLinkedRef(None).GetValue(Stim_Health_Freezing) <= DamageThresholdCryo ; #DEBUG_LINE_NO:44
      Self.ExceedFreezeDamage() ; #DEBUG_LINE_NO:45
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akActorValue == Stim_Health_Piercing ; #DEBUG_LINE_NO:47
    If Self.GetLinkedRef(None).GetValue(Stim_Health_Piercing) <= DamageThresholdPiercing ; #DEBUG_LINE_NO:48
      Self.ExceedPiercingDamage() ; #DEBUG_LINE_NO:49
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akActorValue == Stim_Health_Flame ; #DEBUG_LINE_NO:51
    If Self.GetLinkedRef(None).GetValue(Stim_Health_Flame) <= DamageThresholdFlame ; #DEBUG_LINE_NO:52
      Self.ExceedFlameDamage() ; #DEBUG_LINE_NO:53
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akActorValue == Stim_Health_Energy ; #DEBUG_LINE_NO:55
    If Self.GetLinkedRef(None).GetValue(Stim_Health_Energy) <= DamageThresholdEnergy ; #DEBUG_LINE_NO:56
      Self.ExceedEnergyDamage() ; #DEBUG_LINE_NO:57
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ExceedPiercingDamage()
  Self.Explode() ; #DEBUG_LINE_NO:64
EndFunction

Function ExceedFlameDamage()
  Self.Explode() ; #DEBUG_LINE_NO:69
EndFunction

Function ExceedEnergyDamage()
  Self.Explode() ; #DEBUG_LINE_NO:74
EndFunction

Function ExceedFreezeDamage()
  ObjectReference myLinkedRef = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:82
  If myLinkedRef ; #DEBUG_LINE_NO:83
    myLinkedRef.SetValue(Stim_Health_Piercing, FreezeHealthMult * myLinkedRef.GetBaseValue(Stim_Health_Piercing)) ; #DEBUG_LINE_NO:84
    myLinkedRef.SetValue(Stim_Health_Flame, FreezeHealthMult * myLinkedRef.GetBaseValue(Stim_Health_Flame)) ; #DEBUG_LINE_NO:85
    Self.RegisterForActorValueLessThanEvent(myLinkedRef, Stim_Health_Piercing, DamageThresholdPiercing) ; #DEBUG_LINE_NO:86
    Self.RegisterForActorValueLessThanEvent(myLinkedRef, Stim_Health_Flame, DamageThresholdFlame) ; #DEBUG_LINE_NO:87
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Explode()
  Self.GotoState("Unloaded") ; #DEBUG_LINE_NO:92
  Self.Disarm() ; #DEBUG_LINE_NO:93
  ObjectReference myLinkedRef = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:95
  If myLinkedRef ; #DEBUG_LINE_NO:96
    myLinkedRef.PlaceAtMe(TrapExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:98
    myLinkedRef.DisableNoWait(False) ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
EndFunction
