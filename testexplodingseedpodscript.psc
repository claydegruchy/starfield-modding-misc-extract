ScriptName TestExplodingSeedPodScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property Test_Fire_Sm_CannisterExplosion Auto Const mandatory
ActorValue Property Test_PiercingHealth Auto Const mandatory
ActorValue Property Test_FireHealth Auto Const mandatory
ActorValue Property Test_CryoHealth Auto Const mandatory
ObjectReference Property GasCloud Auto Const mandatory
Float Property DamageThreshold = 99.0 Auto Const
Float Property CryoDamageThreshold = 70.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference tank = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:18
  Self.RegisterForActorValueLessThanEvent(tank, Test_PiercingHealth, DamageThreshold) ; #DEBUG_LINE_NO:21
  Self.RegisterForActorValueLessThanEvent(tank, Test_FireHealth, DamageThreshold) ; #DEBUG_LINE_NO:22
  Self.RegisterForActorValueLessThanEvent(tank, Test_CryoHealth, CryoDamageThreshold) ; #DEBUG_LINE_NO:23
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == Test_CryoHealth ; #DEBUG_LINE_NO:29
    If Self.GetLinkedRef(None).GetValue(Test_CryoHealth) <= CryoDamageThreshold ; #DEBUG_LINE_NO:30
      Self.Freeze() ; #DEBUG_LINE_NO:31
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akActorValue == Test_PiercingHealth ; #DEBUG_LINE_NO:34
    If Self.GetLinkedRef(None).GetValue(Test_PiercingHealth) <= DamageThreshold ; #DEBUG_LINE_NO:35
      Self.Explode() ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akActorValue == Test_FireHealth ; #DEBUG_LINE_NO:39
    If Self.GetLinkedRef(None).GetValue(Test_FireHealth) <= DamageThreshold ; #DEBUG_LINE_NO:40
      Self.Explode() ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Explode()
  Self.GetLinkedRef(None).PlaceAtMe(Test_Fire_Sm_CannisterExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:49
  Self.GetLinkedRef(None).Disable(False) ; #DEBUG_LINE_NO:50
  GasCloud.Enable(False) ; #DEBUG_LINE_NO:51
  Utility.Wait(10.0) ; #DEBUG_LINE_NO:52
  GasCloud.Disable(False) ; #DEBUG_LINE_NO:53
EndFunction

Function Freeze()
  ObjectReference tank = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:57
  Self.GetLinkedRef(None).SetValue(Test_PiercingHealth, 150.0) ; #DEBUG_LINE_NO:59
  Self.GetLinkedRef(None).SetValue(Test_FireHealth, 150.0) ; #DEBUG_LINE_NO:60
  Self.RegisterForActorValueLessThanEvent(tank, Test_PiercingHealth, DamageThreshold) ; #DEBUG_LINE_NO:62
  Self.RegisterForActorValueLessThanEvent(tank, Test_FireHealth, DamageThreshold) ; #DEBUG_LINE_NO:63
EndFunction
