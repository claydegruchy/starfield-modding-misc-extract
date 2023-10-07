ScriptName UC04_ListeningDeviceRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC04 Auto Const mandatory
{ Quest to check to unlock this listening device }
Int Property PrereqStage = 300 Auto Const
{ Listening devices can only be triggering once this stage is set }
Int Property ShutdownStage = 450 Auto Const
{ Listening devices can only be triggering once this stage is set }
Scene Property SceneToPlay Auto Const mandatory
{ Which scene we want this listening device to play }

;-- Functions ---------------------------------------

Event OnLoad()
  If !UC04.GetStageDone(PrereqStage) ; #DEBUG_LINE_NO:16
    Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:17
  ElseIf Self.IsActivationBlocked() ; #DEBUG_LINE_NO:18
    Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If UC04.GetStageDone(PrereqStage) && (akActionRef == Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:24
    If !SceneToPlay.IsPlaying() ; #DEBUG_LINE_NO:27
      SceneToPlay.Start() ; #DEBUG_LINE_NO:28
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
