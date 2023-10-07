ScriptName LISTShipVendorInfoScript Extends TopicInfo Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_playershipscript Property playerShipScript Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If Utility.IsGameMenuPaused() == False ; #DEBUG_LINE_NO:8
    Actor theVendor = None ; #DEBUG_LINE_NO:9
    ObjectReference landingMarker = playerShipScript.PlayerShipLandingMarker.GetRef() ; #DEBUG_LINE_NO:10
    If akSpeakerRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:12
      theVendor = (akSpeakerRef as Actor).GetDialogueTarget() ; #DEBUG_LINE_NO:13
    Else ; #DEBUG_LINE_NO:
      theVendor = akSpeakerRef as Actor ; #DEBUG_LINE_NO:15
    EndIf ; #DEBUG_LINE_NO:
    If theVendor as Bool && landingMarker as Bool ; #DEBUG_LINE_NO:18
      landingMarker.ShowHangarMenu(0, theVendor, None, False) ; #DEBUG_LINE_NO:20
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
