ScriptName ReturnUnityTriggerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property LeftUnityStage = 300 Auto Const
Int Property ReturnUnityObjective = 120 Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  Quest myMQ305 = Self.GetOwningQuest() ; #DEBUG_LINE_NO:8
  If (akActionRef == PlayerREF as ObjectReference) && myMQ305.GetStageDone(LeftUnityStage) ; #DEBUG_LINE_NO:10
    (myMQ305 as mq305script).LockPlayerControlsUnity() ; #DEBUG_LINE_NO:13
    myMQ305.SetObjectiveCompleted(ReturnUnityObjective, True) ; #DEBUG_LINE_NO:15
    (Self.GetOwningQuest() as mq305script).EnableUnityEndScenes() ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent
