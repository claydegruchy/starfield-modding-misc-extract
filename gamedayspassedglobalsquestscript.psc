ScriptName GameDaysPassedGlobalsQuestScript Extends Quest Const default
{ Used to set globalvariables in terms of gamedays passed. 
Useful for story manager and dialogue conditions like:
GetGlobalValue NextAllowed <= GameDaysPassed }

;-- Structs -----------------------------------------
Struct GlobalsDatum
  Int QuestStage
  { When this quest stage is set, set NextAllowed to GameDaysPassed + DaysToAdd }
  GlobalVariable NextAllowed
  { Global we are setting }
  GlobalVariable DaysToAdd
  { Global representing how many days to add to current GameDaysPassed before storing in NextAllowed
Hours and minutes expressed as GameDaysPassed:
Hour: 1/24 = .04167
Minute: 1/(24*60) = .0006945 
So to add 4 hours would be (.04167 * 4) = 0.17

(Note: We are using another global for DaysToAdd assuming this is for systemic things and thus more convenient to use a globalvariable rather than a float) }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
gamedayspassedglobalsquestscript:globalsdatum[] Property GameDaysPassedGlobalsAndQuestStages Auto Const
{ Holds quest stages and globals to set with GameDaysPassed }

;-- Functions ---------------------------------------

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiItemID == 0 ; #DEBUG_LINE_NO:29
    Int I = GameDaysPassedGlobalsAndQuestStages.findstruct("QuestStage", auiStageID, 0) ; #DEBUG_LINE_NO:31
    While I >= 0 ; #DEBUG_LINE_NO:32
      gamedayspassedglobalsquestscript:globalsdatum CurrentGlobalDatum = GameDaysPassedGlobalsAndQuestStages[I] ; #DEBUG_LINE_NO:33
      CurrentGlobalDatum.NextAllowed.SetValue(Utility.GetCurrentGameTime() + CurrentGlobalDatum.DaysToAdd.GetValue()) ; #DEBUG_LINE_NO:34
      If I + 1 < GameDaysPassedGlobalsAndQuestStages.Length ; #DEBUG_LINE_NO:36
        I = GameDaysPassedGlobalsAndQuestStages.findstruct("QuestStage", auiStageID, I + 1) ; #DEBUG_LINE_NO:37
      Else ; #DEBUG_LINE_NO:
        I = -1 ; #DEBUG_LINE_NO:39
      EndIf ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
