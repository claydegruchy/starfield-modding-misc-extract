ScriptName TestFABMessageTrigger Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MessageToShow Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If Game.GetPlayer() as ObjectReference == akActionRef ; #DEBUG_LINE_NO:7
    MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
