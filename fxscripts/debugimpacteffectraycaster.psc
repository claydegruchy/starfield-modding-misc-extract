ScriptName FXScripts:DebugImpactEffectRaycaster Extends ObjectReference
{ Test script for ImpactEffect Object. }

;-- Variables ---------------------------------------
Int ImpactTimer = 10
ObjectReference ObjRef
Bool bPlayImpactEffects = False

;-- Properties --------------------------------------
ImpactDataSet Property ImpactEffectRef01 Auto Const mandatory
{ The impact set that will be spawned from the ship thrusters. }
ImpactDataSet Property ImpactEffectRef02 Auto Const mandatory
{ The impact set that will be spawned very close from the ship thrusters. }
ImpactDataSet Property ImpactEffectRef03 Auto Const mandatory
{ The impact set that will be spawned very close from the ship thrusters. }
Float Property ImpactRecastDelay = 0.100000001 Auto Const
Float Property Impact01Range = 50.0 Auto Const
Float Property Impact02Range = 15.0 Auto Const
Float Property Impact03Range = 20.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If !Self.IsDisabled() ; #DEBUG_LINE_NO:27
    bPlayImpactEffects = True ; #DEBUG_LINE_NO:28
    Self.StartTimer(ImpactRecastDelay, ImpactTimer) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnLoad()
  bPlayImpactEffects = False ; #DEBUG_LINE_NO:34
EndEvent

Event OnTimer(Int aiTimerID)
  If Self.IsDisabled() ; #DEBUG_LINE_NO:38
    bPlayImpactEffects = False ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
  If aiTimerID == ImpactTimer ; #DEBUG_LINE_NO:41
    If bPlayImpactEffects == True ; #DEBUG_LINE_NO:42
      Self.PlayImpactEffect(ImpactEffectRef01, "", 0.0, 0.0, -1.0, Impact01Range, True, False) ; #DEBUG_LINE_NO:43
      Self.PlayImpactEffect(ImpactEffectRef02, "", 0.0, 0.0, -1.0, Impact02Range, True, False) ; #DEBUG_LINE_NO:44
      Self.PlayImpactEffect(ImpactEffectRef03, "", 0.0, 0.0, -1.0, Impact03Range, True, False) ; #DEBUG_LINE_NO:45
      Self.StartTimer(ImpactRecastDelay, ImpactTimer) ; #DEBUG_LINE_NO:46
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
