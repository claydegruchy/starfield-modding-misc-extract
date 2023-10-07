ScriptName ENV_AfflictionTreatmentEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_env_afflictionsscript Property SQ_ENV Auto Const mandatory
{ autofill }
Keyword Property TreatmentEffectKeyword Auto Const mandatory
{ filter for: ENV_EffectType_AFFL_Treatment_ }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Int improvementLevels = Math.Max(afMagnitude, 1.0) as Int ; #DEBUG_LINE_NO:12
  SQ_ENV.ImproveActiveAfflictions(TreatmentEffectKeyword, improvementLevels, True) ; #DEBUG_LINE_NO:14
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:21
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:25
EndFunction
