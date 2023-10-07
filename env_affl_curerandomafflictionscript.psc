ScriptName ENV_AFFL_CureRandomAfflictionScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_env_afflictionsscript Property SQ_Env Auto Const mandatory
{ autofill }
Int Property Chance = 10 Auto Const
{ on a d100 }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  SQ_Env.CureRandomAffliction(Chance) ; #DEBUG_LINE_NO:12
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:21
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:25
EndFunction
