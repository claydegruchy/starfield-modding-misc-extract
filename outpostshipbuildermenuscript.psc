ScriptName OutpostShipbuilderMenuScript Extends TerminalMenu

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  outpostshipbuildermenuactivator myShipbuilderRef = akTerminalRef as outpostshipbuildermenuactivator ; #DEBUG_LINE_NO:5
  If myShipbuilderRef ; #DEBUG_LINE_NO:6
    shipvendorscript theShipVendor = myShipbuilderRef.myVendor ; #DEBUG_LINE_NO:7
    If theShipVendor ; #DEBUG_LINE_NO:9
      If auiMenuItemID == 1 ; #DEBUG_LINE_NO:10
        theShipVendor.myLandingMarker.ShowHangarMenu(0, theShipVendor as Actor, None, False) ; #DEBUG_LINE_NO:12
      ElseIf auiMenuItemID == 2 ; #DEBUG_LINE_NO:13
        theShipVendor.myLandingMarker.ShowHangarMenu(0, theShipVendor as Actor, None, True) ; #DEBUG_LINE_NO:15
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
