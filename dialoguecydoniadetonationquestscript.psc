ScriptName DialogueCydoniaDetonationQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Cell Property CityCydoniaMainLevel Auto Const mandatory
Cell Property CityCydoniaMainLevel02 Auto Const mandatory
GlobalVariable Property CY_DetonationEndOfDay Auto Const mandatory
GlobalVariable Property CY_DetonationCount Auto Const mandatory
LocationAlias Property Cydonia Auto Const mandatory
Scene Property DialogueCydonia_Detonation_Announcer_Countdown Auto Const mandatory
Scene Property DialogueCydonia_Detonation_Announcer_LastCall Auto Const mandatory
Scene Property DialogueCydonia_Detonation_Concluded Auto Const mandatory
Scene Property DialogueCydonia_Detonation_Concluded_LastCall Auto Const mandatory
wwiseevent Property AMB_Cydonia_Fracking_Explosion_FirstEncounter Auto Const mandatory
wwiseevent Property AMB_Cydonia_Fracking_Explosion Auto Const mandatory
wwiseevent Property AMB_Cydonia_Fracking_Klaxon_TriggerEchos Auto Const mandatory
wwiseevent Property AMB_Cydonia_EXT_Fracking_Explosion_NoOcc Auto Const mandatory
wwiseevent Property AMB_Cydonia_EXT_Fracking_StructureRumbleTriggerEchos Auto Const mandatory
ReferenceAlias Property DetonationSoundMarkerFirstTime Auto Const mandatory
ReferenceAlias Property DetonationSoundMarker Auto Const mandatory
ReferenceAlias Property DetonationSoundMarkerInt02 Auto Const mandatory
ReferenceAlias Property DetonationSoundMarkerExt Auto Const mandatory
RefCollectionAlias Property Klaxons Auto Const mandatory
Int Property KlaxonTimerID = 1 Auto Const
Float Property KlaxonTimerLength = 3.0 Auto Const
Int Property DetonationTimerID = 2 Auto Const
Float Property DetonationTimerLength = 8.0 Auto Const
Int Property EndQuestTimerID = 3 Auto Const
Float Property EndQuestTimerLength = 3.0 Auto Const
Float Property DetonationShakeLength = 4.0 Auto Const
Int Property QuestDoneStage = 1000 Auto Const

;-- Functions ---------------------------------------

Function PlayKlaxons()
  Int I = 0 ; #DEBUG_LINE_NO:35
  Int iCount = Klaxons.GetCount() ; #DEBUG_LINE_NO:36
  While I < iCount ; #DEBUG_LINE_NO:37
    ObjectReference myKlaxon = Klaxons.GetAt(I) ; #DEBUG_LINE_NO:38
    myKlaxon.PlayAnimation("Play01") ; #DEBUG_LINE_NO:39
    I += 1 ; #DEBUG_LINE_NO:40
  EndWhile ; #DEBUG_LINE_NO:
  If CY_DetonationCount.GetValue() < 1.0 ; #DEBUG_LINE_NO:43
    AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarkerFirstTime.GetRef(), None, None) ; #DEBUG_LINE_NO:44
    AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarkerInt02.GetRef(), None, None) ; #DEBUG_LINE_NO:45
  Else ; #DEBUG_LINE_NO:
    AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarker.GetRef(), None, None) ; #DEBUG_LINE_NO:47
    AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarkerInt02.GetRef(), None, None) ; #DEBUG_LINE_NO:48
    AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarkerExt.GetRef(), None, None) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
  Self.StartTimer(KlaxonTimerLength, KlaxonTimerID) ; #DEBUG_LINE_NO:51
EndFunction

Function PlaySequence()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:56
  If Game.GetLocalTime() >= CY_DetonationEndOfDay.GetValue() - 2.0 && Game.GetLocalTime() <= CY_DetonationEndOfDay.GetValue() ; #DEBUG_LINE_NO:57
    If myPlayer.IsInLocation(Cydonia.GetLocation()) ; #DEBUG_LINE_NO:58
      DialogueCydonia_Detonation_Announcer_LastCall.Start() ; #DEBUG_LINE_NO:59
    Else ; #DEBUG_LINE_NO:
      Self.SetStage(QuestDoneStage) ; #DEBUG_LINE_NO:61
    EndIf ; #DEBUG_LINE_NO:
  ElseIf myPlayer.IsInLocation(Cydonia.GetLocation()) ; #DEBUG_LINE_NO:65
    DialogueCydonia_Detonation_Announcer_Countdown.Start() ; #DEBUG_LINE_NO:66
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(QuestDoneStage) ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Shake()
  Game.ShakeCamera(None, 0.200000003, DetonationShakeLength) ; #DEBUG_LINE_NO:75
  Game.ShakeController(0.300000012, 0.150000006, DetonationShakeLength) ; #DEBUG_LINE_NO:76
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:77
  Game.ShakeCamera(None, 0.050000001, DetonationShakeLength) ; #DEBUG_LINE_NO:78
  Game.ShakeController(0.150000006, 0.0, DetonationShakeLength) ; #DEBUG_LINE_NO:79
