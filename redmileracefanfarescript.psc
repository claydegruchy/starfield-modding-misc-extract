ScriptName RedMileRaceFanfareScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property Speed Auto
RefCollectionAlias Property Alias_LightRotationHelpers Auto Const mandatory

;-- Functions ---------------------------------------

Function StopFanfare()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function StartDoorOpenFanfare()
  Int I = 0 ; #DEBUG_LINE_NO:8
  ObjectReference[] LightRotationHelpers = None ; #DEBUG_LINE_NO:9
  LightRotationHelpers = Alias_LightRotationHelpers.GetArray() ; #DEBUG_LINE_NO:10
  While I < LightRotationHelpers.Length ; #DEBUG_LINE_NO:12
    LightRotationHelpers[I].SetAnimationVariableFloat("Speed", Speed) ; #DEBUG_LINE_NO:13
    LightRotationHelpers[I].PlayAnimation("RotateCW_Loop") ; #DEBUG_LINE_NO:14
    I += 1 ; #DEBUG_LINE_NO:15
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
