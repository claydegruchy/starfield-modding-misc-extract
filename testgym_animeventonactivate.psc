ScriptName TestGym_AnimEventOnActivate Extends ObjectReference Const
{ Tests brads stuff }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property PipeArt Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If 1 > 0 ; #DEBUG_LINE_NO:15
    PipeArt.PlayAnimation("Play01") ; #DEBUG_LINE_NO:19
    Utility.Wait(3.0) ; #DEBUG_LINE_NO:21
    PipeArt.PlayAnimation("StopEffect") ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndEvent
