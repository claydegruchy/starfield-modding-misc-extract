ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Suspic_00112864 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property IsaacStrum Auto Const
ReferenceAlias Property LouisKing Auto Const
Faction Property PlayerEnemyFaction Auto Const
ReferenceAlias Property KarsonEndler Auto Const
MiscObject Property Credits Auto Const
Scene Property LoopingThievesScene Auto Const
Scene Property Post20ThiefLoopScene Auto Const
GlobalVariable Property City_NA_Z_SuspiciousGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  IsaacStrum.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:8
  LouisKing.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:9
  KarsonEndler.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0001_Item_00()
  IsaacStrum.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:18
  LouisKing.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:19
  KarsonEndler.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:28
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:37
  Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:38
  LoopingThievesScene.Stop() ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:49
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:50
  Post20ThiefLoopScene.Start() ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:59
  Self.SetObjectiveDisplayed(35, True, False) ; #DEBUG_LINE_NO:60
  IsaacStrum.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:62
  LouisKing.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:71
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:72
  Self.SetObjectiveDisplayedAtTop(35) ; #DEBUG_LINE_NO:73
  IsaacStrum.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:75
  LouisKing.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveFailed(35, True) ; #DEBUG_LINE_NO:84
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:85
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:86
  IsaacStrum.GetActorRef().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:91
  LouisKing.GetActorRef().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:92
  IsaacStrum.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:94
  LouisKing.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(40, False, False) ; #DEBUG_LINE_NO:103
  Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:104
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:105
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:106
  Self.SetStage(55) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_0055_Item_00()
  KarsonEndler.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:116
  Self.SetStage(70) ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0057_Item_00()
  IsaacStrum.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:126
  LouisKing.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:127
  Post20ThiefLoopScene.Stop() ; #DEBUG_LINE_NO:128
  IsaacStrum.GetActorRef().SetEssential(True) ; #DEBUG_LINE_NO:131
  LouisKing.GetActorRef().SetEssential(True) ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:140
  Self.SetObjectiveFailed(35, True) ; #DEBUG_LINE_NO:141
  Self.SetStage(70) ; #DEBUG_LINE_NO:142
EndFunction

Function Fragment_Stage_0065_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, City_NA_Z_SuspiciousGlobal.GetValueInt(), False) ; #DEBUG_LINE_NO:150
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:151
  Self.SetObjectiveFailed(35, True) ; #DEBUG_LINE_NO:152
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:153
  IsaacStrum.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:155
  LouisKing.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:156
  Self.SetStage(70) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:167
EndFunction

Function Fragment_Stage_0900_Item_00()
  IsaacStrum.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:175
  LouisKing.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:176
  KarsonEndler.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:177
  Self.Stop() ; #DEBUG_LINE_NO:178
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:186
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:194
  KarsonEndler.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:195
  Self.Stop() ; #DEBUG_LINE_NO:196
EndFunction
