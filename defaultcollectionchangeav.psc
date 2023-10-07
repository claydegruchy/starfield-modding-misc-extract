ScriptName DefaultCollectionChangeAV Extends RefCollectionAlias default
{ Sets, mods, or damages one or more actor values when references are added to this collection. }

;-- Structs -----------------------------------------
Struct ActorValueDatum
  ActorValue ActorValueToChange
  { An actor value to change. }
  Float NewValue
  { The amount to set this actor value to, mod the value by, or damage the value by. }
  Int TypeOfChange
  { DEFAULT=0. 0=Set, 1=Mod, 2=Damage, 3=Restore }
EndStruct


;-- Variables ---------------------------------------
Int CONST_TypeOfChange_Damage = 2 Const
Int CONST_TypeOfChange_Mod = 1 Const
Int CONST_TypeOfChange_Restore = 3 Const
Int CONST_TypeOfChange_Set = 0 Const

;-- Properties --------------------------------------
defaultcollectionchangeav:actorvaluedatum[] Property ActorValueData Auto Const mandatory
{ Struct of actor values to be changed. }

;-- Functions ---------------------------------------

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If !abRemove ; #DEBUG_LINE_NO:23
    Int I = 0 ; #DEBUG_LINE_NO:24
    While I < ActorValueData.Length ; #DEBUG_LINE_NO:25
      defaultcollectionchangeav:actorvaluedatum current = ActorValueData[I] ; #DEBUG_LINE_NO:26
      If current.TypeOfChange == CONST_TypeOfChange_Set ; #DEBUG_LINE_NO:27
        akObject.SetValue(current.ActorValueToChange, current.NewValue) ; #DEBUG_LINE_NO:28
      ElseIf current.TypeOfChange == CONST_TypeOfChange_Mod ; #DEBUG_LINE_NO:29
        akObject.ModValue(current.ActorValueToChange, current.NewValue) ; #DEBUG_LINE_NO:30
      ElseIf current.TypeOfChange == CONST_TypeOfChange_Damage ; #DEBUG_LINE_NO:31
        akObject.DamageValue(current.ActorValueToChange, current.NewValue) ; #DEBUG_LINE_NO:32
      ElseIf current.TypeOfChange == CONST_TypeOfChange_Restore ; #DEBUG_LINE_NO:33
        akObject.RestoreValue(current.ActorValueToChange, current.NewValue) ; #DEBUG_LINE_NO:34
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:36
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
