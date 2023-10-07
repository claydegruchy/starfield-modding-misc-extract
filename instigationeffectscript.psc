ScriptName InstigationEffectScript Extends ActiveMagicEffect Const
{ cancel effect on bleedout for essential actors }

;-- Functions ---------------------------------------

Event OnEnterBleedout()
  Actor akTarget = Self.GetTargetActor() ; #DEBUG_LINE_NO:5
  If akTarget as Bool && akTarget.IsEssential() ; #DEBUG_LINE_NO:7
    Self.Dispel() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
