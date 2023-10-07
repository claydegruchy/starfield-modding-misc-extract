ScriptName SBPowerCollectionActivatorScript Extends ObjectReference
{ This is on the spherical activator in the very center of the rings.
It gets enabled when the puzzle is solved. 
It handles the FX sequence for the player getting the appropriate power (or ranks it up if they already have the power) if they have the necessary artifact, gives xp, and a permanent health boost. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group effectsData
  ImageSpaceModifier Property MQ207CShiftFadeHoldImod Auto Const mandatory
  ImageSpaceModifier Property MQ207CShiftFadeInImod Auto Const mandatory
  Explosion Property PowerExplosion Auto Const mandatory
  EffectShader Property StarbornPuzzle_PlayerFXS Auto Const mandatory
EndGroup

Group soundData
  wwiseevent Property wPowerAbsorbFXEvent Auto Const mandatory
  MusicType Property mPowerAbsorbStinger Auto Const mandatory
EndGroup

Group keywords
  Keyword Property SBExplosionMarkerKeyword Auto Const mandatory
  Keyword Property SBRingsPuzzleKeyword Auto Const mandatory
  Keyword Property SBPlayerMoveToMarkerKeyword Auto Const mandatory
  Keyword Property BQ01_Keyword_BarrettTempleMarkerLink Auto Const
  Keyword Property BQ01_Keyword_BarrettPowerMarkerLink Auto Const
  Keyword Property BQ01_Keyword_TempleLocation Auto Const
  Keyword Property SBTempleCompanionMarkerLinkKeyword Auto Const
  Keyword Property SBAbsorbPowerFurnKeyword Auto Const mandatory
EndGroup

Group specialHandling
  sq_followersscript Property SQ_Followers Auto Const mandatory
  ReferenceAlias Property Barrett Auto Const
  Quest Property BarrettQuest Auto Const
  Int Property BarrettQuestTempleStagePrereq = 8500 Auto Const
  Int Property BarrettQuestTempleStage = 8501 Auto Const
EndGroup

Group powerReward
  Idle Property IdlePowerUp_Start Auto Const mandatory
  Idle Property IdlePowerUp_Stop Auto Const mandatory
  Message Property PlayerHealthIncreaseMessage Auto Const mandatory
  GlobalVariable Property StarbornPuzzleXP Auto Const mandatory
  ActorValue Property HealthAV Auto Const mandatory
  GlobalVariable Property SBPowerHealthBonus Auto Const mandatory
  { how much is added to the player's health for solving the puzzle }
  Spell Property RankUpPerk Auto
  String Property sVisionBink Auto
  wwiseevent Property WwiseEvent_AMBArtifactVision Auto
EndGroup

Group quests
  Quest Property QuestToCheck Auto Const
  { optional - if provided and StageToSet > -1, this quest stage will be set when the power sequence is done }
  Int Property StageToSet = -1 Auto Const
EndGroup


;-- Functions ---------------------------------------

Function PlayerPowerSequence()
  Bool bBarrettQuestActive = False ; #DEBUG_LINE_NO:88
  If Self.GetCurrentLocation().HasKeyword(BQ01_Keyword_TempleLocation) ; #DEBUG_LINE_NO:89
    bBarrettQuestActive = True ; #DEBUG_LINE_NO:90
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:93
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:94
  inputenablelayer myLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:96
  myLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:97
  ObjectReference absorbPowerFurnitureRef = Self.GetLinkedRef(SBAbsorbPowerFurnKeyword) ; #DEBUG_LINE_NO:99
  If absorbPowerFurnitureRef ; #DEBUG_LINE_NO:101
    absorbPowerFurnitureRef.Activate(playerRef as ObjectReference, False) ; #DEBUG_LINE_NO:102
  EndIf ; #DEBUG_LINE_NO:
  StarbornPuzzle_PlayerFXS.Play(playerRef as ObjectReference, -1.0) ; #DEBUG_LINE_NO:105
  Int instancePowerFX = wPowerAbsorbFXEvent.Play(playerRef as ObjectReference, None, None) ; #DEBUG_LINE_NO:106
  puzzleRef.PlayAnimationAndWait("Stage1", "Stage2") ; #DEBUG_LINE_NO:111
  WwiseEvent_AMBArtifactVision.Play(playerRef as ObjectReference, None, None) ; #DEBUG_LINE_NO:116
  Game.PlayBinkNoWait(sVisionBink, False, False, False, True, False, True) ; #DEBUG_LINE_NO:117
  playerRef.MoveTo(Self.GetLinkedRef(SBPlayerMoveToMarkerKeyword), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:118
  StarbornPuzzle_PlayerFXS.Stop(playerRef as ObjectReference) ; #DEBUG_LINE_NO:119
  If bBarrettQuestActive ; #DEBUG_LINE_NO:121
    Barrett.TryToMoveTo(Self.GetLinkedRef(BQ01_Keyword_BarrettTempleMarkerLink)) ; #DEBUG_LINE_NO:122
  Else ; #DEBUG_LINE_NO:
    SQ_Followers.TeleportFollowers(Self.GetLinkedRef(SBTempleCompanionMarkerLinkKeyword), None, True, True, False, False, False) ; #DEBUG_LINE_NO:125
  EndIf ; #DEBUG_LINE_NO:
  playerRef.WaitFor3DLoad() ; #DEBUG_LINE_NO:128
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:129
  myLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:131
  Self.PlayerReceivePower() ; #DEBUG_LINE_NO:132
  If bBarrettQuestActive ; #DEBUG_LINE_NO:135
    BarrettQuest.SetStage(BarrettQuestTempleStage) ; #DEBUG_LINE_NO:136
  EndIf ; #DEBUG_LINE_NO:
  If QuestToCheck as Bool && StageToSet > -1 ; #DEBUG_LINE_NO:140
    QuestToCheck.SetStage(StageToSet) ; #DEBUG_LINE_NO:141
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PlayerReceivePower()
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:146
  Int iXPIncrease = StarbornPuzzleXP.GetValueInt() ; #DEBUG_LINE_NO:147
  RankUpPerk.Cast(playerRef as ObjectReference, playerRef as ObjectReference) ; #DEBUG_LINE_NO:149
  Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:150
  playerRef.ModValue(HealthAV, SBPowerHealthBonus.GetValueInt() as Float) ; #DEBUG_LINE_NO:151
  Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:152
  Game.RewardPlayerXP(iXPIncrease, False) ; #DEBUG_LINE_NO:153
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:154
  Self.SendCustomEvent("sbpowercollectionactivatorscript_PowerAcquiredEvent", None) ; #DEBUG_LINE_NO:157
EndFunction

Function UpdatePowerProperties(Spell newRankUpPerk, String newVisionBink, wwiseevent newArtifactVision)
  RankUpPerk = newRankUpPerk ; #DEBUG_LINE_NO:161
  sVisionBink = newVisionBink ; #DEBUG_LINE_NO:162
  WwiseEvent_AMBArtifactVision = newArtifactVision ; #DEBUG_LINE_NO:163
EndFunction

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnTriggerEnter(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:72
      Self.GotoState("HasBeenTriggered") ; #DEBUG_LINE_NO:73
      Self.PlayerPowerSequence() ; #DEBUG_LINE_NO:74
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
