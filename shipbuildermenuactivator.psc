ScriptName ShipbuilderMenuActivator Extends ObjectReference
{ script for buying ships via a kiosk activator 
    NOTE: kiosk should either be linked to a landing marker, OR be linked to another kiosk which is linked to the landing marker.ShipVendorScript
    So, if you have multiple kiosks, only link one to the landing marker, link the others to that kiosk. }

;-- Variables ---------------------------------------
Bool initialized = False

;-- Properties --------------------------------------
ActorBase Property ShipbuilderVendor Auto Const mandatory
{ vendor to create when built - needs to have ShipVendorScript }
shipvendorscript Property myVendor Auto hidden
{ holds the ship vendor for the "master" kiosk }
ShipbuilderMenuActivator Property myLinkedParent Auto hidden
{ linked kiosk that holds the vendor to use }
Message Property ShipBuilderVendorMessage Auto Const
{ the message that pops up on activation }

;-- Functions ---------------------------------------

Event OnLoad()
  If initialized == False ; #DEBUG_LINE_NO:22
    If myVendor == None && myLinkedParent == None ; #DEBUG_LINE_NO:24
      myLinkedParent = Self.GetLinkedRef(None) as ShipbuilderMenuActivator ; #DEBUG_LINE_NO:26
      If myLinkedParent == None ; #DEBUG_LINE_NO:28
        myVendor = Self.PlaceAtMe(ShipbuilderVendor as Form, 1, False, True, True, None, None, True) as shipvendorscript ; #DEBUG_LINE_NO:31
        myVendor.Initialize(Self.GetLinkedRef(None)) ; #DEBUG_LINE_NO:34
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    initialized = True ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:43
    shipvendorscript theShipServicesActor = myVendor ; #DEBUG_LINE_NO:44
    If theShipServicesActor == None ; #DEBUG_LINE_NO:45
      theShipServicesActor = myLinkedParent.myVendor ; #DEBUG_LINE_NO:48
    EndIf ; #DEBUG_LINE_NO:
    If theShipServicesActor ; #DEBUG_LINE_NO:51
      Int messageIndex = ShipBuilderVendorMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:52
      If messageIndex == 0 ; #DEBUG_LINE_NO:53
        theShipServicesActor.myLandingMarker.ShowHangarMenu(0, theShipServicesActor as Actor, None, False) ; #DEBUG_LINE_NO:54
      ElseIf messageIndex == 1 ; #DEBUG_LINE_NO:55
        theShipServicesActor.myLandingMarker.ShowHangarMenu(0, theShipServicesActor as Actor, None, True) ; #DEBUG_LINE_NO:56
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
