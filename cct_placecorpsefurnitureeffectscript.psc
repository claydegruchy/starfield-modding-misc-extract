ScriptName CCT_PlaceCorpseFurnitureEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Int iDelayTimerFlyerID = 2 Const
Int iDelayTimerID = 1 Const

;-- Properties --------------------------------------
Furniture Property CreatureCorpseFeed Auto Const mandatory
{ corpse furniture to place on death if a non-flier }
Furniture Property CreatureCorpseFeed_Flyer Auto Const mandatory
{ corpse furniture to place on death if a flier }
Keyword Property ActorTypePredator Auto Const mandatory
{ check that killer is a predator }
conditionform Property CCT_IsFlier Auto Const mandatory
{ use to test if killer is a flier }
Float Property fDelay = 3.0 Auto Const
{ wait a bit for corpse to finish settling }
Float Property markerOffset = -2.5 Auto Const
{ how far to offset feed marker so the actor isn't right on top of the corpse }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:26
EndEvent

Event Actor.OnDeath(Actor akSource, ObjectReference akKiller)
  If akKiller as Bool && akKiller.HasKeyword(ActorTypePredator) ; #DEBUG_LINE_NO:30
    If CCT_IsFlier.IsTrue(akKiller, None) ; #DEBUG_LINE_NO:32
      Self.StartTimer(fDelay, iDelayTimerFlyerID) ; #DEBUG_LINE_NO:33
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(fDelay, iDelayTimerID) ; #DEBUG_LINE_NO:35
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  Actor targetActor = Self.GetTargetActor() ; #DEBUG_LINE_NO:41
  Float[] offset = new Float[3] ; #DEBUG_LINE_NO:42
  offset[1] = markerOffset ; #DEBUG_LINE_NO:43
  If aiTimerID == iDelayTimerID ; #DEBUG_LINE_NO:45
    ObjectReference markerRef = targetActor.PlaceAtMe(CreatureCorpseFeed as Form, 1, False, False, True, offset, None, True) ; #DEBUG_LINE_NO:47
  ElseIf aiTimerID == iDelayTimerFlyerID ; #DEBUG_LINE_NO:48
    ObjectReference markerref = targetActor.PlaceAtMe(CreatureCorpseFeed_Flyer as Form, 1, False, False, True, offset, None, True) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndEvent
