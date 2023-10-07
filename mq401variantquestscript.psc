ScriptName MQ401VariantQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias[] Property RefAliasesToEnableArray Auto Const
Bool Property MQ402NoLodgeArtifacts Auto Const
GlobalVariable Property MQ401_NoLodgeArtifacts Auto Const mandatory
Int Property QuestInitStage = 10 Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  If RefAliasesToEnableArray != None ; #DEBUG_LINE_NO:10
    Self.EnableQuestActors() ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
  If MQ402NoLodgeArtifacts ; #DEBUG_LINE_NO:15
    MQ401_NoLodgeArtifacts.SetValueInt(1) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(QuestInitStage) ; #DEBUG_LINE_NO:19
EndEvent

Function EnableQuestActors()
  Int currentElement = 0 ; #DEBUG_LINE_NO:23
  While currentElement < RefAliasesToEnableArray.Length ; #DEBUG_LINE_NO:24
    RefAliasesToEnableArray[currentElement].GetActorRef().Enable(False) ; #DEBUG_LINE_NO:25
    currentElement += 1 ; #DEBUG_LINE_NO:26
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
