ScriptName SEDebugScript Extends Quest
{ Quest script for SEDebug, the Space Encounter Debug quest. }

;-- Structs -----------------------------------------
Struct SEDebugLocationDatum
  String DebugName
  Location DebugLocation
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  ReferenceAlias Property PlayerShip Auto Const mandatory
  GlobalVariable Property SEChanceGlobal Auto Const mandatory
  GlobalVariable Property Se_ChanceRareGlobal Auto Const mandatory
  GlobalVariable Property Se_ChanceUniqueGlobal Auto Const mandatory
  GlobalVariable Property SE_Player_ChanceCommonGlobal Auto Const mandatory
  GlobalVariable Property SE_Player_ChanceRareGlobal Auto Const mandatory
  GlobalVariable Property SE_Player_ChanceUniqueGlobal Auto Const mandatory
  GlobalVariable Property SEDebugGlobal Auto Const mandatory
  GlobalVariable Property SE_SystemCountChance Auto Const mandatory
  GlobalVariable Property SE_Chance_CivilizedInUncivilizedSpace Auto Const mandatory
  GlobalVariable Property SE_Chance_UncivilizedInCivilizedSpace Auto Const mandatory
EndGroup

sedebugscript:sedebuglocationdatum[] Property SEDebugData Auto Const mandatory

;-- Functions ---------------------------------------

Function TestSE(String questName, String locationName)
  SEChanceGlobal.SetValue(100.0) ; #DEBUG_LINE_NO:28
  Se_ChanceRareGlobal.SetValue(100.0) ; #DEBUG_LINE_NO:29
  Se_ChanceUniqueGlobal.SetValue(100.0) ; #DEBUG_LINE_NO:30
  SE_Player_ChanceCommonGlobal.SetValue(100.0) ; #DEBUG_LINE_NO:31
  SE_Player_ChanceRareGlobal.SetValue(100.0) ; #DEBUG_LINE_NO:32
  SE_Player_ChanceUniqueGlobal.SetValue(100.0) ; #DEBUG_LINE_NO:33
  SE_SystemCountChance.SetValue(0.0) ; #DEBUG_LINE_NO:34
  If locationName == "" || locationName == "0" ; #DEBUG_LINE_NO:44
    spaceshipreference currentShip = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:45
    Int I = 0 ; #DEBUG_LINE_NO:46
    While I < SEDebugData.Length ; #DEBUG_LINE_NO:47
      If currentShip.GetCurrentLocation() != SEDebugData[I].DebugLocation ; #DEBUG_LINE_NO:48
        Return  ; #DEBUG_LINE_NO:50
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:52
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.Reset() ; #DEBUG_LINE_NO:58
EndFunction

Function TestFAB09(String locationName)
  SEChanceGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:65
  Se_ChanceRareGlobal.SetValue(100.0) ; #DEBUG_LINE_NO:66
  Se_ChanceUniqueGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:67
  SE_Player_ChanceCommonGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:68
  SE_Player_ChanceRareGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:69
  SE_Player_ChanceUniqueGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:70
  If locationName == "" || locationName == "0" ; #DEBUG_LINE_NO:75
    spaceshipreference currentShip = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:76
    Int I = 0 ; #DEBUG_LINE_NO:77
    While I < SEDebugData.Length ; #DEBUG_LINE_NO:78
      If currentShip.GetCurrentLocation() != SEDebugData[I].DebugLocation ; #DEBUG_LINE_NO:79
        Return  ; #DEBUG_LINE_NO:81
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:83
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
