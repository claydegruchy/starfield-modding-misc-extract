ScriptName MQ204ArmillaryMountScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ00 Auto Const mandatory
Message Property ArmillaryNoArtifactsAddedMSG Auto Const mandatory
Keyword Property ObjectTypeMQArtifact Auto Const mandatory
ReferenceAlias Property MQ00_ArmillaryMountOrScreen Auto Const mandatory
Message Property MQBlockArmillaryShipScreenMSGBox Auto Const mandatory
wwiseevent Property WwiseEvent_AMBArtifactArmillaryPlaceArtifact Auto Const mandatory

;-- Functions ---------------------------------------

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:12
  (Self.GetLinkedRef(None) as armillaryscript).BuildArmillary(PlayerREF, None) ; #DEBUG_LINE_NO:13
  (MQ00 as mq00questscript).StartArmillaryTimer(Self.GetWorkshop()) ; #DEBUG_LINE_NO:14
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:18
  (Self.GetLinkedRef(None) as armillaryscript).PackupArmillary(PlayerREF) ; #DEBUG_LINE_NO:19
  (MQ00 as mq00questscript).StartArmillaryTimer(Self.GetWorkshop()) ; #DEBUG_LINE_NO:20
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:24
  ObjectReference ArmillaryMountOrScreenREF = MQ00_ArmillaryMountOrScreen.GetRef() ; #DEBUG_LINE_NO:25
  If akActionRef == PlayerREF as ObjectReference ; #DEBUG_LINE_NO:27
    If ArmillaryMountOrScreenREF != Self as ObjectReference ; #DEBUG_LINE_NO:28
      MQBlockArmillaryShipScreenMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:29
    ElseIf PlayerREF.GetItemCount(ObjectTypeMQArtifact as Form) > 0 ; #DEBUG_LINE_NO:31
      WwiseEvent_AMBArtifactArmillaryPlaceArtifact.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:32
      armillaryscript ArmillaryREF = Self.GetLinkedRef(None) as armillaryscript ; #DEBUG_LINE_NO:33
      ArmillaryREF.BuildArmillary(PlayerREF, Self as ObjectReference) ; #DEBUG_LINE_NO:34
    Else ; #DEBUG_LINE_NO:
      ArmillaryNoArtifactsAddedMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
