ScriptName TestPressurizedTankScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool tankPunctured = False

;-- Properties --------------------------------------
Explosion Property Test_Fire_Sm_CannisterExplosion Auto Const mandatory
ActorValue Property Test_PiercingHealth Auto Const mandatory
ActorValue Property Test_FireHealth Auto Const mandatory
ActorValue Property Test_CryoHealth Auto Const mandatory
Float Property DamageThreshold = 99.0 Auto Const
Float Property CryoDamageThreshold = 80.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference Tank = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:18
  Self.RegisterForActorValueLessThanEvent(Tank, Test_PiercingHealth, DamageThreshold) ; #DEBUG_LINE_NO:21
  Self.RegisterForActorValueLessThanEvent(Tank, Test_FireHealth, DamageThreshold) ; #DEBUG_LINE_NO:22
  Self.RegisterForActorValueLessThanEvent(Tank, Test_CryoHealth, CryoDamageThreshold) ; #DEBUG_LINE_NO:23
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == Test_CryoHealth ; #DEBUG_LINE_NO:29
    If Self.GetLinkedRef(None).GetValue(Test_CryoHealth) <= CryoDamageThreshold ; #DEBUG_LINE_NO:30
      Self.Freeze() ; #DEBUG_LINE_NO:31
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akActorValue == Test_PiercingHealth ; #DEBUG_LINE_NO:34
    If Self.GetLinkedRef(None).GetValue(Test_PiercingHealth) <= DamageThreshold ; #DEBUG_LINE_NO:35
      Self.Puncture() ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akActorValue == Test_FireHealth ; #DEBUG_LINE_NO:39
    If Self.GetLinkedRef(None).GetValue(Test_FireHealth) <= DamageThreshold ; #DEBUG_LINE_NO:40
      Self.Puncture() ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Explode()
  Self.GetLinkedRef(None).PlaceAtMe(Test_Fire_Sm_CannisterExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:50
EndFunction

Function Puncture()
  tankPunctured = True ; #DEBUG_LINE_NO:55
  Int count = 0 ; #DEBUG_LINE_NO:56
  While count < 30 ; #DEBUG_LINE_NO:57
    Self.GetLinkedRef(None).ApplyHavokImpulse(1.0, 0.0, 0.0, 10.0) ; #DEBUG_LINE_NO:58
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:59
    count += 1 ; #DEBUG_LINE_NO:60
  EndWhile ; #DEBUG_LINE_NO:
  Self.UnRegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_PiercingHealth, DamageThreshold) ; #DEBUG_LINE_NO:62
  Self.UnRegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_FireHealth, DamageThreshold) ; #DEBUG_LINE_NO:63
  Self.GetLinkedRef(None).ApplyHavokImpulse(1.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:64
  Self.Explode() ; #DEBUG_LINE_NO:65
EndFunction

Function Freeze()
  Self.GetLinkedRef(None).SetValue(Test_PiercingHealth, 150.0) ; #DEBUG_LINE_NO:70
  Self.GetLinkedRef(None).SetValue(Test_FireHealth, 150.0) ; #DEBUG_LINE_NO:71
  Self.RegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_PiercingHealth, DamageThreshold) ; #DEBUG_LINE_NO:73
  Self.RegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_FireHealth, DamageThreshold) ; #DEBUG_LINE_NO:74
EndFunction
