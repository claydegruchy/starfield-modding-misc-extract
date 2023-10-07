ScriptName TestSendStoryEventOnActivateScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property StoryEventKeyword Auto Const mandatory
GlobalVariable Property GlobalToSet Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:8
    GlobalToSet.SetValue(1.0) ; #DEBUG_LINE_NO:10
    StoryEventKeyword.SendStoryEventAndWait(Self.GetCurrentLocation(), Self as ObjectReference, None, 0, 0) ; #DEBUG_LINE_NO:11
    GlobalToSet.SetValue(0.0) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent
