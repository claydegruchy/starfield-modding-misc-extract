ScriptName TestFormantSceneScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SceneToStop Auto
Scene Property MyScene Auto

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:8
    SceneToStop.Stop() ; #DEBUG_LINE_NO:9
    MyScene.Start() ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndEvent
