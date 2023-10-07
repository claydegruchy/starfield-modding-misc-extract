ScriptName LegendaryMagicEffectEventListenScript Extends ActiveMagicEffect
{ Listens to events from LegendaryItemQuestScript originating from LegendaryMagicEffectEventSenderScript

Extend this script, and reimplement "HandleEvent()" function }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
legendaryitemquestscript Property LegendaryItemQuest Auto Const mandatory
{ Autofill }
MagicEffect Property MagicEffectEventSender Auto Const
{ Which Magic Effect is the LegendaryMagicEffectEventSenderScript we are listening for attached?
This script will ignore all events where this does != kArgs[0](the base MagicEffect of the sending ActiveMagicEffect) }

;-- Functions ---------------------------------------

Function HandleEvent(MagicEffect EventMagicEffect, Actor TargetActor, Actor CasterActor, Int EventType, Var EventArg1, Var EventArg2, Var EventArg3)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForCustomEvent(LegendaryItemQuest as ScriptObject, "legendaryitemquestscript_LegendaryMagicEffectEvent") ; #DEBUG_LINE_NO:18
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.UnregisterForCustomEvent(LegendaryItemQuest as ScriptObject, "legendaryitemquestscript_LegendaryMagicEffectEvent") ; #DEBUG_LINE_NO:22
EndEvent

Event LegendaryItemQuestScript.LegendaryMagicEffectEvent(legendaryitemquestscript akSender, Var[] kArgs)
  If kArgs[0] as MagicEffect == MagicEffectEventSender ; #DEBUG_LINE_NO:37
    If Self.GetTargetActor() == kArgs[2] as Actor ; #DEBUG_LINE_NO:40
      Self.HandleEvent(kArgs[0] as MagicEffect, kArgs[1] as Actor, kArgs[2] as Actor, kArgs[3] as Int, kArgs[4], kArgs[5], kArgs[6]) ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
