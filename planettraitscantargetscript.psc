ScriptName PlanetTraitScanTargetScript Extends ObjectReference
{ script for uncovering a planet trait when all the loc refs in this location are scanned }

;-- Variables ---------------------------------------
Location myLocation

;-- Properties --------------------------------------
sq_parentscript Property SQ_Parent Auto Const mandatory
{ use to get planet trait data }
ObjectReference Property PlanetTraitScanTargetRef Auto Const mandatory
{ ref from ScanTargetNames array on SQ_ParentScript to use for name }

;-- Functions ---------------------------------------

Function testIsScanned()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnLoad()
  myLocation = Self.GetCurrentLocation() ; #DEBUG_LINE_NO:13
  Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:14
  SQ_Parent.CheckForScanTargetUpdate(Self as ObjectReference) ; #DEBUG_LINE_NO:15
EndEvent

;-- State -------------------------------------------
State done

  Event OnScanned()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State ready

  Event OnScanned()
    Self.gotoState("done") ; #DEBUG_LINE_NO:22
    SQ_Parent.DiscoverMatchingPlanetTraits(Self as ObjectReference, True) ; #DEBUG_LINE_NO:25
  EndEvent
EndState
