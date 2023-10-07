ScriptName RL036MusicControl Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property RL036_EnableMusic Auto Const
Keyword Property LinkedRefKeywordMusic Auto Const
Keyword Property LinkedRefKeywordEnemies Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If Self.GetLinkedRef(LinkedRefKeywordEnemies).IsDisabled() ; #DEBUG_LINE_NO:9
    Self.GetLinkedRef(LinkedRefKeywordEnemies).Enable(False) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetLinkedRef(LinkedRefKeywordMusic).IsDisabled() ; #DEBUG_LINE_NO:13
    Self.GetLinkedRef(LinkedRefKeywordMusic).Enable(False) ; #DEBUG_LINE_NO:14
  Else ; #DEBUG_LINE_NO:
    Self.GetLinkedRef(LinkedRefKeywordMusic).Disable(False) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndEvent
