ScriptName MQ204StateChangeHandlerPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property CityNewAtlantisLocation Auto Const mandatory
MusicType Property _MUSExplore_WwiseSilence Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akNewLoc == CityNewAtlantisLocation ; #DEBUG_LINE_NO:8
    _MUSExplore_WwiseSilence.Add() ; #DEBUG_LINE_NO:9
  ElseIf akOldLoc == CityNewAtlantisLocation ; #DEBUG_LINE_NO:10
    If Game.GetPlayer().IsInLocation(CityNewAtlantisLocation) == False ; #DEBUG_LINE_NO:11
      _MUSExplore_WwiseSilence.Remove() ; #DEBUG_LINE_NO:12
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
