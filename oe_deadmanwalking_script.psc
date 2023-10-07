ScriptName OE_DeadManWalking_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group General
  Int Property InfectionStage = 300 Auto Const
EndGroup

Group Autofill
  sq_env_afflictionsscript Property ENV_AfflictionsScript Auto Const mandatory
  env_afflictionscript Property ENV_AFFL_Infection_LungInfection Auto Const mandatory
  env_afflictionscript Property ENV_AFFL_Infection_BrainInfection Auto Const mandatory
  env_afflictionscript Property ENV_AFFL_Infection_IntestinalInfection Auto Const mandatory
  ReferenceAlias Property Alias_Colonist Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Self as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:16
EndEvent

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == InfectionStage ; #DEBUG_LINE_NO:20
    Self.InfectPlayer() ; #DEBUG_LINE_NO:21
    Self.UnregisterForRemoteEvent(Self as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function InfectPlayer()
  ENV_AFFL_Infection_LungInfection.Gain(False, False) ; #DEBUG_LINE_NO:31
  If Self.GetStageDone(600) ; #DEBUG_LINE_NO:34
    ENV_AFFL_Infection_BrainInfection.Gain(False, False) ; #DEBUG_LINE_NO:35
    ENV_AFFL_Infection_IntestinalInfection.Gain(False, False) ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
  Alias_Colonist.GetActorRef().SetProtected(False) ; #DEBUG_LINE_NO:39
  Alias_Colonist.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:40
EndFunction
