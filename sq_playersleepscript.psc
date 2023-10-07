ScriptName SQ_PlayerSleepScript Extends Actor Const
{ casts spells at player after waking up }

;-- Structs -----------------------------------------
Struct EffectDatum
  FormList KeywordList
  Spell SpellToCast
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Properties
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  { autofill }
  conditionform Property CND_SleepRequirements_WellRested_And_EmotionalSecurity Auto Const mandatory
  { autofill; SUBJECT: Player, TARGET: Bed }
  sq_playersleepscript:effectdatum[] Property SleepEffectData Auto Const mandatory
  { holds data associating keywords on beds with effects to cast. This found first (lower indexes) take precedence }
  Float Property RomanticCompanionDistance = 5.0 Auto Const
  { the distance needed for a romantic companion to be considered nearby; remember SQ_CompanionsScript moves companions to the bed the player clicked on if romantic }
  Spell Property WakeRomanticSpell Auto Const mandatory
  { spell to cast if a romantic companion is nearby when player wakes }
EndGroup

Keyword Property COM_NoSleepTeleportLocation Auto Const mandatory
{ If the location has this keyword, don't allow Companion to teleport there when Player awakens }

;-- Functions ---------------------------------------

Event OnInit()
  Self.RegisterForPlayerSleep() ; #DEBUG_LINE_NO:32
EndEvent

Event OnPlayerSleepStop(Bool abInterrupted, ObjectReference akBed)
  If CND_SleepRequirements_WellRested_And_EmotionalSecurity.IsTrue(Game.GetPlayer() as ObjectReference, akBed) ; #DEBUG_LINE_NO:39
    ObjectReference RomanticCompanion = SQ_Companions.SleepCompanionRomantic.GetRef() ; #DEBUG_LINE_NO:45
    companionactorscript StandardCompanion = SQ_Companions.SleepCompanion.GetRef() as companionactorscript ; #DEBUG_LINE_NO:46
    If RomanticCompanion != None || StandardCompanion != None && SQ_Companions.IsCompanionRomantic(StandardCompanion) ; #DEBUG_LINE_NO:48
      Self.Apply(WakeRomanticSpell) ; #DEBUG_LINE_NO:49
    Else ; #DEBUG_LINE_NO:
      Int I = 0 ; #DEBUG_LINE_NO:51
      While I < SleepEffectData.Length ; #DEBUG_LINE_NO:52
        sq_playersleepscript:effectdatum currentDatum = SleepEffectData[I] ; #DEBUG_LINE_NO:53
        If akBed.GetCurrentLocation().HasKeyword(COM_NoSleepTeleportLocation) == False ; #DEBUG_LINE_NO:55
          If akBed.HasKeywordInFormList(currentDatum.KeywordList) ; #DEBUG_LINE_NO:56
            Self.Apply(currentDatum.SpellToCast) ; #DEBUG_LINE_NO:57
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:61
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Apply(Spell SpellToApply)
  SpellToApply.Cast(Game.GetPlayer() as ObjectReference, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:70
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:79
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:83
EndFunction
