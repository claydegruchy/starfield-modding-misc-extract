ScriptName EliteCrewCrimeResponseScript Extends CompanionCrimeResponseScript
{ ***REMINDER
all actors with this script MUST have their own "personal crime faction" faction that has a shared crime faction list of factions they consider "civilians" }

;-- Variables ---------------------------------------
Int GameTimerID_CrewAnger = 200 Const
Float TimerDur_CrewAngerTime = 6.0 Const

;-- Properties --------------------------------------
Group Autofill
  sq_crewscript Property SQ_Crew Auto Const mandatory
  Message Property EliteCrew_Angry_Message Auto Const mandatory
EndGroup

ActorValue Property CREW_Elite_IsAngry Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTimerGameTime(Int aiTimerID)
  Parent.OnTimerGameTime(aiTimerID) ; #DEBUG_LINE_NO:19
  If aiTimerID == GameTimerID_CrewAnger ; #DEBUG_LINE_NO:21
    Self.SetValue(CREW_Elite_IsAngry, 0.0) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Parent.OnActivate(akActionRef) ; #DEBUG_LINE_NO:27
  If (akActionRef == Game.GetPlayer() as ObjectReference) && Self.GetValue(CREW_Elite_IsAngry) as Bool ; #DEBUG_LINE_NO:29
    SQ_Crew.ShowTextReplacedMessage(Self as Actor, EliteCrew_Angry_Message, False, None, 0.0, 0.0) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function AmIAngry()
  Bool returnVal = Self.GetValue(CREW_Elite_IsAngry) == 1.0 ; #DEBUG_LINE_NO:37
  Return returnVal ; #DEBUG_LINE_NO:41
EndFunction

Function CivilianKilled(Actor CivilianActor)
  AffinityEventOnKill.Send(CivilianActor as ObjectReference) ; #DEBUG_LINE_NO:47
  Self.AutoDismiss() ; #DEBUG_LINE_NO:48
EndFunction

Function AutoDismiss()
  If SQ_Crew.IsActiveEliteCrew(Self as Actor) ; #DEBUG_LINE_NO:54
    Self.MakeAngry() ; #DEBUG_LINE_NO:55
    SQ_Crew.SetEliteCrewInactive(Self as Actor, False) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MakeAngry()
  Self.SetValue(CREW_Elite_IsAngry, 1.0) ; #DEBUG_LINE_NO:62
  Self.StartTimerGameTime(TimerDur_CrewAngerTime, GameTimerID_CrewAnger) ; #DEBUG_LINE_NO:63
EndFunction
