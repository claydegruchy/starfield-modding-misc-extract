ScriptName CF05_PrototypeShipDockingScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property StateChangeMarker Auto Const mandatory
Location Property StationTheKeySpaceCellLocation Auto Const mandatory

;-- Functions ---------------------------------------

Event OnShipDock(Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:8
  Location currentLocation = Self.TryToGetCurrentLocation() ; #DEBUG_LINE_NO:9
  spaceshipreference myShip = Self.GetShipRef() ; #DEBUG_LINE_NO:10
  If myShip == akDocking && currentLocation == StationTheKeySpaceCellLocation ; #DEBUG_LINE_NO:12
    StateChangeMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipUndock(Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:19
  Location currentLocation = Self.TryToGetCurrentLocation() ; #DEBUG_LINE_NO:20
  spaceshipreference myShip = Self.GetShipRef() ; #DEBUG_LINE_NO:21
  If myQuest.GetStageDone(1890) && !myQuest.GetStageDone(1900) ; #DEBUG_LINE_NO:23
    myQuest.SetStage(1900) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
  If myShip == akUndocking && currentLocation == StationTheKeySpaceCellLocation ; #DEBUG_LINE_NO:27
    StateChangeMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndEvent
