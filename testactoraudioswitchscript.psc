ScriptName TestActorAudioSwitchScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SceneToStop Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:6
    SceneToStop.Stop() ; #DEBUG_LINE_NO:7
  EndIf ; #DEBUG_LINE_NO:
EndEvent
