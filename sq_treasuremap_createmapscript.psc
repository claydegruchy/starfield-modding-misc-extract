ScriptName SQ_TreasureMap_CreateMapScript Extends Quest
{ script to place and clean up treasure map into a container }

;-- Variables ---------------------------------------
Location locationToCheck
ObjectReference treasureMapRef

;-- Properties --------------------------------------
ReferenceAlias Property MapContainer Auto Const mandatory
{ put the treasure map in this }
LocationAlias Property MapLocation Auto Const mandatory
{ watch for player to leave this location - shut down quest and remove treasure map }
Form Property TreasureMap Auto Const mandatory
{ treasure map to place - usually a leveled list }
Keyword Property LocTypeSettlement Auto Const mandatory
{ used to get settlement parent location, if any }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  ObjectReference containerRef = MapContainer.GetRef() ; #DEBUG_LINE_NO:24
  treasureMapRef = containerRef.PlaceAtMe(TreasureMap, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:27
  containerRef.AddItem(treasureMapRef as Form, 1, False) ; #DEBUG_LINE_NO:29
  locationToCheck = MapLocation.GetLocation() ; #DEBUG_LINE_NO:32
  Location[] settlementLocations = locationToCheck.GetParentLocations(LocTypeSettlement) ; #DEBUG_LINE_NO:34
  If settlementLocations.Length > 0 ; #DEBUG_LINE_NO:35
    locationToCheck = settlementLocations[0] ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:42
  Self.RegisterForRemoteEvent(treasureMapRef as ScriptObject, "OnContainerChanged") ; #DEBUG_LINE_NO:43
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer() && akOldLoc == locationToCheck && (akNewLoc == None || akNewLoc.IsSameLocation(akOldLoc, LocTypeSettlement) == False) ; #DEBUG_LINE_NO:48
    Self.Stop() ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnContainerChanged(ObjectReference akSource, ObjectReference akNewContainer, ObjectReference akOldContainer)
  If akSource == treasureMapRef ; #DEBUG_LINE_NO:55
    Self.Stop() ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestShutdown()
  ObjectReference containerRef = MapContainer.GetRef() ; #DEBUG_LINE_NO:63
  If treasureMapRef as Bool && containerRef as Bool ; #DEBUG_LINE_NO:64
    containerRef.RemoveItem(treasureMapRef as Form, 1, False, None) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
EndEvent
