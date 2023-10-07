ScriptName DefaultSetGlobalOnTriggerLeave Extends ObjectReference Const
{ Set a global to a specific value when this trigger is left by the player. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property GlobalToSet Auto Const
{ The Global we want to set to NumToSetGlobalTo }
Float Property NumToSetGlobalTo Auto Const
{ The number we want to set GlobalToSet to. }

;-- Functions ---------------------------------------

Event OnTriggerLeave(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:11
    GlobalToSet.SetValue(NumToSetGlobalTo) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent
