ScriptName MQ102Script Extends Quest

;-- Variables ---------------------------------------
inputenablelayer MQ102EnableLayer

;-- Functions ---------------------------------------

Function BlockSpaceTravel()
  Game.SetInChargen(True, False, False) ; #DEBUG_LINE_NO:6
  MQ102EnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:7
  MQ102EnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:8
  MQ102EnableLayer.EnableFastTravel(False) ; #DEBUG_LINE_NO:9
  MQ102EnableLayer.EnableFarTravel(False) ; #DEBUG_LINE_NO:10
EndFunction

Function UnblockSpaceTravel()
  MQ102EnableLayer = None ; #DEBUG_LINE_NO:14
  Game.SetInChargen(False, False, False) ; #DEBUG_LINE_NO:15
EndFunction
