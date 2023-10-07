ScriptName Fragments:TopicInfos:TIF_DialogueRedMile_0013E68A Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueShipServices Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  (DialogueShipServices as dialogueshipservicesscript).RepairPlayerShip() ; #DEBUG_LINE_NO:8
EndFunction
