ScriptName ReactorFloorMidA01Script Extends ObjectReference
{ Script for the ReactorFloorMidA01 object. }

;-- Variables ---------------------------------------
String CONST_Animation_Active = "Play02" Const
String CONST_Animation_Inactive = "Play01" Const
Int CONST_DestroyedStateDamage = 1000 Const
Int CONST_ReactorState_Active = 0 Const
Int CONST_ReactorState_Destroyed = 2 Const
Int CONST_ReactorState_Inactive = 1 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ReactorStateGuard

;-- Properties --------------------------------------
Int Property ReactorState = 0 Auto
{ DEFAULT=0. The state of the Reactor. 0=Active, 1=Inactive, 2=Destroyed. }

;-- Functions ---------------------------------------

Event OnCellLoad()
  Guard ReactorStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:20
    Self.SetReactorState(ReactorState, True) ; #DEBUG_LINE_NO:21
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Function SetReactorState(Int newState, Bool forceUpdate)
  Guard ReactorStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:26
    If forceUpdate || newState != ReactorState ; #DEBUG_LINE_NO:27
      ReactorState = newState ; #DEBUG_LINE_NO:28
      If ReactorState == CONST_ReactorState_Active ; #DEBUG_LINE_NO:29
        Self.ClearDestruction() ; #DEBUG_LINE_NO:30
        If Self.Is3DLoaded() ; #DEBUG_LINE_NO:31
          Self.PlayAnimation(CONST_Animation_Active) ; #DEBUG_LINE_NO:32
        EndIf ; #DEBUG_LINE_NO:
      ElseIf ReactorState == CONST_ReactorState_Inactive ; #DEBUG_LINE_NO:34
        Self.ClearDestruction() ; #DEBUG_LINE_NO:35
        If Self.Is3DLoaded() ; #DEBUG_LINE_NO:36
          Self.PlayAnimation(CONST_Animation_Inactive) ; #DEBUG_LINE_NO:37
        EndIf ; #DEBUG_LINE_NO:
      ElseIf ReactorState == CONST_ReactorState_Destroyed ; #DEBUG_LINE_NO:39
        If Self.Is3DLoaded() ; #DEBUG_LINE_NO:40
          Self.DamageObject(CONST_DestroyedStateDamage as Float) ; #DEBUG_LINE_NO:41
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction
