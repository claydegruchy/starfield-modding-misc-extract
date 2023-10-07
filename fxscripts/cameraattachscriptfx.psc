ScriptName FXScripts:CameraAttachScriptFX Extends ObjectReference
{ Attaches a camera attach fx based on the property set in the reference. }

;-- Variables ---------------------------------------
Actor Player
Int TriggerCounter = 0
Int instanceID

;-- Properties --------------------------------------
VisualEffect Property CameraAttachFX Auto Const
{ Particle art to attach to camera, fog by default }
VisualEffect Property CameraAttachFX2 Auto Const
{ 2nd Particle art to attach to camera, not used by default }
wwiseevent Property LoopSoundEvent Auto Const
{ specify sound fx to play, set on reference, none by default }
Int Property timeLimit = 180 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Player = Game.getPlayer() ; #DEBUG_LINE_NO:24
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Player as ObjectReference ; #DEBUG_LINE_NO:30
    TriggerCounter += 1 ; #DEBUG_LINE_NO:31
    If TriggerCounter > 0 ; #DEBUG_LINE_NO:32
      CameraAttachFX.Play(Player as ObjectReference, timeLimit as Float, None) ; #DEBUG_LINE_NO:33
      If CameraAttachFX2 ; #DEBUG_LINE_NO:35
        CameraAttachFX2.Play(Player as ObjectReference, timeLimit as Float, None) ; #DEBUG_LINE_NO:36
      EndIf ; #DEBUG_LINE_NO:
      If LoopSoundEvent ; #DEBUG_LINE_NO:38
        instanceID = LoopSoundEvent.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:39
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If akActionRef == Player as ObjectReference ; #DEBUG_LINE_NO:46
    TriggerCounter -= 1 ; #DEBUG_LINE_NO:47
    CameraAttachFX.Stop(Player as ObjectReference) ; #DEBUG_LINE_NO:48
    If CameraAttachFX2 ; #DEBUG_LINE_NO:49
      CameraAttachFX2.Stop(Player as ObjectReference) ; #DEBUG_LINE_NO:50
    EndIf ; #DEBUG_LINE_NO:
    If LoopSoundEvent ; #DEBUG_LINE_NO:52
      wwiseevent.StopInstance(instanceID) ; #DEBUG_LINE_NO:53
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnCellDetach()
  TriggerCounter = 0 ; #DEBUG_LINE_NO:60
  CameraAttachFX.Stop(Player as ObjectReference) ; #DEBUG_LINE_NO:61
  If CameraAttachFX2 ; #DEBUG_LINE_NO:62
    CameraAttachFX2.Stop(Player as ObjectReference) ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
  If LoopSoundEvent ; #DEBUG_LINE_NO:65
    wwiseevent.StopInstance(instanceID) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnLoad()
  TriggerCounter = 0 ; #DEBUG_LINE_NO:71
  CameraAttachFX.Stop(Player as ObjectReference) ; #DEBUG_LINE_NO:72
  If CameraAttachFX2 ; #DEBUG_LINE_NO:73
    CameraAttachFX2.Stop(Player as ObjectReference) ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
  If LoopSoundEvent ; #DEBUG_LINE_NO:76
    wwiseevent.StopInstance(instanceID) ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
  Player = None ; #DEBUG_LINE_NO:79
EndEvent
