ScriptName TestPlaceAliasRelativeToPlayerShip Extends ReferenceAlias
{ OnAliasInit, places this alias relative to the player's ship. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AliasProperties
  Bool Property ShouldEnableAfterPlaced = True Auto Const
EndGroup

Group AutofillProperties collapsedonbase
  ReferenceAlias Property PlayerShip Auto Const mandatory
  Static Property XMarker Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:15
  offsets[0] = 0.0 ; #DEBUG_LINE_NO:16
  offsets[1] = 100.0 ; #DEBUG_LINE_NO:17
  offsets[2] = 0.0 ; #DEBUG_LINE_NO:18
  offsets[5] = 0.0 ; #DEBUG_LINE_NO:19
  ObjectReference marker = PlayerShip.GetRef().PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True) ; #DEBUG_LINE_NO:20
  ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:22
  myRef.MoveTo(marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
  marker.Delete() ; #DEBUG_LINE_NO:30
  If ShouldEnableAfterPlaced ; #DEBUG_LINE_NO:31
    myRef.EnableNoWait(False) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndEvent
