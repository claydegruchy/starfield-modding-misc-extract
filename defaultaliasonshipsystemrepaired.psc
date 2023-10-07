ScriptName DefaultAliasOnShipSystemRepaired Extends ReferenceAlias Const default
{ sets stages when the ship in this alias repairs system damage

Actor values for ship systems:
 SpaceshipBuildableEnginePower
 SpaceshipBuildableThrusterPower
 SpaceshipBuildableShieldPower
 SpaceshipGravJumpPower }

;-- Structs -----------------------------------------
Struct SystemRepairStage
  Int StageToSet
  { Stage to Set }
  ActorValue TargetSystem
  { The ship system we're interested in }
  Bool SetStageOnlyFromNormalDamage
  { (Default: false) If true, stage will be set only when this system repairs "real" (non-EM weapon) damage. If false, stage will be set when this system repairs any damage including EM damage }
  Int PrereqStage = -1
  { OPTIONAL - Stage that must be set for this script's functionality to execute for this case }
  Int TurnOffStage = -1
  { OPTIONAL - If stage >= TurnOffStage, this script's functionality is ignored for this case }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group SystemDamage_Properties
  defaultaliasonshipsystemrepaired:systemrepairstage[] Property SystemRepairStages Auto Const
  { array of stage/system data }
EndGroup

Group Optional_Properties
  Int Property PrereqStage = -1 Auto Const
  { Stage that must be set for this script's functionality to execute }
  Int Property TurnOffStage = -1 Auto Const
  { If stage >= TurnOffStage, this script's functionality is ignored }
  Int Property TurnOffStageDone = -1 Auto Const
  { If this stage is specfically done, this script's functionality is ignored }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnShipSystemRepaired(ActorValue akSystem, Int aBlocksGained, Bool aElectromagneticDamage)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:51
  If (PrereqStage == -1 || myQuest.GetStageDone(PrereqStage)) && (TurnOffStage == -1 || myQuest.GetStage() < TurnOffStage) ; #DEBUG_LINE_NO:53
    Int I = 0 ; #DEBUG_LINE_NO:56
    While I < SystemRepairStages.Length ; #DEBUG_LINE_NO:57
      defaultaliasonshipsystemrepaired:systemrepairstage theSystemRepair = SystemRepairStages[I] ; #DEBUG_LINE_NO:58
      If theSystemRepair.TargetSystem == akSystem ; #DEBUG_LINE_NO:59
        If myQuest.GetStageDone(theSystemRepair.StageToSet) == False && (theSystemRepair.PrereqStage == -1 || myQuest.GetStageDone(theSystemRepair.PrereqStage)) && (theSystemRepair.TurnOffStage == -1 || myQuest.GetStage() < theSystemRepair.TurnOffStage) ; #DEBUG_LINE_NO:60
          If theSystemRepair.SetStageOnlyFromNormalDamage == False || aElectromagneticDamage == False ; #DEBUG_LINE_NO:62
            defaultscriptfunctions.TryToSetStage(Self as ScriptObject, ShowTraces, myQuest, theSystemRepair.StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, None, False, None, None, None, None, None, None, None, False, None, False, None) ; #DEBUG_LINE_NO:63,67
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:91
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
