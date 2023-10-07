ScriptName ENV_Hazard_Parent_PoolScript Extends ENV_Hazard_ParentScript Const
{ see also: ENV_Hazard_ParentScript
Attach this script to the Packin's PrefabPackinPivotDummy reference.
And make sure all the refs in the packin are LinkedRef'd with keyword ENV_Link_PackinMember to the PrefabPackinPivotDummy (that this script is on) }

;-- Variables ---------------------------------------
Int ChanceAmbientFX = 50 Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RollAndSetAmbientEnableState(ChanceAmbientFX) ; #DEBUG_LINE_NO:13
EndEvent

Function RollAndSetAmbientEnableState(Int Chance)
  ObjectReference[] ambientFXRefs = Self.GetPackinChildren() ; #DEBUG_LINE_NO:18
  ambientFXRefs = commonarrayfunctions.GetReferencesWithMatchingKeyword(ambientFXRefs, ENV_FXType_Ambient) ; #DEBUG_LINE_NO:22
  Int I = 0 ; #DEBUG_LINE_NO:26
  While I < ambientFXRefs.Length ; #DEBUG_LINE_NO:27
    If Game.GetDieRollSuccess(Chance, 1, 100, -1, -1) ; #DEBUG_LINE_NO:28
      ambientFXRefs[I].EnableNoWait(False) ; #DEBUG_LINE_NO:30
    Else ; #DEBUG_LINE_NO:
      ambientFXRefs[I].DisableNoWait(False) ; #DEBUG_LINE_NO:33
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:36
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DebugEnableAllAmbientFX()
  Self.Trace(Self as ScriptObject, "DebugEnableAllAmbientFX()", 0, "EnvironmentalGameplay", "ENV_Hazard_ParentScript", False, False, True) ; #DEBUG_LINE_NO:43
  Self.RollAndSetAmbientEnableState(100) ; #DEBUG_LINE_NO:44
EndFunction

Function DebugDisableAllAmbientFX()
  Self.Trace(Self as ScriptObject, "DebugDisableAllAmbientFX()", 0, "EnvironmentalGameplay", "ENV_Hazard_ParentScript", False, False, True) ; #DEBUG_LINE_NO:48
  Self.RollAndSetAmbientEnableState(0) ; #DEBUG_LINE_NO:49
EndFunction
