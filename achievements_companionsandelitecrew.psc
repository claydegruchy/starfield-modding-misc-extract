ScriptName Achievements_CompanionsAndEliteCrew Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group RecruitedCountAchievement
  RefCollectionAlias Property RecruitedCompanionsAndEliteCrew Auto Const mandatory
  { autofill }
  Int Property CountForAchievement = 10 Auto Const
  Int Property AchievementID_RecruitedCount = 38 Auto Const
EndGroup

Group RelationshipLevelAchievement
  ActorValue Property COM_AffinityLevel Auto Const mandatory
  { autofill }
  Int Property AffinityLevelNeeded = 3 Auto Const
  Int Property AchievementID_MaxRelationshipLevelReached = 39 Auto Const
EndGroup


;-- Functions ---------------------------------------

Function RecruitedCompanionOrEliteCrew(Actor RecruitedActor)
  RecruitedCompanionsAndEliteCrew.AddRef(RecruitedActor as ObjectReference) ; #DEBUG_LINE_NO:24
  If RecruitedCompanionsAndEliteCrew.GetCount() >= CountForAchievement ; #DEBUG_LINE_NO:28
    Game.AddAchievement(AchievementID_RecruitedCount) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function AffinityLevelReached(Actor CompanionActor)
  If CompanionActor.GetValue(COM_AffinityLevel) >= AffinityLevelNeeded as Float ; #DEBUG_LINE_NO:37
    Game.AddAchievement(AchievementID_MaxRelationshipLevelReached) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:47
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:51
EndFunction
