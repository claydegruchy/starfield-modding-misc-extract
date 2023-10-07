ScriptName TestNPCKillAll Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property SpawnController Auto Const
{ Either fill this with the spawn controller, or use a default linkedRef to the spawn controller }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference SpawnControllerFromLink = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:7
  If SpawnControllerFromLink ; #DEBUG_LINE_NO:8
    (SpawnControllerFromLink as testnpcarenascript).KillAllNPCs() ; #DEBUG_LINE_NO:9
  ElseIf SpawnController ; #DEBUG_LINE_NO:
    (SpawnController as testnpcarenascript).KillAllNPCs() ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndEvent
