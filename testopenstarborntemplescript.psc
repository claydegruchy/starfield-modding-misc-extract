ScriptName TestOpenStarbornTempleScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property TempleWall Auto Const mandatory
ObjectReference Property TempleWallMoveToMarker Auto Const mandatory
ObjectReference Property TempleWallOpenSoundMarker Auto Const mandatory
wwiseevent Property sOpenWallEvent Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  TempleWall.TranslateToRef(TempleWallMoveToMarker, 4.0, 0.0) ; #DEBUG_LINE_NO:10
  sOpenWallEvent.Play(TempleWallOpenSoundMarker, None, None) ; #DEBUG_LINE_NO:11
EndEvent
