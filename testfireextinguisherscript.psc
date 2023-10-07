ScriptName TestFireExtinguisherScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property Test_Fire_Sm_CannisterExplosion Auto Const mandatory
ActorValue Property Test_PiercingHealth Auto Const mandatory
ActorValue Property Test_FireHealth Auto Const mandatory
ActorValue Property Test_CryoHealth Auto Const mandatory
Float Property DamageThreshold = 99.0 Auto Const
Float Property CryoDamageThreshold = 70.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.GetLinkedRef(None).SetValue(Test_PiercingHealth, 100.0) ; #DEBUG_LINE_NO:16
  Self.GetLinkedRef(None).SetValue(Test_FireHealth, 100.0) ; #DEBUG_LINE_NO:17
  Self.GetLinkedRef(None).SetValue(Test_CryoHealth, 100.0) ; #DEBUG_LINE_NO:18
  ObjectReference tank = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:19
  Self.RegisterForActorValueLessThanEvent(tank, Test_PiercingHealth, DamageThreshold) ; #DEBUG_LINE_NO:23
  Self.RegisterForActorValueLessThanEvent(tank, Test_FireHealth, DamageThreshold) ; #DEBUG_LINE_NO:24
  Self.RegisterForActorValueLessThanEvent(tank, Test_CryoHealth, CryoDamageThreshold) ; #DEBUG_LINE_NO:25
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == Test_CryoHealth ; #DEBUG_LINE_NO:31
    If Self.GetLinkedRef(None).GetValue(Test_CryoHealth) <= CryoDamageThreshold ; #DEBUG_LINE_NO:32
      Self.Freeze() ; #DEBUG_LINE_NO:33
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akActorValue == Test_PiercingHealth ; #DEBUG_LINE_NO:36
    If Self.GetLinkedRef(None).GetValue(Test_PiercingHealth) <= DamageThreshold ; #DEBUG_LINE_NO:37
      Self.Explode() ; #DEBUG_LINE_NO:38
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akActorValue == Test_FireHealth ; #DEBUG_LINE_NO:41
    If Self.GetLinkedRef(None).GetValue(Test_FireHealth) <= DamageThreshold ; #DEBUG_LINE_NO:42
      Self.Explode() ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Explode()
  Self.GetLinkedRef(None).PlaceAtMe(Test_Fire_Sm_CannisterExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:51
EndFunction

Function Freeze()
  ObjectReference tank = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:55
  Self.GetLinkedRef(None).SetValue(Test_PiercingHealth, 150.0) ; #DEBUG_LINE_NO:57
  Self.GetLinkedRef(None).SetValue(Test_FireHealth, 150.0) ; #DEBUG_LINE_NO:58
  Self.RegisterForActorValueLessThanEvent(tank, Test_PiercingHealth, DamageThreshold) ; #DEBUG_LINE_NO:60
  Self.RegisterForActorValueLessThanEvent(tank, Test_FireHealth, DamageThreshold) ; #DEBUG_LINE_NO:61
EndFunction
