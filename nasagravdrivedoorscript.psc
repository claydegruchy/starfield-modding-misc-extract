ScriptName NASAGravDriveDoorScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ301 Auto Const mandatory
Int Property iAnimatedStage = 170 Auto Const
String Property sAnimationEvent = "Opened" Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If MQ301.IsCompleted() || MQ301.GetStageDone(iAnimatedStage) ; #DEBUG_LINE_NO:9
    Self.PlayAnimation("sAnimationEvent") ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndEvent
