ScriptName MS02Script Extends Quest Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimeFactionCrucible Auto Const mandatory
Faction Property CrucibleFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Faction Property MS02_PragmatistsFaction Auto Const mandatory
Faction Property MS02_BelieversFaction Auto Const mandatory
Faction Property MS02_RenegadesFaction Auto Const mandatory
GlobalVariable Property MS02_CluesCollected Auto Const mandatory
RefCollectionAlias Property Believers Auto Const mandatory
RefCollectionAlias Property Neutral Auto Const mandatory
RefCollectionAlias Property Pragmatists Auto Const mandatory
RefCollectionAlias Property Renegades Auto Const mandatory
RefCollectionAlias Property Everyone Auto Const mandatory
ReferenceAlias Property Amanirenas Auto Const mandatory
ReferenceAlias Property FDR Auto Const mandatory
ReferenceAlias Property GenghisKhan Auto Const mandatory
ReferenceAlias Property AdaLovelace Auto Const mandatory
ReferenceAlias Property AmeliaEarhart Auto Const mandatory
ReferenceAlias Property HH_Holmes Auto Const mandatory
Int Property GenghisDeadStage01 = 1632 Auto Const
Int Property GenghisDeadStage02 = 1730 Auto Const
Int Property AmanirenasDeadStage01 = 1634 Auto Const
Int Property AmanirenasDeadStage02 = 1832 Auto Const
Int Property FDRDeadStage = 1834 Auto Const
Int Property FightingStoppedStage = 1871 Auto Const
Int Property StopOnHitCheckStage = 1873 Auto Const

;-- Functions ---------------------------------------

Int Function CountClues()
  Int nCluesFound = 0 ; #DEBUG_LINE_NO:34
  If Self.GetStageDone(1001) ; #DEBUG_LINE_NO:37
    nCluesFound += 1 ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(1002) ; #DEBUG_LINE_NO:40
    nCluesFound += 1 ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(1003) ; #DEBUG_LINE_NO:43
    nCluesFound += 1 ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(1004) ; #DEBUG_LINE_NO:46
    nCluesFound += 1 ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(1005) ; #DEBUG_LINE_NO:49
    nCluesFound += 1 ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(1006) ; #DEBUG_LINE_NO:52
    nCluesFound += 1 ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(1007) ; #DEBUG_LINE_NO:55
    nCluesFound += 1 ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
  MS02_CluesCollected.SetValue(nCluesFound as Float) ; #DEBUG_LINE_NO:60
  Self.UpdateCurrentInstanceGlobal(MS02_CluesCollected) ; #DEBUG_LINE_NO:61
  Self.SetObjectiveDisplayed(1000, True, True) ; #DEBUG_LINE_NO:62
  If nCluesFound >= 7 ; #DEBUG_LINE_NO:65
    Self.SetStage(1100) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function GoHostile(Actor aTarg)
  aTarg.SetEssential(False) ; #DEBUG_LINE_NO:72
  aTarg.RemoveFromFaction(CrucibleFaction) ; #DEBUG_LINE_NO:73
  aTarg.RemoveFromFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:74
  aTarg.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:75
  aTarg.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:76
  aTarg.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:78
EndFunction

Function RemoveFactions()
  Actor myFDR = FDR.GetActorRef() ; #DEBUG_LINE_NO:83
  Actor myAmani = Amanirenas.GetActorRef() ; #DEBUG_LINE_NO:84
  Actor myGenghis = GenghisKhan.GetActorRef() ; #DEBUG_LINE_NO:85
  Actor myAda = AdaLovelace.GetActorRef() ; #DEBUG_LINE_NO:86
  Actor MyAmelia = AmeliaEarhart.GetActorRef() ; #DEBUG_LINE_NO:87
  Actor myHolmes = HH_Holmes.GetActorRef() ; #DEBUG_LINE_NO:88
  Neutral.RemoveFromFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:90
  Neutral.RemoveFromFaction(CrucibleFaction) ; #DEBUG_LINE_NO:91
  myFDR.RemoveFromFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:93
  myFDR.RemoveFromFaction(CrucibleFaction) ; #DEBUG_LINE_NO:94
  myAmani.RemoveFromFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:95
  myAmani.RemoveFromFaction(CrucibleFaction) ; #DEBUG_LINE_NO:96
  myGenghis.RemoveFromFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:97
  myGenghis.RemoveFromFaction(CrucibleFaction) ; #DEBUG_LINE_NO:98
  myAda.RemoveFromFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:99
  myAda.RemoveFromFaction(CrucibleFaction) ; #DEBUG_LINE_NO:100
  MyAmelia.RemoveFromFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:101
  MyAmelia.RemoveFromFaction(CrucibleFaction) ; #DEBUG_LINE_NO:102
  myHolmes.RemoveFromFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:103
  myHolmes.RemoveFromFaction(CrucibleFaction) ; #DEBUG_LINE_NO:104
  Pragmatists.RemoveFromFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:106
  Pragmatists.RemoveFromFaction(CrucibleFaction) ; #DEBUG_LINE_NO:107
  Believers.RemoveFromFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:108
  Believers.RemoveFromFaction(CrucibleFaction) ; #DEBUG_LINE_NO:109
  Renegades.RemoveFromFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:110
  Renegades.RemoveFromFaction(CrucibleFaction) ; #DEBUG_LINE_NO:111
EndFunction

Function AddEveryone()
  Actor myFDR = FDR.GetActorRef() ; #DEBUG_LINE_NO:116
  Actor myAmani = Amanirenas.GetActorRef() ; #DEBUG_LINE_NO:117
  Actor myGenghis = GenghisKhan.GetActorRef() ; #DEBUG_LINE_NO:118
  Actor myAda = AdaLovelace.GetActorRef() ; #DEBUG_LINE_NO:119
  Actor MyAmelia = AmeliaEarhart.GetActorRef() ; #DEBUG_LINE_NO:120
  Actor myHolmes = HH_Holmes.GetActorRef() ; #DEBUG_LINE_NO:121
  Everyone.AddRef(myFDR as ObjectReference) ; #DEBUG_LINE_NO:123
  Everyone.AddRef(myAmani as ObjectReference) ; #DEBUG_LINE_NO:124
  Everyone.AddRef(myGenghis as ObjectReference) ; #DEBUG_LINE_NO:125
  Everyone.AddRef(myAda as ObjectReference) ; #DEBUG_LINE_NO:126
  Everyone.AddRef(MyAmelia as ObjectReference) ; #DEBUG_LINE_NO:127
  Everyone.AddRef(myHolmes as ObjectReference) ; #DEBUG_LINE_NO:128
  Everyone.AddRefCollection(Pragmatists) ; #DEBUG_LINE_NO:129
  Everyone.AddRefCollection(Believers) ; #DEBUG_LINE_NO:130
  Everyone.AddRefCollection(Renegades) ; #DEBUG_LINE_NO:131
  Everyone.AddRefCollection(Neutral) ; #DEBUG_LINE_NO:132
EndFunction

