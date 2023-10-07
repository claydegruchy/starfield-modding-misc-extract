ScriptName OutpostShipbuilderMenuActivator Extends OutpostEventHandlerParent

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property OutpostShipbuilderMessage Auto Const mandatory
{ message box listing options }
ActorBase Property OutpostShipbuilderVendor Auto Const mandatory
{ vendor to create when built }
shipvendorscript Property myVendor Auto hidden

;-- Functions ---------------------------------------

Function HandleOnWorkshopObjectPlaced(ObjectReference akReference)
  myVendor = Self.PlaceAtMe(OutpostShipbuilderVendor as Form, 1, False, True, True, None, None, True) as shipvendorscript ; #DEBUG_LINE_NO:15
  ObjectReference myLandingMarker = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:16
  myVendor.Initialize(myLandingMarker) ; #DEBUG_LINE_NO:19
EndFunction

Function HandleOnWorkshopObjectRemoved(ObjectReference akReference)
  If myVendor ; #DEBUG_LINE_NO:25
    myVendor.Delete() ; #DEBUG_LINE_NO:26
    myVendor = None ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:33
    shipvendorscript theShipServicesActor = myVendor ; #DEBUG_LINE_NO:34
    If theShipServicesActor ; #DEBUG_LINE_NO:35
      Int messageIndex = OutpostShipbuilderMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:36
      If messageIndex == 0 ; #DEBUG_LINE_NO:37
        theShipServicesActor.myLandingMarker.ShowHangarMenu(0, theShipServicesActor as Actor, None, False) ; #DEBUG_LINE_NO:38
      ElseIf messageIndex == 1 ; #DEBUG_LINE_NO:39
        theShipServicesActor.myLandingMarker.ShowHangarMenu(0, theShipServicesActor as Actor, None, True) ; #DEBUG_LINE_NO:40
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
