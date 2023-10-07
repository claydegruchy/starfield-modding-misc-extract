ScriptName ShipVendorInfoScript Extends TopicInfo Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property OpenToShipForSale = False Auto Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If Utility.IsGameMenuPaused() == False ; #DEBUG_LINE_NO:8
    sq_shipservicesactorscript theVendor = None ; #DEBUG_LINE_NO:9
    If akSpeakerRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:10
      theVendor = (akSpeakerRef as Actor).GetDialogueTarget() as sq_shipservicesactorscript ; #DEBUG_LINE_NO:11
    Else ; #DEBUG_LINE_NO:
      theVendor = akSpeakerRef as sq_shipservicesactorscript ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
    If theVendor as Bool && theVendor.myLandingMarker as Bool ; #DEBUG_LINE_NO:15
      Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:18
      spaceshipreference shipForSale = None ; #DEBUG_LINE_NO:19
      If OpenToShipForSale ; #DEBUG_LINE_NO:20
        shipForSale = theVendor.GetShipForSale(0) ; #DEBUG_LINE_NO:21
      EndIf ; #DEBUG_LINE_NO:
      theVendor.myLandingMarker.ShowHangarMenu(0, theVendor as Actor, shipForSale, OpenToShipForSale) ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
