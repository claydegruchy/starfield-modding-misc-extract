ScriptName SQ_PlayerClearLocationScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SQ_ClearedLocationCount Auto Const mandatory
{ count how many locations the player has cleared }
Keyword[] Property KeywordsToCheck Auto Const
{ dungeon will be counted if it has any of these keywords }

;-- Functions ---------------------------------------

Event OnStoryExploredLocation(Location akOldLocation)
  Int I = 0 ; #DEBUG_LINE_NO:11
  Bool locationCounts = False ; #DEBUG_LINE_NO:12
  While I < KeywordsToCheck.Length && locationCounts == False ; #DEBUG_LINE_NO:13
    locationCounts = akOldLocation.HasKeyword(KeywordsToCheck[I]) ; #DEBUG_LINE_NO:14
    I += 1 ; #DEBUG_LINE_NO:15
  EndWhile ; #DEBUG_LINE_NO:
  If locationCounts ; #DEBUG_LINE_NO:17
    SQ_ClearedLocationCount.Mod(1.0) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:21
EndEvent
