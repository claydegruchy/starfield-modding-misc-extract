ScriptName DefaultRefEffectShader Extends ObjectReference Const default
{ Default script used for applying an effect shader on the reference when it loads loads into a cell, or when the cell loads around it. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
EffectShader Property FXS Auto Const
Bool Property ApplyOnLoad Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If ApplyOnLoad ; #DEBUG_LINE_NO:8
    FXS.Play(Self as ObjectReference, -1.0) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
