ScriptName MQ305Script Extends Quest conditional

;-- Structs -----------------------------------------
Struct PlayerKnowledgeStruct
  GlobalVariable PlayerKnowledgeGlobal
  ActorValue PlayerKnowledgeAV
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
inputenablelayer Property MQ305EnableLayer Auto hidden
ActorValue Property PlayerUnityTimesEntered Auto Const mandatory
ActorValue Property COM_IsRomantic Auto Const mandatory
ReferenceAlias Property Andreja Auto Const mandatory
ReferenceAlias Property Barrett Auto Const mandatory
ReferenceAlias Property SamCoe Auto Const mandatory
ReferenceAlias Property SarahMorgan Auto Const mandatory
ReferenceAlias Property CoraCoe Auto Const mandatory
ReferenceAlias Property Vasco Auto Const mandatory
Int Property MQ305_MultiRomance_var Auto conditional
Int Property MQ305_FriendTalkCount_var = 9 Auto conditional
Int Property MQ305_AllFriendsTalkedStage = 50 Auto Const
Int Property AllArtifactsObtainedStage = 20 Auto Const
Int Property ArmillaryPlacedStage = 30 Auto Const
Int Property ArmillaryCompleteStage = 40 Auto Const
Int Property WentToUnityOnceStage = 100 Auto Const
Int Property PlaceArmillaryObj = 30 Auto Const
Int Property PowerUpGravObj = 60 Auto Const
Int Property RemoveArmillaryObj = 70 Auto Const
ObjectReference Property UnityMovetoMarker Auto Const mandatory
ActorValue Property MQ305JumpedToUnity Auto Const mandatory
LocationAlias Property PlayerShipInteriorLocation Auto Const mandatory
Faction Property AvailableCompanionFaction Auto Const mandatory
mq305script:playerknowledgestruct[] Property PlayerKnowledgeArray Auto Const
ObjectReference Property MQ305EndingMarkerAndreja Auto Const mandatory
ObjectReference Property MQ305EndingMarkerBarrett Auto Const mandatory
ObjectReference Property MQ305EndingMarkerSamCoe Auto Const mandatory
ObjectReference Property MQ305EndingMarkerSarahMorgan Auto Const mandatory
Quest Property SQ_ENV Auto Const mandatory
GlobalVariable Property MQ302_SidedWithChoice Auto Const mandatory
GlobalVariable Property MQ305_CF_SysDefEnding Auto Const mandatory
GlobalVariable Property MQ305_CF_PirateEnding Auto Const mandatory
ObjectReference Property MQ305EndingMarkerEmissary Auto Const mandatory
ObjectReference Property Mq305EndingMarkerHunter Auto Const mandatory
ObjectReference Property MQ305EndingMarkerNeither Auto Const mandatory
ObjectReference Property MQ305EndingMarkerCF_SysDef Auto Const mandatory
ObjectReference Property MQ305EndingMarkerCF_Delgado Auto Const mandatory
GlobalVariable Property MQ305_FSC_RonHopeKilled Auto Const mandatory
GlobalVariable Property MQ305_FSC_RonHopeBribeAccepted Auto Const mandatory
GlobalVariable Property MQ305_FSC_RonHopeJailed Auto Const mandatory
ObjectReference Property MQ305EndingMarkerFSC_HopeDead Auto Const mandatory
ObjectReference Property MQ305EndingMarkerFSC_HopeNotDead Auto Const mandatory
ObjectReference Property MQ305EndingMarkerFSC_HopeLetGo Auto Const mandatory
GlobalVariable Property MQ305_RI_NeuroampPromoted Auto Const mandatory
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
GlobalVariable Property MQ305_RI_NeuroampNotPromoted Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp_Masako Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp_Ularu Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp_Masako Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp_Ularu Auto Const mandatory
ObjectReference Property MQ305EndingMarkerConstellation Auto Const mandatory
GlobalVariable Property MQ305_UC_PlagueEnding Auto Const mandatory
GlobalVariable Property MQ305_UC_AcelesEnding Auto Const mandatory
GlobalVariable Property MQ305_UC_SterilizationEnding Auto Const mandatory
ObjectReference Property MQ305EndingMarkerUC_Terrormorph Auto Const mandatory
ObjectReference Property MQ305EndingMarkerUC_Aceles Auto Const mandatory
wwiseevent Property WwiseEvent_QST_PlayerEntersUnityA Auto Const mandatory
Idle Property IdleArtifactTouch Auto Const mandatory
ObjectReference Property MQ305EndingMarkerCompanionAny Auto Const mandatory
Spell Property CureAddictions Auto Const mandatory
Scene Property MQ305_002_Unity_05 Auto Const mandatory
VisualEffect Property UnityActorEffect Auto Const mandatory
VisualEffect Property UnityCameraFadeIn_AO Auto Const mandatory

