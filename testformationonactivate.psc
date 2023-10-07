ScriptName TestFormationOnActivate Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property TestFormationGlobal Auto Const
Actor Property Leader Auto Const
Actor Property Follower01 Auto Const
Actor Property Follower02 Auto Const
Actor Property Follower03 Auto Const
Actor Property Follower04 Auto Const
Int Property GlobalSetValue = 1 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  TestFormationGlobal.SetValue(GlobalSetValue as Float) ; #DEBUG_LINE_NO:13
  Leader.EvaluatePackage(False) ; #DEBUG_LINE_NO:14
  Follower01.EvaluatePackage(False) ; #DEBUG_LINE_NO:15
  Follower02.EvaluatePackage(False) ; #DEBUG_LINE_NO:16
  Follower03.EvaluatePackage(False) ; #DEBUG_LINE_NO:17
  Follower04.EvaluatePackage(False) ; #DEBUG_LINE_NO:18
EndEvent
