ScriptName RL039_ExampleTurretScript Extends Actor

;-- Variables ---------------------------------------
Bool attackBlob
ObjectReference explosionMarker
expandingbiomassscript target_expandingBiomassScript

;-- Properties --------------------------------------
Float Property initialWaitTime Auto Const
Float Property randomWaitTimeMin Auto Const
Float Property randomWaitTimeMax Auto Const
Float Property randomFireTimeMin Auto Const
Float Property randomFireTimeMax Auto Const
Int Property hitsPerFire Auto Const
wwiseevent Property fireSoundEvent Auto Const
Keyword Property RL039_ExplosionMarker Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  ObjectReference target = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:17
  target_expandingBiomassScript = target as expandingbiomassscript ; #DEBUG_LINE_NO:18
  explosionMarker = Self.GetLinkedRef(RL039_ExplosionMarker) ; #DEBUG_LINE_NO:20
  explosionMarker.Disable(False) ; #DEBUG_LINE_NO:21
  Utility.Wait(initialWaitTime) ; #DEBUG_LINE_NO:23
  attackBlob = True ; #DEBUG_LINE_NO:25
  Self.ShootAtTarget() ; #DEBUG_LINE_NO:26
EndEvent

Event OnDeath(ObjectReference akKiller)
  attackBlob = False ; #DEBUG_LINE_NO:30
  Self.DisableNoWait(False) ; #DEBUG_LINE_NO:32
EndEvent

Function ShootAtTarget()
  While attackBlob ; #DEBUG_LINE_NO:
    Float fireTime = Utility.RandomFloat(randomFireTimeMin, randomFireTimeMax) ; #DEBUG_LINE_NO:37
    target_expandingBiomassScript.TakeHits(hitsPerFire) ; #DEBUG_LINE_NO:39
    Int fireSoundId = fireSoundEvent.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:41
    explosionMarker.Enable(False) ; #DEBUG_LINE_NO:42
    Utility.Wait(fireTime) ; #DEBUG_LINE_NO:44
    wwiseevent.StopInstance(fireSoundId) ; #DEBUG_LINE_NO:46
    explosionMarker.Disable(False) ; #DEBUG_LINE_NO:47
    Float waitTime = Utility.RandomFloat(randomWaitTimeMin, randomWaitTimeMax) ; #DEBUG_LINE_NO:49
    Utility.Wait(waitTime) ; #DEBUG_LINE_NO:51
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  If aeCombatState != 0 ; #DEBUG_LINE_NO:56
    attackBlob = False ; #DEBUG_LINE_NO:57
  ElseIf !Self.IsDead() ; #DEBUG_LINE_NO:58
    attackBlob = True ; #DEBUG_LINE_NO:59
    Self.ShootAtTarget() ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
EndEvent
