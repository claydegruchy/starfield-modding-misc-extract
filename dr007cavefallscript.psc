ScriptName DR007CaveFallScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ImageSpaceModifier Property FadeToBlack Auto Const mandatory
ImageSpaceModifier Property StayBlack Auto Const mandatory
ImageSpaceModifier Property FadeFromBlack Auto Const mandatory
wwiseevent Property sSplashEvent Auto Const mandatory
ObjectReference Property SplashMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  inputenablelayer myLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:12
  myLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:13
  Utility.Wait(6.0) ; #DEBUG_LINE_NO:25
  myLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:26
EndEvent
