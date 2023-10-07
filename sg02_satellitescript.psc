ScriptName SG02_SatelliteScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property ShutdownStage Auto Const
{ If this stage is set, stop trying to destroy this object }
Bool Property DamageOnce = False Auto
{ Make sure we're only damaging this object the first time it loads in }

;-- Functions ---------------------------------------

Event OnLoad()
  If !DamageOnce && !Self.GetOwningQuest().GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:12
    DamageOnce = True ; #DEBUG_LINE_NO:13
    Self.GetRef().TryToSetEssential(True) ; #DEBUG_LINE_NO:14
    Self.GetRef().DamageObject(1.799999952) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Fix()
  Self.GetRef().Repair() ; #DEBUG_LINE_NO:20
EndFunction
