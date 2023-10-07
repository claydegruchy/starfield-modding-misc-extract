ScriptName CF01DialogueCrimeGuardsScript Extends Quest

;-- Variables ---------------------------------------
inputenablelayer inputLayer

;-- Functions ---------------------------------------

Function DisablePlayerControlsForCF01Arrest()
  inputLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:6
  inputLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function EnablePlayerControlsAfterCF01Arrest()
  inputLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:11
  inputLayer.Delete() ; #DEBUG_LINE_NO:12
EndFunction
