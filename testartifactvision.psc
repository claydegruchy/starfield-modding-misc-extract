ScriptName TestArtifactVision Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
VisualEffect Property P_ArtifactVisionFX_AO Auto Const mandatory
wwiseevent Property P_AMBArtifactVisionAEvent Auto Const mandatory
ObjectReference Property P_LightsOff Auto Const
ImageSpaceModifier Property P_FadetoBlackImod Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:10
    inputenablelayer myLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:16
    myLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:17
    P_ArtifactVisionFX_AO.Play(Game.GetPlayer() as ObjectReference, 35.0, None) ; #DEBUG_LINE_NO:19
    P_LightsOff.Disable(False) ; #DEBUG_LINE_NO:21
    Int instanceID = P_AMBArtifactVisionAEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:23
    If P_AMBArtifactVisionAEvent.PlayAndWait(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:26
      myLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:28
      P_LightsOff.Enable(False) ; #DEBUG_LINE_NO:30
      P_FadetoBlackImod.Apply(1.0) ; #DEBUG_LINE_NO:31
    EndIf ; #DEBUG_LINE_NO:
    Utility.wait(2.0) ; #DEBUG_LINE_NO:36
    P_FadetoBlackImod.Remove() ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndEvent
