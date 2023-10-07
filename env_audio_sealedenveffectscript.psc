ScriptName ENV_Audio_SealedEnvEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Properties
  String Property StateGroup = "State_PlayerInAtmosphere" Auto Const
  String Property EffectStartState = "Yes" Auto Const
  { this is sent when player enters a sealed environment }
  String Property EffectEndState = "No" Auto Const
  { this is sent when player leaves a sealed environment }
EndGroup


;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  wwiseevent.SetGlobalState(StateGroup, EffectStartState) ; #DEBUG_LINE_NO:13
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  wwiseevent.SetGlobalState(StateGroup, EffectEndState) ; #DEBUG_LINE_NO:18
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:25
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:29
EndFunction
