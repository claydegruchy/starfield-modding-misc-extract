ScriptName DefaultAliasChangeAVOnInit Extends ReferenceAlias
{ Sets, mods, or damages one or more actor values on load, once only. }

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
defaultaliaschangeavoninit:actorvaluedatum[] Property ActorValueData Auto Const mandatory
{ Struct of actor values to be changed. }

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnAliasInit()
    Self.GoToState("Done") ; #DEBUG_LINE_NO:24
    ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:25
    If myRef == None ; #DEBUG_LINE_NO:26
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Int I = 0 ; #DEBUG_LINE_NO:29
      While I < ActorValueData.Length ; #DEBUG_LINE_NO:30
        defaultaliaschangeavoninit:actorvaluedatum current = ActorValueData[I] ; #DEBUG_LINE_NO:31
        If current.TypeOfChange == CONST_TypeOfChange_Set ; #DEBUG_LINE_NO:32
          myRef.SetValue(current.ActorValueToChange, current.NewValue) ; #DEBUG_LINE_NO:33
        ElseIf current.TypeOfChange == CONST_TypeOfChange_Mod ; #DEBUG_LINE_NO:34
          myRef.ModValue(current.ActorValueToChange, current.NewValue) ; #DEBUG_LINE_NO:35
        ElseIf current.TypeOfChange == CONST_TypeOfChange_Damage ; #DEBUG_LINE_NO:36
          myRef.DamageValue(current.ActorValueToChange, current.NewValue) ; #DEBUG_LINE_NO:37
        ElseIf current.TypeOfChange == CONST_TypeOfChange_Restore ; #DEBUG_LINE_NO:38
          myRef.RestoreValue(current.ActorValueToChange, current.NewValue) ; #DEBUG_LINE_NO:39
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:41
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
