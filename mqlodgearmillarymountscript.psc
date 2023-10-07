ScriptName MQLodgeArmillaryMountScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ404 Auto Const mandatory
Int Property MQ404_PackUpStage = 110 Auto Const
Int Property MQ404_PackUpPrereqStage = 100 Auto Const
Message Property ArmillaryNoArtifactsAddedMSG Auto Const mandatory
Keyword Property ObjectTypeMQArtifact Auto Const mandatory
wwiseevent Property WwiseEvent_AMBArtifactArmillaryPlaceArtifact Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:11
  If (akActionRef == PlayerREF as ObjectReference) && (MQ404.GetStageDone(MQ404_PackUpPrereqStage) == False || MQ404.GetStageDone(MQ404_PackUpStage)) ; #DEBUG_LINE_NO:13
    If PlayerREF.GetItemCount(ObjectTypeMQArtifact as Form) > 0 ; #DEBUG_LINE_NO:14
      WwiseEvent_AMBArtifactArmillaryPlaceArtifact.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:15
      armillaryscript ArmillaryREF = Self.GetLinkedRef(None) as armillaryscript ; #DEBUG_LINE_NO:16
      ArmillaryREF.BuildArmillary(PlayerREF, None) ; #DEBUG_LINE_NO:17
    Else ; #DEBUG_LINE_NO:
      ArmillaryNoArtifactsAddedMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:19
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
