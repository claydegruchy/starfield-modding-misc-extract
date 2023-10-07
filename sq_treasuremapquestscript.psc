ScriptName SQ_TreasureMapQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TreasureMap Auto Const mandatory
{ used by SQ_TreasureMapScript to swap dummy map with the real map with text replacement created by this quest }
ReferenceAlias Property Treasure Auto Const mandatory
{ Treasure ref passed in via event - needs to be moved to the treasure container on startup }
ReferenceAlias Property TreasureMapOriginal Auto Const mandatory
{ passed in via event - used to get properties for creating treasure }
GlobalVariable Property TreasureMapQuestCount Auto Const mandatory
{ global variable that matches this treasure map type, to keep track of how many quests are currently running }
Int Property ObjectiveID = 10 Auto Const
Int Property ObjectiveStage = 100 Auto Const

;-- Functions ---------------------------------------

Event OnQuestStarted()
  TreasureMapQuestCount.Mod(1.0) ; #DEBUG_LINE_NO:21
  If Self.CreateTreasure() ; #DEBUG_LINE_NO:22
    Self.SetObjectiveDisplayed(ObjectiveID, True, False) ; #DEBUG_LINE_NO:23
  Else ; #DEBUG_LINE_NO:
    Game.GetPlayer().RemoveItem(TreasureMap.GetRef() as Form, 1, True, None) ; #DEBUG_LINE_NO:26
    Self.Stop() ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestShutdown()
  TreasureMapQuestCount.Mod(-1.0) ; #DEBUG_LINE_NO:33
EndEvent

Event OnQuestRejected()
  Self.HandleOnQuestRejected() ; #DEBUG_LINE_NO:37
EndEvent

Function HandleOnQuestRejected()
  Self.SetObjectiveDisplayed(ObjectiveID, False, False) ; #DEBUG_LINE_NO:41
  Self.Stop() ; #DEBUG_LINE_NO:42
EndFunction

Bool Function CreateTreasure()
  Return False ; #DEBUG_LINE_NO:48
EndFunction
