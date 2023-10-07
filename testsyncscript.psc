ScriptName TestSyncScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference theThing = Self as ObjectReference ; #DEBUG_LINE_NO:7
  theThing = Self.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:9
  theThing.SetOpen(False) ; #DEBUG_LINE_NO:11
EndEvent
