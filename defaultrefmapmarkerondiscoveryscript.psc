ScriptName DefaultRefMapMarkerOnDiscoveryScript Extends ObjectReference Const default
{ Set map marker flags OnMapMarkerDiscovered event }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property VisibleOnStarMap = True Auto Const
{ Visible on Star Map? }
Int Property MapMarkerType = -1 Auto Const
{ map marker type. See SetMapMarkerType in CS wiki for enum values
    -1 = don't change }
Int Property MapMarkerCategory = -1 Auto Const
{ map marker category. See SetMapMarkerCategory in CS wiki for enum values
    -1 = don't change }

;-- Functions ---------------------------------------

Event OnMapMarkerDiscovered()
  Self.SetMarkerVisibleOnStarMap(VisibleOnStarMap) ; #DEBUG_LINE_NO:19
  If MapMarkerType > -1 ; #DEBUG_LINE_NO:21
    Self.SetMapMarkerType(MapMarkerType) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
  If MapMarkerCategory > -1 ; #DEBUG_LINE_NO:25
    Self.SetMapMarkerCategory(MapMarkerCategory) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndEvent
