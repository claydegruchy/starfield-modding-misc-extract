ScriptName TestAudioObjectScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TestAudioActor Auto Const
Scene Property SceneToPlay Auto Const
Scene[] Property AdditionalScenesToStop Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:8
    SceneToPlay.Stop() ; #DEBUG_LINE_NO:9
    If AdditionalScenesToStop.Length > 0 ; #DEBUG_LINE_NO:11
      Int I = 0 ; #DEBUG_LINE_NO:12
      Int iLength = AdditionalScenesToStop.Length ; #DEBUG_LINE_NO:13
      While I < iLength ; #DEBUG_LINE_NO:15
        AdditionalScenesToStop[I].Stop() ; #DEBUG_LINE_NO:16
        I += 1 ; #DEBUG_LINE_NO:17
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    TestAudioActor.ForceRefTo(Self as ObjectReference) ; #DEBUG_LINE_NO:21
    SceneToPlay.Start() ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndEvent
