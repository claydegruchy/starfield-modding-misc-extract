ScriptName City_GG_Connect_NodeRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property City_GG_Connect_ActiveScanner_Keyword Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If !Self.HasKeyword(City_GG_Connect_ActiveScanner_Keyword) ; #DEBUG_LINE_NO:6
    Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:7
  EndIf ; #DEBUG_LINE_NO:
EndEvent
