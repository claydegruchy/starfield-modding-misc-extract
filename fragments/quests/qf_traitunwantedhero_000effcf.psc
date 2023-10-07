ScriptName Fragments:Quests:QF_TraitUnwantedHero_000EFFCF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Trait_UH_FollowerGlobal Auto Const mandatory
ReferenceAlias Property Alias_AdoringFan Auto Const mandatory
MiscObject Property ToiletPaperRoll01Empty Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
LeveledItem Property LL_Trait_UH_AdoringFanGift Auto Const mandatory
Perk Property TRAIT_UnwantedHero Auto Const
ReferenceAlias Property Alias_NewAtlantisMarker Auto Const mandatory
ReferenceAlias Property Alias_AkilaCityMarker Auto Const mandatory
ReferenceAlias Property Alias_NeonMarker Auto Const mandatory
Scene Property TraitUnwantedHero_AttackedByPlayer Auto Const mandatory
Int Property FollowPlayerOnStartOdds Auto Const mandatory
Quest Property Trait_UH_SpeechChallengeQuest Auto Const mandatory
ReferenceAlias Property Alias_FanDisplayName Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
Scene Property TraitUnwantedHero_DialogueGreets Auto Const mandatory
Quest Property CREW_EliteCrew_AdoringFan Auto Const
Message Property Trait_UH_WarningMessageEssential Auto Const mandatory
ReferenceAlias Property Alias_NATMarker Auto Const mandatory
GlobalVariable Property Trait_UH_FanClubFee Auto Const mandatory
Faction Property PotentialCrewFaction Auto Const mandatory
GlobalVariable Property Trait_UH_HitGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Trait_UH_SpeechChallengeQuest.Start() ; #DEBUG_LINE_NO:7
  Alias_AdoringFan.GetActorRef().SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_AdoringFan.GetRef().MoveTo(Alias_NewAtlantisMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:16
  Self.SetStage(30) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_01()
  Self.SetStage(4) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0002_Item_00()
  Alias_AdoringFan.GetRef().MoveTo(Alias_NeonMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
  Self.SetStage(30) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0002_Item_01()
  Self.SetStage(4) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0003_Item_00()
  Alias_AdoringFan.GetRef().MoveTo(Alias_AkilaCityMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:50
  Self.SetStage(30) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0003_Item_01()
  Self.SetStage(4) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_AdoringFan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:67
  CREW_EliteCrew_AdoringFan.Start() ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0007_Item_00()
  TraitUnwantedHero_AttackedByPlayer.Start() ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0009_Item_00()
  Game.GetPlayer().AddPerk(TRAIT_UnwantedHero, False) ; #DEBUG_LINE_NO:84
  Game.GetPlayer().MoveTo(Alias_AdoringFan.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0010_Item_00()
  Trait_UH_FollowerGlobal.SetValue(2.0) ; #DEBUG_LINE_NO:93
  CREW_EliteCrew_AdoringFan.SetStage(50) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0011_Item_00()
  Actor FanRef = Alias_AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:105
  Trait_UH_FollowerGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:107
  CREW_EliteCrew_AdoringFan.SetStage(15) ; #DEBUG_LINE_NO:108
  FanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0012_Item_00()
  Trait_UH_FollowerGlobal.SetValue(2.0) ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0013_Item_00()
  Actor FanRef = Alias_AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:125
  SQ_Followers.SetRoleInactive(FanRef, True, False, True) ; #DEBUG_LINE_NO:127
  FanRef.MoveTo(Alias_NewAtlantisMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:128
  FanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:129
  Trait_UH_FollowerGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0014_Item_00()
  Actor FanRef = Alias_AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:139
  SQ_Followers.SetRoleInactive(FanRef, True, False, True) ; #DEBUG_LINE_NO:141
  FanRef.MoveTo(Alias_NeonMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:142
  FanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:143
  Trait_UH_FollowerGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:145
EndFunction

Function Fragment_Stage_0015_Item_00()
  Actor FanRef = Alias_AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:153
  SQ_Followers.SetRoleInactive(FanRef, True, False, True) ; #DEBUG_LINE_NO:155
  FanRef.MoveTo(Alias_AkilaCityMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:156
  FanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:157
  Trait_UH_FollowerGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0016_Item_00()
  Trait_UH_FollowerGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:167
EndFunction

Function Fragment_Stage_0017_Item_00()
  TraitUnwantedHero_DialogueGreets.Start() ; #DEBUG_LINE_NO:175
EndFunction

Function Fragment_Stage_0018_Item_00()
  Trait_UH_HitGlobal.Mod(1.0) ; #DEBUG_LINE_NO:183
EndFunction

Function Fragment_Stage_0020_Item_00()
  Trait_UH_FollowerGlobal.SetValue(2.0) ; #DEBUG_LINE_NO:191
  Actor FanRef = Alias_AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:192
  SQ_Followers.SetRoleActive(FanRef, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:193
  FanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_0020_Item_01()
  Trait_UH_FollowerGlobal.SetValue(2.0) ; #DEBUG_LINE_NO:202
  Actor FanRef = Alias_AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:203
  SQ_Followers.CommandFollow(FanRef) ; #DEBUG_LINE_NO:204
  FanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:205
EndFunction

Function Fragment_Stage_0025_Item_00()
  Trait_UH_FollowerGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:213
  Actor FanRef = Alias_AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:214
  SQ_Followers.CommandWait(FanRef, None) ; #DEBUG_LINE_NO:215
  FanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_0030_Item_00()
  Int random = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:224
  If Self.GetStageDone(5) && random < FollowPlayerOnStartOdds ; #DEBUG_LINE_NO:226
    Trait_UH_FollowerGlobal.SetValue(4.0) ; #DEBUG_LINE_NO:227
  Else ; #DEBUG_LINE_NO:
    Trait_UH_FollowerGlobal.SetValue(3.0) ; #DEBUG_LINE_NO:229
  EndIf ; #DEBUG_LINE_NO:
  Trait_UH_HitGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:233
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().AddItem(LL_Trait_UH_AdoringFanGift as Form, 1, False) ; #DEBUG_LINE_NO:241
EndFunction

Function Fragment_Stage_0050_Item_00()
  Game.GetPlayer().RemovePerk(TRAIT_UnwantedHero) ; #DEBUG_LINE_NO:249
  Alias_FanDisplayName.ForceRefTo(Alias_AdoringFan.GetRef()) ; #DEBUG_LINE_NO:250
  Self.SetStage(11) ; #DEBUG_LINE_NO:251
EndFunction

Function Fragment_Stage_0065_Item_00()
  Trait_UH_WarningMessageEssential.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:259
EndFunction

Function Fragment_Stage_0070_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:267
  PlayerRef.AddItem(ToiletPaperRoll01Empty as Form, 1, False) ; #DEBUG_LINE_NO:269
  PlayerRef.AddItem(Credits as Form, 50, False) ; #DEBUG_LINE_NO:270
EndFunction

Function Fragment_Stage_0075_Item_00()
  Actor FanRef = Alias_AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:278
  FanRef.EnableNoWait(False) ; #DEBUG_LINE_NO:279
  FanRef.SetProtected(True) ; #DEBUG_LINE_NO:280
  FanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:281
  Alias_NATMarker.Clear() ; #DEBUG_LINE_NO:282
EndFunction

Function Fragment_Stage_0085_Item_00()
  Actor FanRef = Alias_AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:290
  FanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:291
EndFunction

Function Fragment_Stage_0666_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:299
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:307
  CREW_EliteCrew_AdoringFan.SetStage(9999) ; #DEBUG_LINE_NO:308
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_AdoringFan.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:316
  CREW_EliteCrew_AdoringFan.Stop() ; #DEBUG_LINE_NO:317
  Trait_UH_SpeechChallengeQuest.Stop() ; #DEBUG_LINE_NO:318
  Self.Stop() ; #DEBUG_LINE_NO:319
EndFunction
