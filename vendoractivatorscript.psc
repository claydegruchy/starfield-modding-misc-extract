ScriptName VendorActivatorScript Extends ObjectReference
{ script for accessing the vendor menu via an activator }

;-- Variables ---------------------------------------
Actor myVendor
ObjectReference myVendorContainer

;-- Properties --------------------------------------
ActorBase Property Vendor Auto Const mandatory
{ vendor to create on load }
Container Property VendorContainer Auto Const mandatory
{ vendor container to create on load }
Keyword Property VendorContainerKeyword01 Auto Const mandatory
{ used to link vendor container }
Bool Property ClearVendorActorInventoryOnLoad = False Auto Const
{ If true, the spawned Vendor actor will have its inventory cleared each time the Activator loads. }

;-- Functions ---------------------------------------

Event OnLoad()
  If myVendor == None ; #DEBUG_LINE_NO:21
    myVendor = Self.PlaceActorAtMe(Vendor, 4, None, False, True, True, None, True) ; #DEBUG_LINE_NO:22
    myVendorContainer = Self.PlaceAtMe(VendorContainer as Form, 1, False, True, True, None, None, True) ; #DEBUG_LINE_NO:23
    myVendor.SetLinkedRef(myVendorContainer, VendorContainerKeyword01, True) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
  If ClearVendorActorInventoryOnLoad ; #DEBUG_LINE_NO:28
    myVendor.RemoveAllItems(None, False, False) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:35
    myVendor.ShowBarterMenu() ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
EndEvent
