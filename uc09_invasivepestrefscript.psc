ScriptName UC09_InvasivePestRefScript Extends UC09_HeatleechRefScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property ActorTypeHeatleech Auto Const mandatory
{ Heetleech keyword. }

;-- Functions ---------------------------------------

Event OnCellLoad()
  If Self.HasKeyword(ActorTypeHeatleech) ; #DEBUG_LINE_NO:7
    Parent.OnCellLoad() ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
