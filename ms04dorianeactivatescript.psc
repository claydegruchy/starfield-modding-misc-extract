ScriptName MS04DorianeActivateScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property sceneToPlay Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  sceneToPlay.Start() ; #DEBUG_LINE_NO:7
EndEvent
