ScriptName LandmarkScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property LandmarkCompleteMessage Auto Const mandatory
GlobalVariable Property LandmarkTotal Auto Const mandatory
GlobalVariable Property LandmarkTracker Auto Const mandatory
LeveledItem Property Landmark_SpacesuitRewardArmor Auto Const mandatory

;-- Functions ---------------------------------------

Function LandmarkFound()
  Float fLandmarksFound = LandmarkTracker.Mod(1.0) ; #DEBUG_LINE_NO:10
  If fLandmarksFound == LandmarkTotal.GetValue() ; #DEBUG_LINE_NO:13
    Game.GetPlayer().AddItem(Landmark_SpacesuitRewardArmor as Form, 1, False) ; #DEBUG_LINE_NO:15
    LandmarkCompleteMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndFunction
