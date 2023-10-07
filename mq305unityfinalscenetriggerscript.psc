ScriptName MQ305UnityFinalSceneTriggerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ305_002_Unity_04 Auto Const mandatory
GlobalVariable Property MQ305FinalSceneInt Auto Const mandatory
Int Property iSceneNumber Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:9
    If MQ305_002_Unity_04.IsPlaying() == False ; #DEBUG_LINE_NO:10
      MQ305_002_Unity_04.Start() ; #DEBUG_LINE_NO:11
    EndIf ; #DEBUG_LINE_NO:
    MQ305FinalSceneInt.SetValueInt(iSceneNumber) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent
