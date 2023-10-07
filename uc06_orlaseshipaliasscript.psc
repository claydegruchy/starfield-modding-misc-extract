ScriptName UC06_OrlaseShipAliasScript Extends ReferenceAlias

;-- Structs -----------------------------------------
Struct HealthDatum
  Int PlayerLevel
  ActorValue TargetValue
  Float UpdatedHealthValue
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC06_OnHitDebugEnabled Auto Const mandatory
{ If this is "1", this script will continually register for hit events, which is a complete waste of processing power }
Int Property PreReqStage = 300 Auto Const
{ If this stage is set and Orlase loads in, update his health }
Int Property ShutdownStage = 550 Auto Const
{ If this stage is set, the Orlase sequence is done, so we don't need to worry about this anymore }
Int Property StageToSet = 301 Auto Const
{ Player triggered the health increase. Set this stage to ensure it doesn't happen again }
uc06_orlaseshipaliasscript:healthdatum[] Property HealthData Auto Const mandatory
{ The list of health number we should set Orlase's ship to. This is based off the numbers for the LShip_CrimsonFleet_Combat_C }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForHitEvent(Self.GetRef() as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:25
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If UC06_OnHitDebugEnabled.GetValue() >= 1.0 ; #DEBUG_LINE_NO:31
    Self.RegisterForHitEvent(Self.GetRef() as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:37
  If !OQ.GetStageDone(StageToSet) && OQ.GetStageDone(PreReqStage) && !OQ.GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:39
    OQ.SetStage(StageToSet) ; #DEBUG_LINE_NO:40
    uc06_orlaseshipaliasscript:healthdatum TargetDatum = Self.UpdateShipHealth() ; #DEBUG_LINE_NO:41
    spaceshipreference myShip = Self.GetShipRef() ; #DEBUG_LINE_NO:43
    myShip.SetValue(TargetDatum.TargetValue, TargetDatum.UpdatedHealthValue) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndEvent

uc06_orlaseshipaliasscript:healthdatum Function UpdateShipHealth()
  Int iPlayerLevel = Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:49
  Int I = 0 ; #DEBUG_LINE_NO:51
  Int iLength = HealthData.Length ; #DEBUG_LINE_NO:52
  uc06_orlaseshipaliasscript:healthdatum TargetDatum = None ; #DEBUG_LINE_NO:53
  While I < iLength ; #DEBUG_LINE_NO:55
    Int iTargetLevel = HealthData[I].PlayerLevel ; #DEBUG_LINE_NO:56
    TargetDatum = HealthData[I] ; #DEBUG_LINE_NO:57
    If iTargetLevel >= iPlayerLevel ; #DEBUG_LINE_NO:59
      Return TargetDatum ; #DEBUG_LINE_NO:60
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:63
  EndWhile ; #DEBUG_LINE_NO:
  Return TargetDatum ; #DEBUG_LINE_NO:66
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:72
EndFunction
