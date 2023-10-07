ScriptName OpenInventoryInfoScript Extends TopicInfo Const
{ opens actor's inventory on the info OnEnd event }

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If Utility.IsGameMenuPaused() == False ; #DEBUG_LINE_NO:7
    Utility.wait(0.200000003) ; #DEBUG_LINE_NO:9
    If akSpeakerRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:10
      (akSpeakerRef as Actor).GetDialogueTarget().OpenInventory(True, None, True) ; #DEBUG_LINE_NO:11
    Else ; #DEBUG_LINE_NO:
      (akSpeakerRef as Actor).OpenInventory(True, None, True) ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
