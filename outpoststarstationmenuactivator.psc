ScriptName OutpostStarstationMenuActivator Extends ObjectReference

;-- Variables ---------------------------------------
outpoststarstationactorscript myVendor

;-- Properties --------------------------------------
Message Property OutpostStarstationMessage Auto Const mandatory
{ message box listing options }
ActorBase Property OutpostStarstationVendor Auto Const mandatory
{ vendor to create when built }

;-- Functions ---------------------------------------

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  myVendor = Self.PlaceAtMe(OutpostStarstationVendor as Form, 1, False, True, True, None, None, True) as outpoststarstationactorscript ; #DEBUG_LINE_NO:14
  myVendor.Initialize(Self.GetLinkedRef(None)) ; #DEBUG_LINE_NO:16
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
  If myVendor ; #DEBUG_LINE_NO:21
    myVendor.Cleanup() ; #DEBUG_LINE_NO:22
    myVendor.Delete() ; #DEBUG_LINE_NO:23
    myVendor = None ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:30
    outpoststarstationactorscript theShipServicesActor = myVendor ; #DEBUG_LINE_NO:31
    If theShipServicesActor ; #DEBUG_LINE_NO:32
      Int messageIndex = OutpostStarstationMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:33
      If messageIndex == 0 ; #DEBUG_LINE_NO:34
        theShipServicesActor.ModifyStarstation() ; #DEBUG_LINE_NO:35
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
