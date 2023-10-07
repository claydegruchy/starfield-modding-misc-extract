ScriptName DefaultCollAliasSendEventOnActivate Extends RefCollectionAlias default
{ Collection Alias sends a keyword when one member is activated by the player. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Data
  Keyword Property KeywordToSend Auto Const mandatory
  { Keyword to send for story event }
EndGroup

Group Optional_Data
  Keyword Property BlockingKeyword Auto Const
  { Check to ensure player doesn't have this keyword before sending event }
  Bool Property ShowTraces Auto Const
  { set to true to see traces. Note, you will need to run with archive builds or locally compailed DefaultScriptFunctions script to see the traces. }
EndGroup


;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef, ObjectReference akActivatorRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:18
    If BlockingKeyword == None || !akActionRef.HasKeyword(BlockingKeyword) ; #DEBUG_LINE_NO:19
      KeywordToSend.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:20
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
