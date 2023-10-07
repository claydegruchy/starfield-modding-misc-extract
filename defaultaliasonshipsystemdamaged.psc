ScriptName DefaultAliasOnShipSystemDamaged Extends ReferenceAlias Const default
{ sets stages when the ship in this alias takes system damage

Actor values for ship systems:
 SpaceshipBuildableEnginePower
 SpaceshipBuildableThrusterPower
 SpaceshipBuildableShieldPower
 SpaceshipGravJumpPower }

;-- Structs -----------------------------------------
Struct SystemDamageStage
  Int StageToSet
  { Stage to Set }
  ActorValue TargetSystem
  { The ship system we're interested in }
  Bool SetStageOnlyWhenFullyDamaged
  { OPTIONAL - (Default: false) if true, stage will be set only when this system is fully damaged. If false, stage will be set when this system takes any damage }
  Bool SetStageOnlyFromNormalDamage
  { OPTIONAL - (Default: false) If true, stage will be set only when this system takes "normal" (non-EM weapon) damage. If false, stage will be set when this system takes damage including EM damage }
  Int PrereqStage = -1
  { OPTIONAL - Stage that must be set for this script's functionality to execute for this case }
  Int TurnOffStage = -1
  { OPTIONAL - If stage >= TurnOffStage, this script's functionality is ignored for this case }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group SystemDamage_Properties
  defaultaliasonshipsystemdamaged:systemdamagestage[] Property SystemDamageStages Auto Const
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

Event OnShipSystemDamaged(ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:55
  If (PrereqStage == -1 || myQuest.GetStageDone(PrereqStage)) && (TurnOffStage == -1 || myQuest.GetStage() < TurnOffStage) ; #DEBUG_LINE_NO:57
    Int I = 0 ; #DEBUG_LINE_NO:60
    While I < SystemDamageStages.Length ; #DEBUG_LINE_NO:61
      defaultaliasonshipsystemdamaged:systemdamagestage theSystemDamage = SystemDamageStages[I] ; #DEBUG_LINE_NO:62
      If theSystemDamage.TargetSystem == akSystem ; #DEBUG_LINE_NO:63
        If myQuest.GetStageDone(theSystemDamage.StageToSet) == False && (theSystemDamage.PrereqStage == -1 || myQuest.GetStageDone(theSystemDamage.PrereqStage)) && (theSystemDamage.TurnOffStage == -1 || myQuest.GetStage() < theSystemDamage.TurnOffStage) ; #DEBUG_LINE_NO:64
          If theSystemDamage.SetStageOnlyFromNormalDamage == False || aElectromagneticDamage == False ; #DEBUG_LINE_NO:66
            If theSystemDamage.SetStageOnlyWhenFullyDamaged == False || aFullyDamaged ; #DEBUG_LINE_NO:67
              defaultscriptfunctions.TryToSetStage(Self as ScriptObject, ShowTraces, myQuest, theSystemDamage.StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, None, False, None, None, None, None, None, None, None, False, None, False, None) ; #DEBUG_LINE_NO:68,72
            EndIf ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:98
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
