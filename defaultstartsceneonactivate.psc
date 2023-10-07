ScriptName defaultStartSceneOnActivate Extends ObjectReference Const
{ Simple script to start a scene when clicking on the reference.  Useful for things like intercoms. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SceneToPlay Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If (Game.GetPlayer() as ObjectReference == akActionRef) && !SceneToPlay.isPlaying() ; #DEBUG_LINE_NO:7
    SceneToPlay.start() ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
