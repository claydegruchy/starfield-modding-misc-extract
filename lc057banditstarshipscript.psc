ScriptName LC057BanditStarshipScript Extends SpaceshipReference

;-- Functions ---------------------------------------

Event OnLoad()
  (Self as SpaceshipReference).SetExteriorLoadDoorInaccessible(False) ; #DEBUG_LINE_NO:4
EndEvent
