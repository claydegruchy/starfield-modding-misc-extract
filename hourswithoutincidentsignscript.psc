ScriptName HoursWithoutIncidentSignScript Extends ObjectReference Const

;-- Variables ---------------------------------------
Int iOneHourTimerID = 1 Const

;-- Properties --------------------------------------
ActorValue Property Variable09 Auto Const mandatory
{ use this AV to track last time we rolled for an incident }
ActorValue Property Variable10 Auto Const mandatory
{ use this AV to track elapsed time since "last incident" }
Int Property incidentChancePerInterval = 10 Auto Const
{ for each elapsed day, this is the chance for an incident }
Float Property incidentRollInterval = 0.5 Auto Const
{ interval in days per roll }
Float Property maxTimeSinceIncident = 999.0 Auto Const
Float Property minTimeSinceIncident = 0.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.ResetSign() ; #DEBUG_LINE_NO:21
  Self.StartTimerGameTime(1.0, iOneHourTimerID) ; #DEBUG_LINE_NO:22
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerAssaultActor") ; #DEBUG_LINE_NO:23
EndEvent

Event OnUnload()
  Self.CancelTimerGameTime(iOneHourTimerID) ; #DEBUG_LINE_NO:27
  Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerAssaultActor") ; #DEBUG_LINE_NO:28
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  Self.ResetSign() ; #DEBUG_LINE_NO:32
  Self.StartTimerGameTime(1.0, iOneHourTimerID) ; #DEBUG_LINE_NO:33
EndEvent

Event Actor.OnPlayerAssaultActor(Actor akSource, ObjectReference akVictim, Location akLocation, Bool aeCrime)
  If aeCrime ; #DEBUG_LINE_NO:38
    Self.SetValue(Variable10, Utility.GetCurrentGameTime()) ; #DEBUG_LINE_NO:40
    Self.ResetSign() ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ResetSign()
  Float currentTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:47
  Float elapsedTimeSinceRoll = currentTime - Self.GetValue(Variable09) ; #DEBUG_LINE_NO:48
  Bool incidentHappened = False ; #DEBUG_LINE_NO:50
  While elapsedTimeSinceRoll > 0.0 && incidentHappened == False ; #DEBUG_LINE_NO:51
    incidentHappened = Game.GetDieRollSuccess(incidentChancePerInterval, 1, 100, -1, -1) ; #DEBUG_LINE_NO:52
    elapsedTimeSinceRoll -= incidentRollInterval ; #DEBUG_LINE_NO:53
  EndWhile ; #DEBUG_LINE_NO:
  If incidentHappened ; #DEBUG_LINE_NO:56
    Float lastIncident = currentTime - elapsedTimeSinceRoll - incidentRollInterval ; #DEBUG_LINE_NO:58
    Self.SetValue(Variable10, lastIncident) ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
  Float timeSinceIncident = currentTime - Self.GetValue(Variable10) ; #DEBUG_LINE_NO:63
  timeSinceIncident = Math.Min(timeSinceIncident * 24.0, maxTimeSinceIncident) ; #DEBUG_LINE_NO:67
  timeSinceIncident = Math.Max(timeSinceIncident, minTimeSinceIncident) ; #DEBUG_LINE_NO:68
  Float currentPosition = timeSinceIncident / maxTimeSinceIncident ; #DEBUG_LINE_NO:70
  Self.SetAnimationVariableFloat("currentPosition", currentPosition) ; #DEBUG_LINE_NO:73
  Self.SetValue(Variable09, currentTime) ; #DEBUG_LINE_NO:76
EndFunction
