ScriptName SQ_PlayerShipArmillaryScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property ObjectTypeMQArtifact Auto Const mandatory
Message Property MQAddArtifactEnterShipMSG Auto Const mandatory
ActorValue Property MQArmillaryShipBuilderCheck Auto Const mandatory
GlobalVariable Property MQAllowArmillaryGravDrive Auto Const mandatory
ReferenceAlias Property MQ00_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If MQAllowArmillaryGravDrive.GetValueInt() >= 1 ; #DEBUG_LINE_NO:10
    Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:11
    If abRemove == True ; #DEBUG_LINE_NO:12
      (akObject as armillaryscript).PackupArmillary(PlayerREF) ; #DEBUG_LINE_NO:13
      akObject.Disable(False) ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
