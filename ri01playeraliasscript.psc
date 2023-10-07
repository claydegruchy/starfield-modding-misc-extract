ScriptName RI01PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property RI01_Radio_JobAdNeonScene Auto Const mandatory
Scene Property RI01_Radio_JobAdNewAtlantisScene Auto Const mandatory
Scene Property RI01_Radio_JobAdRyujinTowerScene Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
Location Property CityNewAtlantisLocation Auto Const mandatory
GlobalVariable Property UC04_AttackActive Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:13
  Self.RunSetup() ; #DEBUG_LINE_NO:14
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akOldLoc == CityNewAtlantisLocation ; #DEBUG_LINE_NO:20
    RI01_Radio_JobAdNewAtlantisScene.Stop() ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
  If akOldLoc == CityNeonLocation ; #DEBUG_LINE_NO:23
    RI01_Radio_JobAdNeonScene.Stop() ; #DEBUG_LINE_NO:24
    RI01_Radio_JobAdRyujinTowerScene.Stop() ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
  If akNewLoc == CityNeonLocation ; #DEBUG_LINE_NO:28
    RI01_Radio_JobAdNeonScene.Start() ; #DEBUG_LINE_NO:30
    RI01_Radio_JobAdRyujinTowerScene.Start() ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
  If akNewLoc == CityNewAtlantisLocation && UC04_AttackActive.GetValue() == 0.0 ; #DEBUG_LINE_NO:33
    RI01_Radio_JobAdNewAtlantisScene.Start() ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RunSetup()
  Location CurrentLocation = Game.GetPlayer().GetCurrentLocation() ; #DEBUG_LINE_NO:41
  If CurrentLocation == CityNeonLocation ; #DEBUG_LINE_NO:44
    RI01_Radio_JobAdNeonScene.Start() ; #DEBUG_LINE_NO:46
    RI01_Radio_JobAdRyujinTowerScene.Start() ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
  If CurrentLocation == CityNewAtlantisLocation && UC04_AttackActive.GetValue() == 0.0 ; #DEBUG_LINE_NO:49
    RI01_Radio_JobAdNewAtlantisScene.Start() ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction
