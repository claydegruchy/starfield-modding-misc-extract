ScriptName TestZachGenericLore Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property GenericLoreTerminalEvent Auto Const mandatory
{ Keyword to start the quest that handles this system }
Quest Property GenericLoreQuest Auto Const mandatory
{ Quest that handles this system }

;-- Functions ---------------------------------------

Event OnCellLoad()
  If GenericLoreQuest.IsRunning() ; #DEBUG_LINE_NO:10
    GenericLoreQuest.Stop() ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
  GenericLoreTerminalEvent.SendStoryEvent(Self.GetCurrentLocation(), Self as ObjectReference, None, 0, 0) ; #DEBUG_LINE_NO:14
EndEvent

Event OnUnload()
  GenericLoreQuest.Stop() ; #DEBUG_LINE_NO:18
EndEvent
