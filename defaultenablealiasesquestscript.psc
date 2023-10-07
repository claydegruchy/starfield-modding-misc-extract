ScriptName DefaultEnableAliasesQuestScript Extends Quest Const default
{ enabled aliases on start or quest stages }

;-- Structs -----------------------------------------
Struct AliasEnableDatum
  Alias AliasToEnable
  Int StageToEnable = -1
  { Stage to enable, if -1 (default) will enable at quest start }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
defaultenablealiasesquestscript:aliasenabledatum[] Property AliasEnableData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.EnableAliasByStage(-1) ; #DEBUG_LINE_NO:13
EndEvent

Event OnStageSet(Int auiStageID, Int auiItemID)
  Self.EnableAliasByStage(auiStageID) ; #DEBUG_LINE_NO:17
EndEvent

Function EnableAliasByStage(Int EnableStage)
  defaultenablealiasesquestscript:aliasenabledatum[] enableData = AliasEnableData.GetMatchingStructs("StageToEnable", EnableStage, 0, -1) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs  ; #DEBUG_LINE_NO:21
  Int I = 0 ; #DEBUG_LINE_NO:23
  While I < enableData.Length ; #DEBUG_LINE_NO:24
    defaultenablealiasesquestscript:aliasenabledatum currentDatum = enableData[I] ; #DEBUG_LINE_NO:25
    ReferenceAlias ReferenceAliasToEnable = currentDatum.AliasToEnable as ReferenceAlias ; #DEBUG_LINE_NO:27
    If ReferenceAliasToEnable ; #DEBUG_LINE_NO:29
      ReferenceAliasToEnable.TryToEnable() ; #DEBUG_LINE_NO:30
    Else ; #DEBUG_LINE_NO:
      RefCollectionAlias RefCollectionAliasToEnable = currentDatum.AliasToEnable as RefCollectionAlias ; #DEBUG_LINE_NO:32
      If RefCollectionAliasToEnable ; #DEBUG_LINE_NO:34
        RefCollectionAliasToEnable.EnableAll(False) ; #DEBUG_LINE_NO:35
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:39
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
