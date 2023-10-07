ScriptName POI004_SwapCreatureScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool swapActivated = False

;-- Properties --------------------------------------
Keyword Property POI004_MoltingShellKeyword Auto Const
Keyword Property POI004_HiddenCreatureKeyword Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && !swapActivated ; #DEBUG_LINE_NO:9
    ObjectReference moltingShell = Self.GetLinkedRef(POI004_MoltingShellKeyword) ; #DEBUG_LINE_NO:10
    ObjectReference hiddenCreature = Self.GetLinkedRef(POI004_HiddenCreatureKeyword) ; #DEBUG_LINE_NO:11
    moltingShell.Disable(False) ; #DEBUG_LINE_NO:13
    hiddenCreature.Enable(False) ; #DEBUG_LINE_NO:14
    swapActivated = True ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndEvent
