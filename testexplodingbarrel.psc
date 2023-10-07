ScriptName TestExplodingBarrel Extends ObjectReference
{ A script to prototype the functionality of an exploding barrel. }

;-- Variables ---------------------------------------
ObjectReference FireFX
ObjectReference FireHazard
Bool exploded = False
Bool punctured = False
Bool readyToExplode = False
Int remainingFuel = 3

;-- Properties --------------------------------------
Explosion Property Test_Fire_Sm_Explosion Auto Const
Weapon Property UnarmedHuman Auto Const
Form Property FireMed01 Auto Const
Form Property ENV_GasVentHazard_Heat_Small Auto Const
Form Property Test_Hazard_Pool_Fire Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:17
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:23
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If abBashAttack || (akSource == UnarmedHuman as Form) ; #DEBUG_LINE_NO:35
     ; #DEBUG_LINE_NO:
  ElseIf readyToExplode ; #DEBUG_LINE_NO:
    If !exploded ; #DEBUG_LINE_NO:40
      Self.Explode() ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
  ElseIf punctured ; #DEBUG_LINE_NO:
    FireFX = Self.PlaceAtMe(FireMed01, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:45
    FireHazard = Self.PlaceAtMe(ENV_GasVentHazard_Heat_Small, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:46
    Self.StartTimer(3.0, 0) ; #DEBUG_LINE_NO:47
    readyToExplode = True ; #DEBUG_LINE_NO:48
  Else ; #DEBUG_LINE_NO:
    Self.StartTimer(3.0, 1) ; #DEBUG_LINE_NO:50
    punctured = True ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:56
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == 0 ; #DEBUG_LINE_NO:62
    If !exploded ; #DEBUG_LINE_NO:63
      Self.Explode() ; #DEBUG_LINE_NO:64
    EndIf ; #DEBUG_LINE_NO:
  ElseIf aiTimerID == 1 ; #DEBUG_LINE_NO:66
    If !exploded && remainingFuel > 0 && punctured ; #DEBUG_LINE_NO:67
      Self.LeakFuel() ; #DEBUG_LINE_NO:68
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Explode()
  exploded = True ; #DEBUG_LINE_NO:76
  Self.PlaceAtMe(Test_Fire_Sm_Explosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:77
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:78
  FireFX.Disable(False) ; #DEBUG_LINE_NO:79
  FireHazard.Disable(False) ; #DEBUG_LINE_NO:80
  Self.Disable(False) ; #DEBUG_LINE_NO:81
EndFunction

Function LeakFuel()
  Self.PlaceAtMe(Test_Hazard_Pool_Fire, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:85
  remainingFuel -= 1 ; #DEBUG_LINE_NO:86
  Self.StartTimer(3.0, 1) ; #DEBUG_LINE_NO:87
EndFunction
