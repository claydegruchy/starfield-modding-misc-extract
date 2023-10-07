ScriptName ListenForArtifact Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property VisionStartedStage Auto Const mandatory
Int Property VisionEndedStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  buriedartifact myRef = Self.GetRef() as buriedartifact ; #DEBUG_LINE_NO:7
  Self.RegisterForCustomEvent(myRef as ScriptObject, "buriedartifact_OnArtifactAcquireEnded") ; #DEBUG_LINE_NO:8
  Self.RegisterForCustomEvent(myRef as ScriptObject, "buriedartifact_OnArtifactAcquireStarted") ; #DEBUG_LINE_NO:9
EndEvent

Event BuriedArtifact.OnArtifactAcquireEnded(buriedartifact akSender, Var[] akArgs)
  Self.GetOwningQuest().SetStage(50) ; #DEBUG_LINE_NO:14
EndEvent

Event BuriedArtifact.OnArtifactAcquireStarted(buriedartifact akSender, Var[] akArgs)
  Self.GetOwningQuest().SetStage(49) ; #DEBUG_LINE_NO:18
EndEvent
