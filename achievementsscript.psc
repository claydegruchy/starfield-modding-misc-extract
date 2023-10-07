ScriptName AchievementsScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct StatAchievement
  String StatName
  { Name of the stat }
  Int Threshold
  { If the stat is equal to or greater than this, unlock the achievement }
  Int AchievementNumber
  { The achievement to unlock }
EndStruct


;-- Variables ---------------------------------------
Bool bCraftedItemsAwarded
Bool bFutureRetro
Bool initialized
Int nBobbleHead01 = 10 Const
Int nBobbleHead02 = 20 Const
Int nCraftedItems = 100 Const
Int nCurrentChems
Int nCurrentFood
String sBobbleheadsCollectedStat = "Bobbleheads Collected" Const
String sChemsCraftedStat = "Chems Crafted" Const
String sFoodCookedStat = "Food Cooked" Const

;-- Properties --------------------------------------
achievementsscript:statachievement[] Property StatAchievements Auto Const mandatory
{ All the simple "stat is equal or larger than x" achivements - must be unique stats and not overlap with future retro or other achivements }
String[] Property FutureRetroStats Auto Const mandatory
{ All the stats that will trigger the future retro achivement - must be unique stats and not overlap with other achivements }
Int Property nNumberOfCompanions Auto conditional hidden
Int Property nGiantsKilled Auto conditional hidden

;-- Functions ---------------------------------------

Function InitializeQuest()
  If initialized ; #DEBUG_LINE_NO:25
    Return  ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterEvents() ; #DEBUG_LINE_NO:29
  initialized = True ; #DEBUG_LINE_NO:33
EndFunction

Function RegisterEvents()
  Int index = 0 ; #DEBUG_LINE_NO:58
  While index < StatAchievements.Length ; #DEBUG_LINE_NO:59
    achievementsscript:statachievement curAchivement = StatAchievements[index] ; #DEBUG_LINE_NO:60
    Self.RegisterForTrackedStatsEvent(curAchivement.StatName, curAchivement.Threshold) ; #DEBUG_LINE_NO:61
    index += 1 ; #DEBUG_LINE_NO:62
  EndWhile ; #DEBUG_LINE_NO:
  index = 0 ; #DEBUG_LINE_NO:64
  While index < FutureRetroStats.Length ; #DEBUG_LINE_NO:65
    Self.RegisterForTrackedStatsEvent(FutureRetroStats[index], 1) ; #DEBUG_LINE_NO:67
    index += 1 ; #DEBUG_LINE_NO:68
  EndWhile ; #DEBUG_LINE_NO:
  Self.RegisterForTrackedStatsEvent(sChemsCraftedStat, 1) ; #DEBUG_LINE_NO:80
  Self.RegisterForTrackedStatsEvent(sFoodCookedStat, 1) ; #DEBUG_LINE_NO:81
  Self.RegisterForTrackedStatsEvent(sBobbleheadsCollectedStat, nBobbleHead01) ; #DEBUG_LINE_NO:85
EndFunction

Function UnregisterFutureRetroEvents()
  Int index = 0 ; #DEBUG_LINE_NO:90
  While index < FutureRetroStats.Length ; #DEBUG_LINE_NO:91
    Self.UnregisterForTrackedStatsEvent(FutureRetroStats[index]) ; #DEBUG_LINE_NO:92
    index += 1 ; #DEBUG_LINE_NO:93
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnTrackedStatsEvent(String statFilter, Int statValue)
  Bool handled = Self.HandleBasicStat(statFilter) ; #DEBUG_LINE_NO:104
  handled = handled || Self.HandleRetroStat(statFilter) ; #DEBUG_LINE_NO:105
  handled = handled || Self.HandleCraftedStat(statFilter, statValue) ; #DEBUG_LINE_NO:106
  handled = handled || Self.HandleBobbleheadStat(statFilter, statValue) ; #DEBUG_LINE_NO:107
EndEvent

Bool Function HandleBasicStat(String statFilter)
  Int achievementIndex = StatAchievements.findstruct("StatName", statFilter, 0) ; #DEBUG_LINE_NO:113
  If achievementIndex >= 0 ; #DEBUG_LINE_NO:114
    Game.AddAchievement(StatAchievements[achievementIndex].AchievementNumber) ; #DEBUG_LINE_NO:115
    Return True ; #DEBUG_LINE_NO:116
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function HandleRetroStat(String statFilter)
  Int achievementIndex = FutureRetroStats.find(statFilter, 0) ; #DEBUG_LINE_NO:125
  If achievementIndex >= 0 ; #DEBUG_LINE_NO:126
    If !bFutureRetro ; #DEBUG_LINE_NO:127
      bFutureRetro = True ; #DEBUG_LINE_NO:128
      Game.AddAchievement(35) ; #DEBUG_LINE_NO:129
      Self.UnregisterFutureRetroEvents() ; #DEBUG_LINE_NO:130
    EndIf ; #DEBUG_LINE_NO:
    Return True ; #DEBUG_LINE_NO:132
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function HandleCraftedStat(String statFilter, Int statValue)
  If statFilter == sChemsCraftedStat ; #DEBUG_LINE_NO:141
    nCurrentChems = statValue ; #DEBUG_LINE_NO:142
    Self.UpdateCraftedAchievement(sChemsCraftedStat, nCurrentChems) ; #DEBUG_LINE_NO:143
    Return True ; #DEBUG_LINE_NO:144
  ElseIf statFilter == sFoodCookedStat ; #DEBUG_LINE_NO:145
    nCurrentFood = statValue ; #DEBUG_LINE_NO:146
    Self.UpdateCraftedAchievement(sFoodCookedStat, nCurrentFood) ; #DEBUG_LINE_NO:147
    Return True ; #DEBUG_LINE_NO:148
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UpdateCraftedAchievement(String statFilter, Int currentValue)
  If !bCraftedItemsAwarded ; #DEBUG_LINE_NO:157
    If nCurrentChems + nCurrentFood >= nCraftedItems ; #DEBUG_LINE_NO:158
      bCraftedItemsAwarded = True ; #DEBUG_LINE_NO:159
      Game.AddAchievement(31) ; #DEBUG_LINE_NO:160
      Self.UnregisterForTrackedStatsEvent(sChemsCraftedStat) ; #DEBUG_LINE_NO:162
      Self.UnregisterForTrackedStatsEvent(sFoodCookedStat) ; #DEBUG_LINE_NO:163
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForTrackedStatsEvent(statFilter, currentValue + 1) ; #DEBUG_LINE_NO:166
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function HandleBobbleheadStat(String statFilter, Int statValue)
  If statFilter == sBobbleheadsCollectedStat ; #DEBUG_LINE_NO:174
    Game.AddAchievement(44) ; #DEBUG_LINE_NO:176
    If statValue >= nBobbleHead02 ; #DEBUG_LINE_NO:178
      Game.AddAchievement(45) ; #DEBUG_LINE_NO:179
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForTrackedStatsEvent(sBobbleheadsCollectedStat, nBobbleHead02) ; #DEBUG_LINE_NO:182
    EndIf ; #DEBUG_LINE_NO:
    Return True ; #DEBUG_LINE_NO:184
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:186
  EndIf ; #DEBUG_LINE_NO:
EndFunction
