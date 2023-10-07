ScriptName Crew_RecruitQuestScript Extends Quest hidden
{ Used by extending scripts to set hire prices and hired states on actors.
***This script not intended to be used directly. Extending scripts must set CrewMemberRef before calling these functions.*** }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  sq_crewscript Property SQ_Crew Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
  GlobalVariable Property Crew_RecruitCost_TextReplacementValue Auto Const mandatory
  { this will hold the current value of what the player needs to pay to recruit for text replacement and condition functions
***IMPORTANT!***: Also add this to Text Display Variables on Quest Data Tab }
  ActorValue Property Crew_HireSpeechChallengeAttempted Auto Const mandatory
EndGroup

Group Properties
  ReferenceAlias Property Alias_CrewMember Auto Const mandatory
  ReferenceAlias Property playerShip Auto Const
  Perk Property Trait_Taskmaster Auto Const
  Float Property CostMult_Taskmaster = 2.0 Auto Const
EndGroup

Actor Property CrewMemberRef Auto hidden

;-- Functions ---------------------------------------

Function SpeechChallengeAttempted()
  If CrewMemberRef ; #DEBUG_LINE_NO:25
    CrewMemberRef.SetValue(Crew_HireSpeechChallengeAttempted, 1.0) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UpdateCost()
  If CrewMemberRef ; #DEBUG_LINE_NO:35
    Int cost = SQ_Crew.GetRecruitCost(CrewMemberRef) ; #DEBUG_LINE_NO:36
    Crew_RecruitCost_TextReplacementValue.SetValue(cost as Float) ; #DEBUG_LINE_NO:39
    Self.UpdateCurrentInstanceGlobal(Crew_RecruitCost_TextReplacementValue) ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetCostMultAndUpdateCost(Float Mult)
  If CrewMemberRef ; #DEBUG_LINE_NO:49
    SQ_Crew.SetRecruitCostMult(CrewMemberRef, Mult) ; #DEBUG_LINE_NO:50
    Self.UpdateCost() ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Recruited()
  If CrewMemberRef ; #DEBUG_LINE_NO:59
    If CrewMemberRef.IsInFaction(SQ_Crew.AvailableCrewFaction) == False ; #DEBUG_LINE_NO:61
      Int cost = SQ_Crew.GetRecruitCost(CrewMemberRef) ; #DEBUG_LINE_NO:62
      MiscObject credits = Game.GetCredits() ; #DEBUG_LINE_NO:63
      Game.GetPlayer().RemoveItem(credits as Form, cost, False, None) ; #DEBUG_LINE_NO:66
    EndIf ; #DEBUG_LINE_NO:
    SQ_Crew.SetRoleAvailable(CrewMemberRef, True) ; #DEBUG_LINE_NO:69
    CrewMemberRef.ShowCrewAssign(True) ; #DEBUG_LINE_NO:71
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RecruitedUnasssigned()
  spaceshipreference ShipRef = playerShip.GetShipRef() ; #DEBUG_LINE_NO:79
  ShipRef.AssignCrew(CrewMemberRef) ; #DEBUG_LINE_NO:80
  ShipRef.UnassignCrew(CrewMemberRef) ; #DEBUG_LINE_NO:81
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:88
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:92
EndFunction
