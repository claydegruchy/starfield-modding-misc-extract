ScriptName RI_LaneTriggerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueFCRyujinTower_Lane_GreetingsScene Auto Const mandatory
GlobalVariable Property RI_LaneGreetingTracker Auto Const mandatory
GlobalVariable Property GameDay Auto Const mandatory
Int Property StageToCheck Auto Const mandatory
Quest Property RI01 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Float iCurrentDay = GameDay.GetValue() ; #DEBUG_LINE_NO:11
  If RI01.GetStageDone(StageToCheck) ; #DEBUG_LINE_NO:12
    If (akActionRef == Game.GetPlayer() as ObjectReference) && RI_LaneGreetingTracker.GetValue() != iCurrentDay ; #DEBUG_LINE_NO:13
      DialogueFCRyujinTower_Lane_GreetingsScene.Start() ; #DEBUG_LINE_NO:14
      RI_LaneGreetingTracker.SetValue(iCurrentDay) ; #DEBUG_LINE_NO:15
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
