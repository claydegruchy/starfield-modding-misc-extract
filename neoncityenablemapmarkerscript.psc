ScriptName NeonCityEnableMapMarkerScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference[] myRefs = Self.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:4
  If myRefs.Length > 0 ; #DEBUG_LINE_NO:5
    ObjectReference myMapMarker = myRefs[0] ; #DEBUG_LINE_NO:7
    If myMapMarker.IsDisabled() ; #DEBUG_LINE_NO:8
      myMapMarker.EnableNoWait(False) ; #DEBUG_LINE_NO:10
      myMapMarker.SetMarkerDiscovered() ; #DEBUG_LINE_NO:11
      myMapMarker.OnMapMarkerDiscovered() ; #DEBUG_LINE_NO:12
      myMapMarker.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
