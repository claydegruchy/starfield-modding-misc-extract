ScriptName MQArtifactAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MQ_ArtifactDepositMSG Auto Const mandatory
Int Property StageToSet Auto Const
wwiseevent Property WwiseEvent_AMBArtifactVision Auto Const mandatory
Quest Property MQ00 Auto Const mandatory
ReferenceAlias Property SoundMarker01 Auto Const
ReferenceAlias Property SoundMarker02 Auto Const
ReferenceAlias Property FloaterMarker01 Auto Const

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:13
      ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:14
      If myRef.GetCurrentDestructionStage() < 3 ; #DEBUG_LINE_NO:16
        MQ_ArtifactDepositMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:17
      Else ; #DEBUG_LINE_NO:
        Self.GotoState("HasBeenTriggered") ; #DEBUG_LINE_NO:19
        SoundMarker01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:21
        SoundMarker02.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:22
        Game.FadeOutGame(True, True, 0.0, 0.5, True) ; #DEBUG_LINE_NO:24
        Utility.Wait(0.5) ; #DEBUG_LINE_NO:25
        (MQ00 as mq00questscript).PlayArtifactVision() ; #DEBUG_LINE_NO:26
        myRef.Disable(False) ; #DEBUG_LINE_NO:27
        FloaterMarker01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:28
        Game.FadeOutGame(False, True, 0.0, 0.5, False) ; #DEBUG_LINE_NO:29
        Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:31
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
