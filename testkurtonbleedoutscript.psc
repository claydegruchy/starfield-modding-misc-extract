ScriptName TestKurtOnBleedoutScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property StoryEventKeyword Auto Const

;-- Functions ---------------------------------------

Event OnRecoverFromBleedout()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterBleedout()
  If StoryEventKeyword ; #DEBUG_LINE_NO:7
    StoryEventKeyword.SendStoryEvent(None, Self as ObjectReference, None, 0, 0) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
