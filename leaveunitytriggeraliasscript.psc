ScriptName LeaveUnityTriggerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
ReferenceAlias Property PlayerShipCockpitEntrance Auto Const mandatory
ReferenceAlias Property Armillary Auto Const mandatory
Int Property TalkedToUnityStage = 100 Auto Const
Int Property LeftUnityStage = 300 Auto Const
ObjectReference Property LodgeStartMarker Auto Const mandatory
Quest Property MQ00 Auto Const mandatory
Int Property EnterUnityObjective = 100 Auto Const
Int Property LeaveUnityObjective = 110 Auto Const
Int Property ReturnUnityObjective = 120 Auto Const
Scene Property MQ305_002_Unity_04 Auto Const
GlobalVariable Property MQ305FinalSceneInt Auto Const mandatory
ObjectReference Property MQ305EndingMarkerEmissary Auto Const mandatory
ObjectReference Property Mq305EndingMarkerHunter Auto Const mandatory
ObjectReference Property MQ305EndingMarkerNeither Auto Const mandatory
ObjectReference Property MQ305EndingMarkerCF_SysDef Auto Const mandatory
ObjectReference Property MQ305EndingMarkerCF_Delgado Auto Const mandatory
ObjectReference Property MQ305EndingMarkerFSC_HopeDead Auto Const mandatory
ObjectReference Property MQ305EndingMarkerFSC_HopeNotDead Auto Const mandatory
ObjectReference Property MQ305EndingMarkerFSC_HopeLetGo Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp_Masako Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp_Ularu Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp_Masako Auto Const mandatory
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp_Ularu Auto Const mandatory
ObjectReference Property MQ305EndingMarkerConstellation Auto Const mandatory
ObjectReference Property MQ305EndingMarkerUC_Terrormorph Auto Const mandatory
ObjectReference Property MQ305EndingMarkerUC_Aceles Auto Const mandatory
ObjectReference Property MQ305EndingMarkerAndreja Auto Const mandatory
ObjectReference Property MQ305EndingMarkerBarrett Auto Const mandatory
ObjectReference Property MQ305EndingMarkerSamCoe Auto Const mandatory
ObjectReference Property MQ305EndingMarkerSarahMorgan Auto Const mandatory
ReferenceAlias Property HomeShipArmillaryScreen Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerLeave(ObjectReference akActionRef)
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:44
  Quest myMQ305 = Self.GetOwningQuest() ; #DEBUG_LINE_NO:45
  If (akActionRef == PlayerREF as ObjectReference) && myMQ305.GetStageDone(TalkedToUnityStage) ; #DEBUG_LINE_NO:46
    MQ305_002_Unity_04.Stop() ; #DEBUG_LINE_NO:48
    MQ305FinalSceneInt.SetValueInt(0) ; #DEBUG_LINE_NO:49
    (myMQ305 as mq305script).MQ305EnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:52
    Game.FadeOutGame(True, False, 0.0, 1.0, True) ; #DEBUG_LINE_NO:55
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:56
    Mq305EndingMarkerHunter.DisableNoWait(False) ; #DEBUG_LINE_NO:59
    MQ305EndingMarkerEmissary.DisableNoWait(False) ; #DEBUG_LINE_NO:60
    MQ305EndingMarkerNeither.DisableNoWait(False) ; #DEBUG_LINE_NO:61
    MQ305EndingMarkerAndreja.DisableNoWait(False) ; #DEBUG_LINE_NO:62
    MQ305EndingMarkerBarrett.DisableNoWait(False) ; #DEBUG_LINE_NO:63
    MQ305EndingMarkerSamCoe.DisableNoWait(False) ; #DEBUG_LINE_NO:64
    MQ305EndingMarkerSarahMorgan.DisableNoWait(False) ; #DEBUG_LINE_NO:65
    MQ305EndingMarkerCF_SysDef.DisableNoWait(False) ; #DEBUG_LINE_NO:66
    MQ305EndingMarkerCF_Delgado.DisableNoWait(False) ; #DEBUG_LINE_NO:67
    MQ305EndingMarkerFSC_HopeDead.DisableNoWait(False) ; #DEBUG_LINE_NO:68
    MQ305EndingMarkerFSC_HopeNotDead.DisableNoWait(False) ; #DEBUG_LINE_NO:69
    MQ305EndingMarkerFSC_HopeLetGo.DisableNoWait(False) ; #DEBUG_LINE_NO:70
    MQ305EndingMarkerRI_NoNeuroAmp.DisableNoWait(False) ; #DEBUG_LINE_NO:71
    MQ305EndingMarkerRI_NoNeuroAmp_Masako.DisableNoWait(False) ; #DEBUG_LINE_NO:72
    MQ305EndingMarkerRI_NoNeuroAmp_Ularu.DisableNoWait(False) ; #DEBUG_LINE_NO:73
    MQ305EndingMarkerRI_NeuroAmp.DisableNoWait(False) ; #DEBUG_LINE_NO:74
    MQ305EndingMarkerRI_NeuroAmp_Masako.DisableNoWait(False) ; #DEBUG_LINE_NO:75
    MQ305EndingMarkerRI_NeuroAmp_Ularu.DisableNoWait(False) ; #DEBUG_LINE_NO:76
    MQ305EndingMarkerUC_Aceles.DisableNoWait(False) ; #DEBUG_LINE_NO:77
    MQ305EndingMarkerUC_Terrormorph.DisableNoWait(False) ; #DEBUG_LINE_NO:78
    MQ305EndingMarkerConstellation.DisableNoWait(False) ; #DEBUG_LINE_NO:79
    ObjectReference ArmillaryREF = Armillary.GetRef() ; #DEBUG_LINE_NO:82
    (ArmillaryREF as armillaryscript).PackupArmillary(PlayerREF) ; #DEBUG_LINE_NO:83
    ArmillaryREF.Disable(False) ; #DEBUG_LINE_NO:84
    ObjectReference myShipCockpitEntrance = PlayerShipCockpitEntrance.GetRef() ; #DEBUG_LINE_NO:87
    If myShipCockpitEntrance == None ; #DEBUG_LINE_NO:88
      PlayerREF.moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:89
    Else ; #DEBUG_LINE_NO:
      PlayerREF.moveto(myShipCockpitEntrance, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:92
      PlayerREF.WaitFor3DLoad() ; #DEBUG_LINE_NO:93
      HomeShipArmillaryScreen.GetRef().PlayAnimation("Play02") ; #DEBUG_LINE_NO:94
      PlayerShip.GetShipRef().SetGhost(False) ; #DEBUG_LINE_NO:96
    EndIf ; #DEBUG_LINE_NO:
    If myMQ305.GetStageDone(LeftUnityStage) == False ; #DEBUG_LINE_NO:99
      myMQ305.SetStage(LeftUnityStage) ; #DEBUG_LINE_NO:100
    Else ; #DEBUG_LINE_NO:
      myMQ305.SetObjectiveDisplayed(EnterUnityObjective, False, False) ; #DEBUG_LINE_NO:103
      myMQ305.SetObjectiveCompleted(LeaveUnityObjective, True) ; #DEBUG_LINE_NO:104
      myMQ305.SetObjectiveCompleted(ReturnUnityObjective, False) ; #DEBUG_LINE_NO:105
    EndIf ; #DEBUG_LINE_NO:
    (myMQ305 as mq305script).UnlockPlayerControlUnity() ; #DEBUG_LINE_NO:109
  EndIf ; #DEBUG_LINE_NO:
EndEvent
