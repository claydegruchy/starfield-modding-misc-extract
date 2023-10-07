ScriptName LegendaryMagicEffectEventSenderScript Extends ActiveMagicEffect
{ Sends event through LegendaryItemQuestScript when magic effect starts and finishes

kArgs[0] = base MagicEffect this script is attached to
kArgs[1] = Target Actor
kArgs[2] = Caster Actor / Aggressor Actor (OnHit)
kArgs[3] = EventType?  (LegendaryItemQuestScript) iEventType_Starting, iEventType_Finishing, iEventType_OnHit
kArgs[4] = EventArg1
kArgs[5] = EventArg2
kArgs[6] = EventArg3 }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  legendaryitemquestscript Property LegendaryItemQuest Auto Const mandatory
  { Autofill }
EndGroup

Group FillThisWithThisMagicEffect
  MagicEffect Property ThisMagicEffect Auto Const
  { Fill this property with the MagicEffect base form you have attached this script to.

Why? Because esoteric timing issues:
If you kill an actor in the same moment it applies the effect, 
the active magic effect no longer exists, so GetBaseObject() fails.
And this script needs a pointer to the magic effect in question to pass along in a function call,
so we store it in the property. }
EndGroup

Group Options
  Bool Property SendOnEffectStartEvent = True Auto Const
  { Default: true
Should we send an event when the magic effect is applied? }
  Bool Property SendOnEffectStartFinish = False Auto Const
  { Default: false
Should we send an event when the magic effect finishes?
Only should be true for things with a duration. }
  Bool Property SendOnHitEvent = False Auto Const
  { Default: false
Should we register for OnHit events? 
Only should be true for things with a duration }
EndGroup

Group EventArgs
  Form Property EventArg1 Auto Const
  { Sent as kArgs[4] }
  Form Property EventArg2 Auto Const
  { Sent as kArgs[5] }
  Form Property EventArg3 Auto Const
  { Sent as kArgs[6] }
EndGroup


;-- Functions ---------------------------------------

Function SendLegendaryMagicEffectEvent(Actor akTarget, Actor akCaster, Int EventType)
  Var[] kArgs = new Var[7] ; #DEBUG_LINE_NO:66
  kArgs[0] = ThisMagicEffect as Var ; #DEBUG_LINE_NO:68
  kArgs[1] = akTarget as Var ; #DEBUG_LINE_NO:69
  kArgs[2] = akCaster as Var ; #DEBUG_LINE_NO:70
  kArgs[3] = EventType as Var ; #DEBUG_LINE_NO:71
  kArgs[4] = EventArg1 as Var ; #DEBUG_LINE_NO:72
  kArgs[5] = EventArg2 as Var ; #DEBUG_LINE_NO:73
  kArgs[6] = EventArg3 as Var ; #DEBUG_LINE_NO:74
  LegendaryItemQuest.SendLegendaryMagicEffectEvent(kArgs) ; #DEBUG_LINE_NO:78
EndFunction

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor targetActor = akTarget as Actor ; #DEBUG_LINE_NO:83
  If targetActor ; #DEBUG_LINE_NO:84
    If SendOnHitEvent ; #DEBUG_LINE_NO:87
      Self.RegisterForHitEvent(akTarget as ScriptObject, akCaster as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:88
    EndIf ; #DEBUG_LINE_NO:
    If SendOnEffectStartEvent ; #DEBUG_LINE_NO:91
      Self.SendLegendaryMagicEffectEvent(targetActor, akCaster, LegendaryItemQuest.iEventType_Starting) ; #DEBUG_LINE_NO:93
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor targetActor = akTarget as Actor ; #DEBUG_LINE_NO:99
  If targetActor ; #DEBUG_LINE_NO:100
    If SendOnEffectStartFinish ; #DEBUG_LINE_NO:103
      Self.SendLegendaryMagicEffectEvent(targetActor, akCaster, LegendaryItemQuest.iEventType_Finishing) ; #DEBUG_LINE_NO:105
    EndIf ; #DEBUG_LINE_NO:
    Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.SendLegendaryMagicEffectEvent(akTarget as Actor, akAggressor as Actor, LegendaryItemQuest.iEventType_OnHit) ; #DEBUG_LINE_NO:114
  If SendOnHitEvent ; #DEBUG_LINE_NO:116
    Self.RegisterForHitEvent(akTarget as ScriptObject, akAggressor as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:117
  EndIf ; #DEBUG_LINE_NO:
EndEvent
