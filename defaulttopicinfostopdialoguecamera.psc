ScriptName DefaultTopicInfoStopDialogueCamera Extends TopicInfo Const default
{ Stop Dialogue Cameras when this Info begins or ends }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property StopCameraOnBegin = True Auto Const
{ If True (default), stop camera when the Info begins. If False then stop camera when the info ends. }

;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If StopCameraOnBegin == True ; #DEBUG_LINE_NO:8
    Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If StopCameraOnBegin == False ; #DEBUG_LINE_NO:15
    Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent
