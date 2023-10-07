ScriptName Test_PryOpenDoors Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property ActivatorLever Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(ActivatorLever) as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:7
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:11
  ObjectReference Destination = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:12
  Self.TranslateToRef(Destination, 0.001, 0.0) ; #DEBUG_LINE_NO:13
EndEvent