EndFunction

Function PlayDetonationFX()
  If CY_DetonationCount.GetValue() < 1.0 ; #DEBUG_LINE_NO:85
    AMB_Cydonia_Fracking_Explosion_FirstEncounter.Play(DetonationSoundMarkerFirstTime.GetRef(), None, None) ; #DEBUG_LINE_NO:86
  Else ; #DEBUG_LINE_NO:
    AMB_Cydonia_Fracking_Explosion.Play(DetonationSoundMarker.GetRef(), None, None) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
  Self.DetonationTimer() ; #DEBUG_LINE_NO:90
  Self.Shake() ; #DEBUG_LINE_NO:91
EndFunction

Function PlayDetonationFXInt02()
  AMB_Cydonia_Fracking_Explosion.Play(DetonationSoundMarkerInt02.GetRef(), None, None) ; #DEBUG_LINE_NO:96
  Self.DetonationTimer() ; #DEBUG_LINE_NO:97
  Self.Shake() ; #DEBUG_LINE_NO:98
EndFunction

Function PlayDetonationFXEXT()
  AMB_Cydonia_EXT_Fracking_Explosion_NoOcc.Play(DetonationSoundMarkerExt.GetRef(), None, None) ; #DEBUG_LINE_NO:103
  AMB_Cydonia_EXT_Fracking_StructureRumbleTriggerEchos.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:104
  Self.DetonationTimer() ; #DEBUG_LINE_NO:105
  Self.Shake() ; #DEBUG_LINE_NO:106
EndFunction

Function DetonationTimer()
  Self.StartTimer(DetonationTimerLength, DetonationTimerID) ; #DEBUG_LINE_NO:112
EndFunction

Function ConcludeSequence()
  If Game.GetLocalTime() >= CY_DetonationEndOfDay.GetValue() - 1.0 && Game.GetLocalTime() <= CY_DetonationEndOfDay.GetValue() + 1.0 ; #DEBUG_LINE_NO:118
    DialogueCydonia_Detonation_Concluded_LastCall.Start() ; #DEBUG_LINE_NO:119
  Else ; #DEBUG_LINE_NO:
    DialogueCydonia_Detonation_Concluded.Start() ; #DEBUG_LINE_NO:121
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DelayQuestEndForLastCall()
  Self.StartTimerGameTime(EndQuestTimerLength, EndQuestTimerID) ; #DEBUG_LINE_NO:129
EndFunction

Function EndKlaxons()
  Int I = 0 ; #DEBUG_LINE_NO:135
  Int iCount = Klaxons.GetCount() ; #DEBUG_LINE_NO:136
  While I < iCount ; #DEBUG_LINE_NO:137
    ObjectReference myKlaxon = Klaxons.GetAt(I) ; #DEBUG_LINE_NO:138
    myKlaxon.PlayAnimation("Play02") ; #DEBUG_LINE_NO:139
    I += 1 ; #DEBUG_LINE_NO:140
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SelectCorrectDetonation()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:147
  If myPlayer.IsInLocation(Cydonia.GetLocation()) ; #DEBUG_LINE_NO:148
    If myPlayer.IsInInterior() ; #DEBUG_LINE_NO:149
      Cell myCell = myPlayer.GetParentCell() ; #DEBUG_LINE_NO:150
      If myCell == CityCydoniaMainLevel ; #DEBUG_LINE_NO:151
        Self.PlayDetonationFX() ; #DEBUG_LINE_NO:152
      ElseIf myCell == CityCydoniaMainLevel02 ; #DEBUG_LINE_NO:153
        Self.PlayDetonationFXInt02() ; #DEBUG_LINE_NO:154
      Else ; #DEBUG_LINE_NO:
        Self.SetStage(QuestDoneStage) ; #DEBUG_LINE_NO:156
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.PlayDetonationFXEXT() ; #DEBUG_LINE_NO:159
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(QuestDoneStage) ; #DEBUG_LINE_NO:162
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SelectCorrectConclusion()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:169
  If myPlayer.IsInLocation(Cydonia.GetLocation()) ; #DEBUG_LINE_NO:170
    Self.ConcludeSequence() ; #DEBUG_LINE_NO:171
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(QuestDoneStage) ; #DEBUG_LINE_NO:173
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  Self.PlayKlaxons() ; #DEBUG_LINE_NO:181
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == KlaxonTimerID ; #DEBUG_LINE_NO:185
    Self.PlaySequence() ; #DEBUG_LINE_NO:186
  ElseIf aiTimerID == DetonationTimerID ; #DEBUG_LINE_NO:187
    Self.SelectCorrectConclusion() ; #DEBUG_LINE_NO:188
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == EndQuestTimerID ; #DEBUG_LINE_NO:193
    Self.Stop() ; #DEBUG_LINE_NO:194
  EndIf ; #DEBUG_LINE_NO:
EndEvent
