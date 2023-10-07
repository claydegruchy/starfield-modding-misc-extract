ScriptName HazardBase Extends objectReference

;-- Variables ---------------------------------------
Bool isWaitingToEvaluate = False

;-- Properties --------------------------------------
Int Property damage Auto hidden
Int Property soundLevel = 10 Auto
Int Property trapPushBack Auto
wwiseevent Property TrapHitSound Auto
Weapon Property hitFX Auto
Ammo Property hitFXAmmo Auto
Int Property trapLevel = 1 Auto
Float Property staggerAmount = 0.0 Auto
Bool Property CheckAngle = False Auto
{ if true this will check the angle of the actors velocity to the "up" vector of the trap
	default == False }
Int Property LvlThreshold1 Auto
Int Property LvlDamage1 Auto
Int Property LvlThreshold2 Auto
Int Property LvlDamage2 Auto
Int Property LvlThreshold3 Auto
Int Property LvlDamage3 Auto
Int Property LvlThreshold4 Auto
Int Property LvlDamage4 Auto
Int Property LvlThreshold5 Auto
Int Property LvlDamage5 Auto
Int Property LvlDamage6 Auto

;-- Functions ---------------------------------------

Event onLoad()
  Self.ResolveLeveledDamage() ; #DEBUG_LINE_NO:39
EndEvent

Function doLocalHit(ObjectReference akTarget, Float afXVel, Float afYVel, Float afZVel, Float afXPos, Float afYPos, Float afZPos, Int aeMaterial, Bool abInitialHit, Int aeMotionType)
  akTarget.ProcessTrapHit(Self as ObjectReference, damage as Float, trapPushBack as Float, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, staggerAmount) ; #DEBUG_LINE_NO:54
  TrapHitSound.play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:56
  hitFX.fire(Self as ObjectReference, hitFXAmmo) ; #DEBUG_LINE_NO:57
  Self.CreateDetectionEvent(akTarget as Actor, soundLevel) ; #DEBUG_LINE_NO:58
EndFunction

Bool Function isAngleAcceptable(Float afXVel, Float afYVel, Float afZVel)
  Float maxZVelocity = 1.0 ; #DEBUG_LINE_NO:64
  Float minZVelocity = 0.300000012 ; #DEBUG_LINE_NO:65
  Float absoluteZ = Math.abs(afZVel) ; #DEBUG_LINE_NO:83
  Float absoluteY = Math.abs(afYVel) ; #DEBUG_LINE_NO:84
  Float absoluteX = Math.abs(afXVel) ; #DEBUG_LINE_NO:85
  If absoluteZ >= maxZVelocity ; #DEBUG_LINE_NO:86
    Return True ; #DEBUG_LINE_NO:87
  ElseIf absoluteZ >= minZVelocity ; #DEBUG_LINE_NO:88
    If absoluteZ * 0.600000024 >= absoluteY ; #DEBUG_LINE_NO:89
      Return True ; #DEBUG_LINE_NO:90
    ElseIf absoluteZ * 0.600000024 >= absoluteX ; #DEBUG_LINE_NO:91
      Return True ; #DEBUG_LINE_NO:92
    Else ; #DEBUG_LINE_NO:
      Return False ; #DEBUG_LINE_NO:94
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:97
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ResolveLeveledDamage()
  Int damageLevel = 0 ; #DEBUG_LINE_NO:118
  damageLevel = Self.CalculateEncounterLevel(trapLevel) ; #DEBUG_LINE_NO:119
  damage = LvlDamage1 ; #DEBUG_LINE_NO:121
  If damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2 ; #DEBUG_LINE_NO:123
    damage = LvlDamage2 ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
  If damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3 ; #DEBUG_LINE_NO:128
    damage = LvlDamage3 ; #DEBUG_LINE_NO:129
  EndIf ; #DEBUG_LINE_NO:
  If damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4 ; #DEBUG_LINE_NO:133
    damage = LvlDamage4 ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
  If damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5 ; #DEBUG_LINE_NO:138
    damage = LvlDamage5 ; #DEBUG_LINE_NO:139
  EndIf ; #DEBUG_LINE_NO:
  If damageLevel > LvlThreshold5 ; #DEBUG_LINE_NO:143
    damage = LvlDamage6 ; #DEBUG_LINE_NO:144
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
Auto State CanHit

  Event OnTrapHitStart(ObjectReference akTarget, Float afXVel, Float afYVel, Float afZVel, Float afXPos, Float afYPos, Float afZPos, Int aeMaterial, Bool abInitialHit, Int aeMotionType)
    If !CheckAngle ; #DEBUG_LINE_NO:25
      Self.doLocalHit(akTarget, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, abInitialHit, aeMotionType) ; #DEBUG_LINE_NO:26
    ElseIf Self.isAngleAcceptable(afXVel, afYVel, afZVel) ; #DEBUG_LINE_NO:28
      Self.doLocalHit(akTarget, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, abInitialHit, aeMotionType) ; #DEBUG_LINE_NO:29
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State CannotHit
EndState