Function EveryoneStopFighting()
  Actor myFDR = FDR.GetActorRef() ; #DEBUG_LINE_NO:137
  Actor myAmani = Amanirenas.GetActorRef() ; #DEBUG_LINE_NO:138
  Actor myGenghis = GenghisKhan.GetActorRef() ; #DEBUG_LINE_NO:139
  Self.AddEveryone() ; #DEBUG_LINE_NO:141
  Everyone.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:143
  MS02_RenegadesFaction.SetEnemy(MS02_PragmatistsFaction, True, True) ; #DEBUG_LINE_NO:146
  MS02_RenegadesFaction.SetEnemy(MS02_BelieversFaction, True, True) ; #DEBUG_LINE_NO:147
  MS02_PragmatistsFaction.SetEnemy(MS02_RenegadesFaction, True, True) ; #DEBUG_LINE_NO:149
  MS02_PragmatistsFaction.SetEnemy(MS02_BelieversFaction, True, True) ; #DEBUG_LINE_NO:150
  MS02_BelieversFaction.SetEnemy(MS02_PragmatistsFaction, True, True) ; #DEBUG_LINE_NO:152
  MS02_BelieversFaction.SetEnemy(MS02_RenegadesFaction, True, True) ; #DEBUG_LINE_NO:153
  MS02_RenegadesFaction.SetAlly(MS02_PragmatistsFaction, False, False) ; #DEBUG_LINE_NO:155
  MS02_RenegadesFaction.SetAlly(MS02_BelieversFaction, False, False) ; #DEBUG_LINE_NO:156
  MS02_PragmatistsFaction.SetAlly(MS02_RenegadesFaction, False, False) ; #DEBUG_LINE_NO:158
  MS02_PragmatistsFaction.SetAlly(MS02_BelieversFaction, False, False) ; #DEBUG_LINE_NO:159
  MS02_BelieversFaction.SetAlly(MS02_PragmatistsFaction, False, False) ; #DEBUG_LINE_NO:161
  MS02_BelieversFaction.SetAlly(MS02_RenegadesFaction, False, False) ; #DEBUG_LINE_NO:162
  Everyone.EvaluateAll() ; #DEBUG_LINE_NO:164
  myFDR.RemoveFromFaction(MS02_PragmatistsFaction) ; #DEBUG_LINE_NO:167
  Pragmatists.RemoveFromFaction(MS02_PragmatistsFaction) ; #DEBUG_LINE_NO:168
  myAmani.RemoveFromFaction(MS02_BelieversFaction) ; #DEBUG_LINE_NO:170
  Believers.RemoveFromFaction(MS02_BelieversFaction) ; #DEBUG_LINE_NO:171
  myGenghis.RemoveFromFaction(MS02_RenegadesFaction) ; #DEBUG_LINE_NO:173
  Renegades.RemoveFromFaction(MS02_RenegadesFaction) ; #DEBUG_LINE_NO:174
  Everyone.StopCombatAlarm() ; #DEBUG_LINE_NO:176
  Everyone.StopCombat() ; #DEBUG_LINE_NO:177
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:180
  Self.SetStage(FightingStoppedStage) ; #DEBUG_LINE_NO:182
  Everyone.EvaluateAll() ; #DEBUG_LINE_NO:183
EndFunction

Function ResetBaseFactions()
  Self.SetStage(StopOnHitCheckStage) ; #DEBUG_LINE_NO:188
  Actor myFDR = FDR.GetActorRef() ; #DEBUG_LINE_NO:189
  Actor myAmani = Amanirenas.GetActorRef() ; #DEBUG_LINE_NO:190
  Actor myGenghis = GenghisKhan.GetActorRef() ; #DEBUG_LINE_NO:191
  Actor myAda = AdaLovelace.GetActorRef() ; #DEBUG_LINE_NO:192
  Actor MyAmelia = AmeliaEarhart.GetActorRef() ; #DEBUG_LINE_NO:193
  Actor myHolmes = HH_Holmes.GetActorRef() ; #DEBUG_LINE_NO:194
  myFDR.AddToFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:196
  myFDR.AddToFaction(CrucibleFaction) ; #DEBUG_LINE_NO:197
  myAmani.AddToFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:199
  myAmani.AddToFaction(CrucibleFaction) ; #DEBUG_LINE_NO:200
  myGenghis.AddToFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:202
  myGenghis.AddToFaction(CrucibleFaction) ; #DEBUG_LINE_NO:203
  myAda.AddToFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:205
  myAda.AddToFaction(CrucibleFaction) ; #DEBUG_LINE_NO:206
  MyAmelia.AddToFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:208
  MyAmelia.AddToFaction(CrucibleFaction) ; #DEBUG_LINE_NO:209
  myHolmes.AddToFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:211
  myHolmes.AddToFaction(CrucibleFaction) ; #DEBUG_LINE_NO:212
  Pragmatists.AddToFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:214
  Pragmatists.AddToFaction(CrucibleFaction) ; #DEBUG_LINE_NO:215
  Believers.AddToFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:217
  Believers.AddToFaction(CrucibleFaction) ; #DEBUG_LINE_NO:218
  Renegades.AddToFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:220
  Renegades.AddToFaction(CrucibleFaction) ; #DEBUG_LINE_NO:221
  Neutral.AddToFaction(CrimeFactionCrucible) ; #DEBUG_LINE_NO:223
  Neutral.AddToFaction(CrucibleFaction) ; #DEBUG_LINE_NO:224
  Everyone.EvaluateAll() ; #DEBUG_LINE_NO:227
  Everyone.RemoveAll() ; #DEBUG_LINE_NO:228
EndFunction
