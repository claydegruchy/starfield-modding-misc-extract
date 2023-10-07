ScriptName LC088QuestScript Extends Quest
{ Quest script for LC088, the Crimson Fleet Final Battle. }

;-- Variables ---------------------------------------
Int CONST_CaptainState_Active = 0 Const
Int CONST_CaptainState_Dead = 2 Const
Int CONST_CaptainState_Freed = 4 Const
Int CONST_CaptainState_Imprisoned = 3 Const
Int CONST_CaptainState_Inactive = 1 Const
Int CONST_EstelleDifficulty_Default = 3 Const
Int CONST_LC088Space_DebugModeStage = 30 Const
Int CONST_LC088Space_PlayerSetupDoneStage = 32 Const

;-- Properties --------------------------------------
Group AutofillProperties
  Quest Property LC088_Space Auto Const mandatory
  Quest Property LC088_Vigilance Auto Const mandatory
  Quest Property LC088_Key Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Mathis Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Adler Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainStateDifficulty_Estelle Auto Const mandatory
  ActorValue Property CFSD01EvidenceTotal Auto Const mandatory
  ActorValue Property CFSD01EvidenceMax Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function QuickstartSpace(Int stage, Int missingEvidenceFragments, Int rokovState, Int mathisState, Int naevaState, Int adlerState, Int huanState, Int estelleState, Int estelleDifficulty)
  Self.Start() ; #DEBUG_LINE_NO:38
  Self.UpdateCaptainStates(rokovState, mathisState, naevaState, adlerState, huanState, estelleState, estelleDifficulty) ; #DEBUG_LINE_NO:39
  Game.GetPlayer().SetValue(CFSD01EvidenceTotal, Math.Max(0.0, Game.GetPlayer().GetValue(CFSD01EvidenceMax) - missingEvidenceFragments as Float)) ; #DEBUG_LINE_NO:40
  LC088_Space.SetStage(stage) ; #DEBUG_LINE_NO:41
EndFunction

Function QuickstartVigilance(Int stage, Int rokovState, Int mathisState, Int naevaState, Int adlerState, Int huanState, Int estelleState, Int estelleDifficulty)
  Self.Start() ; #DEBUG_LINE_NO:46
  Self.UpdateCaptainStates(rokovState, mathisState, naevaState, adlerState, huanState, estelleState, estelleDifficulty) ; #DEBUG_LINE_NO:47
  LC088_Vigilance.SetStage(stage) ; #DEBUG_LINE_NO:48
EndFunction

Function QuickstartKey(Int stage, Int rokovState, Int mathisState, Int naevaState, Int adlerState, Int huanState, Int estelleState, Int estelleDifficulty)
  Self.Start() ; #DEBUG_LINE_NO:53
  Self.UpdateCaptainStates(rokovState, mathisState, naevaState, adlerState, huanState, estelleState, estelleDifficulty) ; #DEBUG_LINE_NO:54
  LC088_Key.SetStage(stage) ; #DEBUG_LINE_NO:55
EndFunction

Function UpdateCaptainStates(Int rokovState, Int mathisState, Int naevaState, Int adlerState, Int huanState, Int estelleState, Int estelleDifficulty)
  CrimsonFleetCaptainState_Rokov.SetValue(rokovState as Float) ; #DEBUG_LINE_NO:60
  CrimsonFleetCaptainState_Mathis.SetValue(mathisState as Float) ; #DEBUG_LINE_NO:61
  CrimsonFleetCaptainState_Naeva.SetValue(naevaState as Float) ; #DEBUG_LINE_NO:62
  CrimsonFleetCaptainState_Adler.SetValue(adlerState as Float) ; #DEBUG_LINE_NO:63
  CrimsonFleetCaptainState_Huan.SetValue(huanState as Float) ; #DEBUG_LINE_NO:64
  CrimsonFleetCaptainState_Estelle.SetValue(estelleState as Float) ; #DEBUG_LINE_NO:65
  If estelleDifficulty == 0 ; #DEBUG_LINE_NO:66
    estelleDifficulty = CONST_EstelleDifficulty_Default ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
  CrimsonFleetCaptainStateDifficulty_Estelle.SetValue(estelleDifficulty as Float) ; #DEBUG_LINE_NO:69
EndFunction
