ScriptName RL088Script Extends Quest

;-- Variables ---------------------------------------
Int EngineinstanceID
Bool bGravityActive = True
Int gravTimerID = 10
Bool tutorialMSG

;-- Properties --------------------------------------
Cell Property RL088ArmoredStarship Auto Const mandatory
ReferenceAlias Property LightsEnableMarker Auto Const
ReferenceAlias Property EngineRotationHelper Auto Const
wwiseevent Property WwiseEvent_QST_RL088ArmoredShip_Power_Off Auto Const
wwiseevent Property WwiseEvent_QST_RL088ArmoredShip_Power_On Auto Const
wwiseevent Property WwiseEvent_QST_RL088ArmoredShip_Power_LightsOn Auto Const
wwiseevent Property WwiseEvent_AMB_RL088_SpinningMachine Auto Const
Quest Property MQ_TutorialQuest Auto Const
Explosion Property RL088_NoVFXExplosion Auto Const
ObjectReference Property ExplosionXmarker Auto

;-- Functions ---------------------------------------

Function StartGravityCountdown(Int minNum, Int maxNum)
  Self.StartTimer(Utility.RandomInt(minNum, maxNum) as Float, 10) ; #DEBUG_LINE_NO:21
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == gravTimerID ; #DEBUG_LINE_NO:25
    If Game.GetPlayer().GetParentCell() == RL088ArmoredStarship ; #DEBUG_LINE_NO:26
      If bGravityActive ; #DEBUG_LINE_NO:27
        Self.DisableGravityAutoDuration() ; #DEBUG_LINE_NO:28
      Else ; #DEBUG_LINE_NO:
        Self.EnableGravityAutoDuration() ; #DEBUG_LINE_NO:30
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function EnableGravityAutoDuration()
  bGravityActive = True ; #DEBUG_LINE_NO:38
  WwiseEvent_QST_RL088ArmoredShip_Power_On.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:39
  Game.ShakeCamera(None, 0.200000003, 0.0) ; #DEBUG_LINE_NO:40
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:41
  Game.ShakeCamera(None, 0.5, 0.0) ; #DEBUG_LINE_NO:42
  WwiseEvent_QST_RL088ArmoredShip_Power_LightsOn.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:43
  LightsEnableMarker.getref().enable(False) ; #DEBUG_LINE_NO:44
  Utility.Wait(0.300000012) ; #DEBUG_LINE_NO:45
  LightsEnableMarker.getref().disable(False) ; #DEBUG_LINE_NO:46
  Utility.Wait(0.300000012) ; #DEBUG_LINE_NO:47
  LightsEnableMarker.getref().enable(False) ; #DEBUG_LINE_NO:48
  RL088ArmoredStarship.SetGravityScale(1.0) ; #DEBUG_LINE_NO:49
  Self.SpeedRotationHelper() ; #DEBUG_LINE_NO:50
  Self.StartGravityCountdown(9, 13) ; #DEBUG_LINE_NO:51
EndFunction

Function DisableGravityAutoDuration()
  bGravityActive = False ; #DEBUG_LINE_NO:55
  WwiseEvent_QST_RL088ArmoredShip_Power_Off.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:56
  Game.ShakeCamera(None, 0.200000003, 0.0) ; #DEBUG_LINE_NO:57
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:58
  Game.ShakeCamera(None, 0.5, 0.0) ; #DEBUG_LINE_NO:59
  WwiseEvent_QST_RL088ArmoredShip_Power_LightsOn.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:60
  LightsEnableMarker.getref().disable(False) ; #DEBUG_LINE_NO:61
  Utility.Wait(0.300000012) ; #DEBUG_LINE_NO:62
  LightsEnableMarker.getref().enable(False) ; #DEBUG_LINE_NO:63
  Utility.Wait(0.300000012) ; #DEBUG_LINE_NO:64
  LightsEnableMarker.getref().disable(False) ; #DEBUG_LINE_NO:65
  RL088ArmoredStarship.SetGravityScale(0.0) ; #DEBUG_LINE_NO:66
  ExplosionXmarker.PlaceAtMe(RL088_NoVFXExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:67
  If tutorialMSG == False ; #DEBUG_LINE_NO:68
    MQ_TutorialQuest.SetStage(10) ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
  tutorialMSG = True ; #DEBUG_LINE_NO:71
  Self.SlowRotationHelper() ; #DEBUG_LINE_NO:72
  Self.StartGravityCountdown(12, 15) ; #DEBUG_LINE_NO:73
EndFunction

Function SpeedRotationHelper()
  EngineRotationHelper.getref().SetAnimationVariableFloat("Speed", 0.200000003) ; #DEBUG_LINE_NO:77
  EngineRotationHelper.getref().PlayAnimation("RotateCW_Loop") ; #DEBUG_LINE_NO:78
  EngineinstanceID = WwiseEvent_AMB_RL088_SpinningMachine.Play(EngineRotationHelper.getref(), None, None) ; #DEBUG_LINE_NO:79
EndFunction

Function SlowRotationHelper()
  EngineRotationHelper.getref().SetAnimationVariableFloat("Speed", 0.0) ; #DEBUG_LINE_NO:83
  EngineRotationHelper.getref().PlayAnimation("RotateCW_Loop") ; #DEBUG_LINE_NO:84
  wwiseevent.StopInstance(EngineinstanceID) ; #DEBUG_LINE_NO:85
EndFunction
