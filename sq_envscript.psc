ScriptName SQ_EnvScript Extends Quest
{ script attached to SQ_ENV quest }

;-- Variables ---------------------------------------
Bool DebugReportFallOn

;-- Properties --------------------------------------
Group Autofill
  ReferenceAlias Property TextReplacementRefAlias Auto Const mandatory
  ReferenceAlias Property Player Auto Const mandatory
  curve Property ENV_AFFL_FallDamageAfflictionChance Auto Const mandatory
  Message Property ENV_DEBUG_AFFL_Fall_Msg Auto Const mandatory
  sq_env_tutorialquestscript Property SQ_ENV_Tutorial Auto Const mandatory
EndGroup

Group FallData
  Float Property FallDamageThreshold_Small = 0.0 Auto Const
  { anything less than this isn't a fall for  affliction granting }
  Float Property FallDamageThreshold_Medium = 30.0 Auto Const
  { anything between this and FallDamageThreshold_Large is a medium fall }
  Float Property FallDamageThreshold_Large = 60.0 Auto Const
  { anything this or greater is a large fall }
EndGroup

Group DebugTest
  packin Property ENV_Hazard_PK_Vent_Gas_Corrosive Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.RegisterForRemoteEvent(Player.GetActorReference() as ScriptObject, "OnPlayerFallLongDistance") ; #DEBUG_LINE_NO:29
EndEvent

Event Actor.OnPlayerFallLongDistance(Actor akSender, Float afDamage)
  Self.GrantFallingAffliction(afDamage) ; #DEBUG_LINE_NO:34
EndEvent

Function GrantFallingAffliction(Float Damage)
  Int afflictionChance = ENV_AFFL_FallDamageAfflictionChance.GetValueAt(Damage) as Int ; #DEBUG_LINE_NO:40
  Bool dieRollSuccess = Game.GetDieRollSuccess(afflictionChance, 1, 100, -1, -1) ; #DEBUG_LINE_NO:41
  If dieRollSuccess ; #DEBUG_LINE_NO:48
    env_afflictionscript[] appropriateAfflictions = None ; #DEBUG_LINE_NO:49
    sq_env_afflictionsscript SelfAfflictionScript = (Self as Quest) as sq_env_afflictionsscript ; #DEBUG_LINE_NO:50
    If Damage >= FallDamageThreshold_Large ; #DEBUG_LINE_NO:52
      appropriateAfflictions = SelfAfflictionScript.GetFallingAfflictionsLarge() ; #DEBUG_LINE_NO:54
    ElseIf Damage >= FallDamageThreshold_Medium ; #DEBUG_LINE_NO:55
      appropriateAfflictions = SelfAfflictionScript.GetFallingAfflictionsMedium() ; #DEBUG_LINE_NO:57
    ElseIf Damage >= FallDamageThreshold_Small ; #DEBUG_LINE_NO:58
      appropriateAfflictions = SelfAfflictionScript.GetFallingAfflictionsSmall() ; #DEBUG_LINE_NO:60
    EndIf ; #DEBUG_LINE_NO:
    If appropriateAfflictions.Length > 0 ; #DEBUG_LINE_NO:65
      Int I = Utility.RandomInt(0, appropriateAfflictions.Length - 1) ; #DEBUG_LINE_NO:66
      env_afflictionscript randomAppropriateAffliction = appropriateAfflictions[I] ; #DEBUG_LINE_NO:67
      randomAppropriateAffliction.Gain(True, False) ; #DEBUG_LINE_NO:70
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _ReportFall(Float Damage, Int afflictionChance, Bool dieRollSuccess)
  If DebugReportFallOn ; #DEBUG_LINE_NO:77
    Int fallSize = 0 ; #DEBUG_LINE_NO:78
    If Damage >= FallDamageThreshold_Large ; #DEBUG_LINE_NO:80
      fallSize = 3 ; #DEBUG_LINE_NO:81
    ElseIf Damage >= FallDamageThreshold_Medium ; #DEBUG_LINE_NO:82
      fallSize = 2 ; #DEBUG_LINE_NO:83
    ElseIf Damage >= FallDamageThreshold_Small ; #DEBUG_LINE_NO:84
      fallSize = 1 ; #DEBUG_LINE_NO:85
    EndIf ; #DEBUG_LINE_NO:
    ENV_DEBUG_AFFL_Fall_Msg.Show(Damage, fallSize as Float, afflictionChance as Float, dieRollSuccess as Float, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DisplayTextReplacedMessage(Message MessageToDisplay, Form FormWithName)
  ObjectReference tempRef = Game.GetPlayer().PlaceAtMe(FormWithName, 1, False, True, True, None, TextReplacementRefAlias as Alias, True) ; #DEBUG_LINE_NO:96
  MessageToDisplay.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:98
  TextReplacementRefAlias.Clear() ; #DEBUG_LINE_NO:100
  tempRef.Delete() ; #DEBUG_LINE_NO:101
EndFunction

Function TestFallInjuryCurve()
  Self.TestCurve(10.0, 30) ; #DEBUG_LINE_NO:109
EndFunction

Function TestCurve(Float stepSize, Int steps)
  Float[] inputs = new Float[steps] ; #DEBUG_LINE_NO:113
  Int I = 0 ; #DEBUG_LINE_NO:115
  While I < inputs.Length ; #DEBUG_LINE_NO:116
    inputs[I] = I as Float * stepSize ; #DEBUG_LINE_NO:117
    I += 1 ; #DEBUG_LINE_NO:118
  EndWhile ; #DEBUG_LINE_NO:
  Float[] values = ENV_AFFL_FallDamageAfflictionChance.GetValues(inputs) ; #DEBUG_LINE_NO:123
  I = 0 ; #DEBUG_LINE_NO:125
  While I < values.Length ; #DEBUG_LINE_NO:126
    I += 1 ; #DEBUG_LINE_NO:128
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DebugReportFall(Bool On)
  DebugReportFallOn = On ; #DEBUG_LINE_NO:135
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:145
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:149
EndFunction
