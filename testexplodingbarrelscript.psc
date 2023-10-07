ScriptName TestExplodingBarrelScript Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference FireFX
Bool barrelPunctured = False
Bool isFrozen = False
Bool onFire = False

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
{ keyword for linking the flame FX }
Explosion Property Test_Fire_Sm_Explosion Auto Const mandatory
Form Property TRP_Puddle_Flammable_01_Packin Auto Const mandatory
ActorValue Property Test_PiercingHealth Auto Const mandatory
ActorValue Property Test_FireHealth Auto Const mandatory
ActorValue Property Test_CryoHealth Auto Const mandatory
Float Property DamageThreshold = 95.0 Auto Const
Float Property MassiveDamageThreshold = 10.0 Auto Const
Float Property FireDamagePerSecond = 20.0 Auto Const
Float Property MassiveDamageTimeWindow = 1.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference Barrel = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:38
  Self.RegisterForActorValueLessThanEvent(Barrel, Test_PiercingHealth, DamageThreshold) ; #DEBUG_LINE_NO:41
  Self.RegisterForActorValueLessThanEvent(Barrel, Test_PiercingHealth, MassiveDamageThreshold) ; #DEBUG_LINE_NO:42
  Self.RegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_CryoHealth, MassiveDamageThreshold) ; #DEBUG_LINE_NO:43
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == Test_PiercingHealth ; #DEBUG_LINE_NO:50
    If !barrelPunctured ; #DEBUG_LINE_NO:52
      Self.Puncture() ; #DEBUG_LINE_NO:53
    EndIf ; #DEBUG_LINE_NO:
    If Self.GetLinkedRef(None).GetValue(Test_PiercingHealth) <= MassiveDamageThreshold ; #DEBUG_LINE_NO:56
      Self.Explode() ; #DEBUG_LINE_NO:57
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(MassiveDamageTimeWindow, 10) ; #DEBUG_LINE_NO:59
      Self.RegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_PiercingHealth, MassiveDamageThreshold) ; #DEBUG_LINE_NO:60
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akActorValue == Test_FireHealth ; #DEBUG_LINE_NO:63
    If Self.GetLinkedRef(None).GetValue(Test_FireHealth) <= MassiveDamageThreshold ; #DEBUG_LINE_NO:64
      Self.Explode() ; #DEBUG_LINE_NO:65
    ElseIf !onFire ; #DEBUG_LINE_NO:66
      onFire = True ; #DEBUG_LINE_NO:67
      Self.CatchFire() ; #DEBUG_LINE_NO:68
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akActorValue == Test_CryoHealth ; #DEBUG_LINE_NO:71
    Self.Freeze() ; #DEBUG_LINE_NO:72
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == 10 ; #DEBUG_LINE_NO:77
    Self.GetLinkedRef(None).RestoreValue(Test_PiercingHealth, 10.0) ; #DEBUG_LINE_NO:79
    Self.StartTimer(MassiveDamageTimeWindow, 10) ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
  If aiTimerID == 20 && !isFrozen ; #DEBUG_LINE_NO:82
    Self.GetLinkedRef(None).DamageValue(Test_FireHealth, FireDamagePerSecond / 2.0) ; #DEBUG_LINE_NO:83
    If Self.GetLinkedRef(None).GetValue(Test_FireHealth) <= MassiveDamageThreshold ; #DEBUG_LINE_NO:84
      Self.Explode() ; #DEBUG_LINE_NO:85
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(0.5, 20) ; #DEBUG_LINE_NO:87
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Explode()
  Self.GetLinkedRef(None).PlaceAtMe(Test_Fire_Sm_Explosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:97
  Self.GetLinkedRef(None).GetLinkedRef(LinkCustom01).Disable(False) ; #DEBUG_LINE_NO:99
  Self.GetLinkedRef(None).Disable(False) ; #DEBUG_LINE_NO:100
EndFunction

Function CatchFire()
  Self.StartTimer(0.5, 20) ; #DEBUG_LINE_NO:105
  Self.GetLinkedRef(None).GetLinkedRef(LinkCustom01).Enable(False) ; #DEBUG_LINE_NO:106
  Self.RegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_FireHealth, MassiveDamageThreshold) ; #DEBUG_LINE_NO:108
EndFunction

Function Puncture()
  barrelPunctured = True ; #DEBUG_LINE_NO:112
  Self.GetLinkedRef(None).RestoreValue(Test_FireHealth, 100.0 - Self.GetLinkedRef(None).GetValue(Test_FireHealth)) ; #DEBUG_LINE_NO:113
  Self.RegisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_FireHealth, DamageThreshold) ; #DEBUG_LINE_NO:114
  Self.GetLinkedRef(None).PlaceAtMe(TRP_Puddle_Flammable_01_Packin, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:115
EndFunction

Function Freeze()
  isFrozen = True ; #DEBUG_LINE_NO:120
  barrelPunctured = False ; #DEBUG_LINE_NO:121
  Self.UnregisterForActorValueLessThanEvent(Self.GetLinkedRef(None), Test_FireHealth, DamageThreshold) ; #DEBUG_LINE_NO:122
  If onFire ; #DEBUG_LINE_NO:123
    Self.GetLinkedRef(None).GetLinkedRef(LinkCustom01).Disable(False) ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
EndFunction
