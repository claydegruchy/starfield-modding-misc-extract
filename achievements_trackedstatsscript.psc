ScriptName Achievements_TrackedStatsScript Extends Quest Const
{ Track player stats for awarding achievements }

;-- Structs -----------------------------------------
Struct ChallengeAchievement
  challenge AchievementChallenge
  { Challenge to trigger }
  Int AchievementNumber
  { The achievement to unlock }
EndStruct

Struct StatsAchievement
  String statString
  { Stat to use for achievement }
  Int statCount
  { how many times required to get the achievement? }
  Int AchievementNumber
  { The achievement to unlock }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
achievements_trackedstatsscript:statsachievement[] Property StatsAchievements Auto Const mandatory
{ All activity based achievements defined via tracked stat events }
achievements_trackedstatsscript:challengeachievement[] Property ChallengeAchievements Auto Const mandatory
{ All activity based achievements defined via Challenge forms }

;-- Functions ---------------------------------------

Function RegisterTrackedStats()
  Int I = 0 ; #DEBUG_LINE_NO:31
  While I < StatsAchievements.Length ; #DEBUG_LINE_NO:32
    achievements_trackedstatsscript:statsachievement theStatAchievement = StatsAchievements[I] ; #DEBUG_LINE_NO:33
    Self.RegisterForTrackedStatsEvent(theStatAchievement.statString, theStatAchievement.statCount) ; #DEBUG_LINE_NO:34
    I += 1 ; #DEBUG_LINE_NO:35
  EndWhile ; #DEBUG_LINE_NO:
  Self.RegisterForChallengeEvents() ; #DEBUG_LINE_NO:38
  Int index = 0 ; #DEBUG_LINE_NO:41
  While index < ChallengeAchievements.Length ; #DEBUG_LINE_NO:42
    ChallengeAchievements[index].AchievementChallenge.StartPlayerChallenge() ; #DEBUG_LINE_NO:43
    index += 1 ; #DEBUG_LINE_NO:44
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnTrackedStatsEvent(String asStatFilter, Int aiStatValue)
  Int statsAchievementsIndex = StatsAchievements.findstruct("statString", asStatFilter, 0) ; #DEBUG_LINE_NO:50
  While statsAchievementsIndex > -1 ; #DEBUG_LINE_NO:51
    achievements_trackedstatsscript:statsachievement theStatAchievement = StatsAchievements[statsAchievementsIndex] ; #DEBUG_LINE_NO:52
    If theStatAchievement.statCount <= aiStatValue ; #DEBUG_LINE_NO:55
      Game.AddAchievement(theStatAchievement.AchievementNumber) ; #DEBUG_LINE_NO:56
    EndIf ; #DEBUG_LINE_NO:
    statsAchievementsIndex = StatsAchievements.findstruct("statString", asStatFilter, statsAchievementsIndex + 1) ; #DEBUG_LINE_NO:60
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnChallengeCompleted(ObjectReference akOwner, challenge akChallenge)
  If akOwner == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:65
    Int index = ChallengeAchievements.findstruct("AchievementChallenge", akChallenge, 0) ; #DEBUG_LINE_NO:66
    If index >= 0 ; #DEBUG_LINE_NO:67
      Game.AddAchievement(ChallengeAchievements[index].AchievementNumber) ; #DEBUG_LINE_NO:68
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
