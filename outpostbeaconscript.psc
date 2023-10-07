ScriptName OutpostBeaconScript Extends ObjectReference Const

;-- Variables ---------------------------------------
Bool bShowNormalTrace = True Const
Float fAttackTimerMaxSeconds = 48.0 Const
Float fAttackTimerMinSeconds = 12.0 Const
Int iCheckForAttackTimerID = 1 Const

;-- Properties --------------------------------------
Group outpostAttacks
  sq_parentscript Property SQ_Parent Auto Const mandatory
  { holds outpost attack data/functions }
  Bool Property AllowAttacks = True Auto conditional Const
  { set to FALSE to prevent ALL random attacks }
EndGroup

sq_crewscript Property SQ_Crew Auto Const mandatory
{ to handle crew assign/dismiss events }
outposttutorialscript Property OutpostTutorial Auto Const mandatory
{ handle outpost tutorial events }
companionaffinityeventsscript Property SQ_Companions Auto Const mandatory
{ to handle companions responding to things the player builds }
ActorValue Property OutpostSurveyBoost Auto Const mandatory
{ actor value to flag when an outpost has reported a planet survey boost }
Message Property OutpostSurveyBoostMessage Auto Const mandatory
{ message first time player returns to outpost after fully surveying planet }
Keyword Property LocTypeOutpost Auto Const mandatory
{ make sure outpost locations have this keyword }

;-- Functions ---------------------------------------

Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  SQ_Crew.HandleOnCrewAssigned(akCrew, Self as ObjectReference) ; #DEBUG_LINE_NO:37
EndEvent

Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)
  SQ_Crew.HandleOnCrewDismissed(akCrew, Self as ObjectReference) ; #DEBUG_LINE_NO:43
EndEvent

Event OnUnload()
  SQ_Crew.HandleCrewGoingHomeUnloaded(SQ_Crew.CrewGoingToOutposts) ; #DEBUG_LINE_NO:49
EndEvent

Event OnLoad()
  Self.GetCurrentLocation().AddKeyword(LocTypeOutpost) ; #DEBUG_LINE_NO:55
  SQ_Crew.HandleCrewGoingHomeUnloaded(SQ_Crew.CrewGoingToOutposts) ; #DEBUG_LINE_NO:58
  If Self.GetValue(OutpostSurveyBoost) == 0.0 && Self.GetCurrentPlanet().GetSurveyPercent() >= 1.0 ; #DEBUG_LINE_NO:59
    Self.SetValue(OutpostSurveyBoost, 1.0) ; #DEBUG_LINE_NO:60
    OutpostSurveyBoostMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:61
  EndIf ; #DEBUG_LINE_NO:
  Self.StartAttackTimer() ; #DEBUG_LINE_NO:64
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  SQ_Companions.OutpostObjectPlaced(akReference) ; #DEBUG_LINE_NO:69
  resource[] resources = akReference.GetValueResources() ; #DEBUG_LINE_NO:70
  If resources ; #DEBUG_LINE_NO:72
    Self.StartAttackTimer() ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopMode(Bool aStart)
  If aStart && OutpostTutorial.IsRunning() ; #DEBUG_LINE_NO:79
    OutpostTutorial.EnterWorkshopMenu(Self as ObjectReference) ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartAttackTimer()
  Float checkForAttackTime = Utility.RandomFloat(fAttackTimerMinSeconds, fAttackTimerMaxSeconds) ; #DEBUG_LINE_NO:85
  Self.StartTimer(checkForAttackTime, iCheckForAttackTimerID) ; #DEBUG_LINE_NO:87
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iCheckForAttackTimerID ; #DEBUG_LINE_NO:91
    SQ_Parent.CheckForAttack(Self, False, 0, 0.0) ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:100
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:104
EndFunction
