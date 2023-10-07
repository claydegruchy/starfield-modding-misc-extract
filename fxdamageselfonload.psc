ScriptName FXDamageSelfOnLoad Extends ObjectReference Const
{ Damage Self On load. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property DamageAmount = 1.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:8
    Self.DamageObject(DamageAmount) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