;-- Functions ---------------------------------------

Function EnableUnityEndScenes()
  Int HunterEmissaryChoice = MQ302_SidedWithChoice.GetValueInt() ; #DEBUG_LINE_NO:86
  If HunterEmissaryChoice == 0 ; #DEBUG_LINE_NO:88
    MQ305EndingMarkerEmissary.EnableNoWait(False) ; #DEBUG_LINE_NO:89
  ElseIf HunterEmissaryChoice == 1 ; #DEBUG_LINE_NO:90
    Mq305EndingMarkerHunter.EnableNoWait(False) ; #DEBUG_LINE_NO:91
  ElseIf HunterEmissaryChoice == 2 ; #DEBUG_LINE_NO:92
    MQ305EndingMarkerNeither.EnableNoWait(False) ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
  Self.EnableRomanceCompanions() ; #DEBUG_LINE_NO:96
  If MQ305_CF_SysDefEnding.GetValueInt() >= 1 ; #DEBUG_LINE_NO:98
    MQ305EndingMarkerCF_SysDef.EnableNoWait(False) ; #DEBUG_LINE_NO:99
  ElseIf MQ305_CF_PirateEnding.GetValueInt() >= 1 ; #DEBUG_LINE_NO:100
    MQ305EndingMarkerCF_Delgado.EnableNoWait(False) ; #DEBUG_LINE_NO:101
  EndIf ; #DEBUG_LINE_NO:
  If MQ305_FSC_RonHopeKilled.GetValueInt() >= 1 ; #DEBUG_LINE_NO:104
    MQ305EndingMarkerFSC_HopeDead.EnableNoWait(False) ; #DEBUG_LINE_NO:105
  ElseIf MQ305_FSC_RonHopeBribeAccepted.GetValueInt() >= 1 ; #DEBUG_LINE_NO:106
    MQ305EndingMarkerFSC_HopeLetGo.EnableNoWait(False) ; #DEBUG_LINE_NO:107
  ElseIf MQ305_FSC_RonHopeJailed.GetValueInt() >= 1 ; #DEBUG_LINE_NO:108
    MQ305EndingMarkerFSC_HopeNotDead.EnableNoWait(False) ; #DEBUG_LINE_NO:109
  EndIf ; #DEBUG_LINE_NO:
  If MQ305_RI_NeuroampPromoted.GetValueInt() >= 1 ; #DEBUG_LINE_NO:112
    MQ305EndingMarkerRI_NeuroAmp.EnableNoWait(False) ; #DEBUG_LINE_NO:113
    If RI08_MasakoRemainedCEO.GetValueInt() >= 1 ; #DEBUG_LINE_NO:114
      MQ305EndingMarkerRI_NeuroAmp_Masako.EnableNoWait(False) ; #DEBUG_LINE_NO:115
    Else ; #DEBUG_LINE_NO:
      MQ305EndingMarkerRI_NeuroAmp_Ularu.EnableNoWait(False) ; #DEBUG_LINE_NO:117
    EndIf ; #DEBUG_LINE_NO:
  ElseIf MQ305_RI_NeuroampNotPromoted.GetValueInt() >= 1 ; #DEBUG_LINE_NO:119
    MQ305EndingMarkerRI_NoNeuroAmp.EnableNoWait(False) ; #DEBUG_LINE_NO:120
    If RI08_MasakoRemainedCEO.GetValueInt() >= 1 ; #DEBUG_LINE_NO:121
      MQ305EndingMarkerRI_NoNeuroAmp_Masako.EnableNoWait(False) ; #DEBUG_LINE_NO:122
    Else ; #DEBUG_LINE_NO:
      MQ305EndingMarkerRI_NoNeuroAmp_Ularu.EnableNoWait(False) ; #DEBUG_LINE_NO:124
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If MQ305_UC_PlagueEnding.GetValueInt() >= 1 ; #DEBUG_LINE_NO:128
    MQ305EndingMarkerUC_Terrormorph.EnableNoWait(False) ; #DEBUG_LINE_NO:129
  ElseIf MQ305_UC_AcelesEnding.GetValueInt() >= 1 ; #DEBUG_LINE_NO:130
    MQ305EndingMarkerUC_Aceles.EnableNoWait(False) ; #DEBUG_LINE_NO:131
  ElseIf MQ305_UC_SterilizationEnding.GetValueInt() >= 1 ; #DEBUG_LINE_NO:132
    MQ305EndingMarkerUC_Terrormorph.EnableNoWait(False) ; #DEBUG_LINE_NO:133
  EndIf ; #DEBUG_LINE_NO:
  MQ305EndingMarkerConstellation.EnableNoWait(False) ; #DEBUG_LINE_NO:136
EndFunction

Function SavePlayerKnowledge()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:141
  Int currentElement = 0 ; #DEBUG_LINE_NO:143
  While currentElement < PlayerKnowledgeArray.Length ; #DEBUG_LINE_NO:144
    Float CurrentPlayerKnowledgeGlobalValue = PlayerKnowledgeArray[currentElement].PlayerKnowledgeGlobal.GetValue() ; #DEBUG_LINE_NO:145
    ActorValue CurrentPlayerKnowledgeAV = PlayerKnowledgeArray[currentElement].PlayerKnowledgeAV ; #DEBUG_LINE_NO:146
    PlayerREF.SetValue(CurrentPlayerKnowledgeAV, CurrentPlayerKnowledgeGlobalValue) ; #DEBUG_LINE_NO:148
    currentElement += 1 ; #DEBUG_LINE_NO:150
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function EnterUnity()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:156
  Game.FadeOutGame(True, False, 0.0, 1.0, True) ; #DEBUG_LINE_NO:158
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:159
  While MQ305_002_Unity_05.IsPlaying() ; #DEBUG_LINE_NO:162
    Utility.Wait(0.5) ; #DEBUG_LINE_NO:163
  EndWhile ; #DEBUG_LINE_NO:
  Int myUnityTimesEntered = PlayerREF.GetValueInt(PlayerUnityTimesEntered) + 1 ; #DEBUG_LINE_NO:166
  PlayerREF.SetValue(PlayerUnityTimesEntered, myUnityTimesEntered as Float) ; #DEBUG_LINE_NO:167
  Self.SavePlayerKnowledge() ; #DEBUG_LINE_NO:168
  WwiseEvent_QST_PlayerEntersUnityA.Play(PlayerREF as ObjectReference, None, None) ; #DEBUG_LINE_NO:171
  Game.PlayBinkNoWait("EndingVision.bk2", False, False, False, True, False, True) ; #DEBUG_LINE_NO:172
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:174
  Game.CreateStarbornGame() ; #DEBUG_LINE_NO:177
EndFunction

Function CheckMultipleRomance()
  Actor AndrejaREF = Andreja.GetActorRef() ; #DEBUG_LINE_NO:183
  Actor BarrettREF = Barrett.GetActorRef() ; #DEBUG_LINE_NO:184
  Actor SamREF = SamCoe.GetActorRef() ; #DEBUG_LINE_NO:185
  Actor SarahREF = SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:186
  MQ305_MultiRomance_var = 0 ; #DEBUG_LINE_NO:188
  If AndrejaREF.IsDead() == False && AndrejaREF.GetValue(COM_IsRomantic) == 1.0 ; #DEBUG_LINE_NO:189
    MQ305_MultiRomance_var += 1 ; #DEBUG_LINE_NO:190
  EndIf ; #DEBUG_LINE_NO:
  If BarrettREF.IsDead() == False && BarrettREF.GetValue(COM_IsRomantic) == 1.0 ; #DEBUG_LINE_NO:193
    MQ305_MultiRomance_var += 1 ; #DEBUG_LINE_NO:194
  EndIf ; #DEBUG_LINE_NO:
  If SamREF.IsDead() == False && SamREF.GetValue(COM_IsRomantic) == 1.0 ; #DEBUG_LINE_NO:197
    MQ305_MultiRomance_var += 1 ; #DEBUG_LINE_NO:198
  EndIf ; #DEBUG_LINE_NO:
  If SarahREF.IsDead() == False && SarahREF.GetValue(COM_IsRomantic) == 1.0 ; #DEBUG_LINE_NO:201
    MQ305_MultiRomance_var += 1 ; #DEBUG_LINE_NO:202
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function EnableRomanceCompanions()
  Actor AndrejaREF = Andreja.GetActorRef() ; #DEBUG_LINE_NO:207
  Actor BarrettREF = Barrett.GetActorRef() ; #DEBUG_LINE_NO:208
  Actor SamREF = SamCoe.GetActorRef() ; #DEBUG_LINE_NO:209
  Actor SarahREF = SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:210
  Bool bAnyCompanionEnabled = False ; #DEBUG_LINE_NO:211
  If AndrejaREF.IsDead() == False && AndrejaREF.GetValue(COM_IsRomantic) == 1.0 ; #DEBUG_LINE_NO:213
    MQ305EndingMarkerAndreja.EnableNoWait(False) ; #DEBUG_LINE_NO:214
    bAnyCompanionEnabled = True ; #DEBUG_LINE_NO:215
  EndIf ; #DEBUG_LINE_NO:
  If BarrettREF.IsDead() == False && BarrettREF.GetValue(COM_IsRomantic) == 1.0 ; #DEBUG_LINE_NO:218
    MQ305EndingMarkerBarrett.EnableNoWait(False) ; #DEBUG_LINE_NO:219
    bAnyCompanionEnabled = True ; #DEBUG_LINE_NO:220
  EndIf ; #DEBUG_LINE_NO:
  If SamREF.IsDead() == False && SamREF.GetValue(COM_IsRomantic) == 1.0 ; #DEBUG_LINE_NO:223
    MQ305EndingMarkerSamCoe.EnableNoWait(False) ; #DEBUG_LINE_NO:224
    bAnyCompanionEnabled = True ; #DEBUG_LINE_NO:225
  EndIf ; #DEBUG_LINE_NO:
  If SarahREF.IsDead() == False && SarahREF.GetValue(COM_IsRomantic) == 1.0 ; #DEBUG_LINE_NO:228
    MQ305EndingMarkerSarahMorgan.EnableNoWait(False) ; #DEBUG_LINE_NO:229
    bAnyCompanionEnabled = True ; #DEBUG_LINE_NO:230
  EndIf ; #DEBUG_LINE_NO:
  If bAnyCompanionEnabled ; #DEBUG_LINE_NO:233
    MQ305EndingMarkerCompanionAny.EnableNoWait(False) ; #DEBUG_LINE_NO:234
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UpdateFriendTalkCount()
  Actor SamREF = SamCoe.GetActorRef() ; #DEBUG_LINE_NO:240
  If SamREF.IsDead() ; #DEBUG_LINE_NO:242
    MQ305_FriendTalkCount_var = 8 ; #DEBUG_LINE_NO:243
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckFriendUnityTalks()
  If Self.GetStageDone(MQ305_AllFriendsTalkedStage) == False ; #DEBUG_LINE_NO:249
    MQ305_FriendTalkCount_var -= 1 ; #DEBUG_LINE_NO:250
    If MQ305_FriendTalkCount_var <= 0 ; #DEBUG_LINE_NO:252
      Self.SetStage(MQ305_AllFriendsTalkedStage) ; #DEBUG_LINE_NO:253
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ArmillaryPlaced(Int iAllArtifactsIn)
  If iAllArtifactsIn == 0 ; #DEBUG_LINE_NO:259
    Self.SetStage(ArmillaryPlacedStage) ; #DEBUG_LINE_NO:260
  ElseIf Self.GetStageDone(ArmillaryCompleteStage) && !Self.GetStageDone(WentToUnityOnceStage) ; #DEBUG_LINE_NO:262
    Self.SetObjectiveCompleted(PlaceArmillaryObj, True) ; #DEBUG_LINE_NO:264
    Self.SetObjectiveDisplayed(PowerUpGravObj, True, True) ; #DEBUG_LINE_NO:265
    Self.SetObjectiveDisplayed(RemoveArmillaryObj, True, True) ; #DEBUG_LINE_NO:266
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(ArmillaryPlacedStage) ; #DEBUG_LINE_NO:268
    Self.SetStage(ArmillaryCompleteStage) ; #DEBUG_LINE_NO:269
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ArmillaryRemoved()
  If Self.GetStageDone(ArmillaryCompleteStage) && !Self.GetStageDone(WentToUnityOnceStage) ; #DEBUG_LINE_NO:276
    Self.SetObjectiveCompleted(PlaceArmillaryObj, False) ; #DEBUG_LINE_NO:277
    Self.SetObjectiveDisplayed(PowerUpGravObj, False, False) ; #DEBUG_LINE_NO:278
    Self.SetObjectiveDisplayed(RemoveArmillaryObj, False, False) ; #DEBUG_LINE_NO:279
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function GravJumpToUnity()
  Actor AndrejaREF = Andreja.GetActorRef() ; #DEBUG_LINE_NO:284
  Actor BarrettREF = Barrett.GetActorRef() ; #DEBUG_LINE_NO:285
  Actor SamREF = SamCoe.GetActorRef() ; #DEBUG_LINE_NO:286
  Actor SarahREF = SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:287
  Actor CoraREF = CoraCoe.GetActorRef() ; #DEBUG_LINE_NO:288
  Actor VascoREF = Vasco.GetActorRef() ; #DEBUG_LINE_NO:289
  Location PlayerShipLoc = PlayerShipInteriorLocation.GetLocation() ; #DEBUG_LINE_NO:290
  Game.SetCharGenHUDMode(1) ; #DEBUG_LINE_NO:293
  Game.FadeOutGame(True, False, 0.0, 1.0, True) ; #DEBUG_LINE_NO:294
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:295
  Self.CheckInPlayerShip(AndrejaREF, PlayerShipLoc) ; #DEBUG_LINE_NO:298
  Self.CheckInPlayerShip(BarrettREF, PlayerShipLoc) ; #DEBUG_LINE_NO:299
  Self.CheckInPlayerShip(SamREF, PlayerShipLoc) ; #DEBUG_LINE_NO:300
  Self.CheckInPlayerShip(SarahREF, PlayerShipLoc) ; #DEBUG_LINE_NO:301
  Self.CheckInPlayerShip(CoraREF, PlayerShipLoc) ; #DEBUG_LINE_NO:302
  Self.CheckInPlayerShip(VascoREF, PlayerShipLoc) ; #DEBUG_LINE_NO:303
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:305
  PlayerREF.moveto(UnityMovetoMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:306
  (SQ_ENV as sq_env_afflictionsscript).CureAllAfflictions() ; #DEBUG_LINE_NO:309
  CureAddictions.Cast(PlayerREF as ObjectReference, PlayerREF as ObjectReference) ; #DEBUG_LINE_NO:310
  PlayerREF.ResetHealthAndLimbs() ; #DEBUG_LINE_NO:311
  Game.FadeOutGame(False, True, 0.0, 0.5, False) ; #DEBUG_LINE_NO:312
EndFunction

Function CheckInPlayerShip(Actor myActor, Location myLoc)
  If myActor.IsInLocation(myLoc) ; #DEBUG_LINE_NO:316
    myActor.SetValue(MQ305JumpedToUnity, 1.0) ; #DEBUG_LINE_NO:317
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function LockPlayerControlsUnity()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:322
  Game.ForceFirstPerson() ; #DEBUG_LINE_NO:323
  Game.SetCharGenHUDMode(1) ; #DEBUG_LINE_NO:324
  MQ305EnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:325
  MQ305EnableLayer.DisablePlayerControls(False, True, True, False, True, True, True, False, True, True, True) ; #DEBUG_LINE_NO:326
  MQ305EnableLayer.EnableJumping(False) ; #DEBUG_LINE_NO:327
  UnityActorEffect.Play(PlayerREF as ObjectReference, -1.0, None) ; #DEBUG_LINE_NO:328
  UnityCameraFadeIn_AO.Play(PlayerREF as ObjectReference, 20.0, None) ; #DEBUG_LINE_NO:329
  Utility.Wait(20.0) ; #DEBUG_LINE_NO:330
  MQ305EnableLayer.EnableCamSwitch(True) ; #DEBUG_LINE_NO:331
EndFunction

Function UnlockPlayerControlUnity()
  Game.SetCharGenHUDMode(0) ; #DEBUG_LINE_NO:335
  MQ305EnableLayer = None ; #DEBUG_LINE_NO:336
  UnityActorEffect.Stop(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:337
EndFunction
