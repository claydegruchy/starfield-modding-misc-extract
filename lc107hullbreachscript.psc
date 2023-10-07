ScriptName LC107HullBreachScript Extends ObjectReference
{ Script for the Hull Breach Packins in LC107. }

;-- Variables ---------------------------------------
Int CONST_DamageObjectHealth = 1 Const

;-- Properties --------------------------------------
Group AutofillProperties collapsedonref
  lc107questscript Property LC107 Auto Const mandatory
  GlobalVariable Property LC107VaultInstantBreachesCurrentGlobal Auto Const mandatory
  Keyword Property LC107_LinkHullBreach Auto Const mandatory
  Keyword Property LinkCustom01 Auto Const mandatory
  Keyword Property LinkCustom02 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function InitHullBreach()
  Self.GoToState("WaitingForBreach") ; #DEBUG_LINE_NO:85
  ObjectReference hullBreach = Self.GetLinkedRef(LC107_LinkHullBreach) ; #DEBUG_LINE_NO:87
  hullBreach.EnableNoWait(False) ; #DEBUG_LINE_NO:88
  hullBreach.DamageObject(CONST_DamageObjectHealth as Float) ; #DEBUG_LINE_NO:89
EndFunction

Function TriggerBreach(Bool isQuestWaitingOnBreach)
  If isQuestWaitingOnBreach ; #DEBUG_LINE_NO:94
    LC107VaultInstantBreachesCurrentGlobal.Mod(1.0) ; #DEBUG_LINE_NO:95
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
State WaitingForBreach

  Function TriggerBreach(Bool isQuestWaitingOnBreach)
    Self.GoToState("Done") ; #DEBUG_LINE_NO:31
    ObjectReference[] myLinkedRefs = Self.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:34
    lc107hullbreachexplosionsourcescript myExplosionSource = None ; #DEBUG_LINE_NO:35
    Int I = 0 ; #DEBUG_LINE_NO:36
    While I < myLinkedRefs.Length && myExplosionSource == None ; #DEBUG_LINE_NO:37
      myExplosionSource = myLinkedRefs[I] as lc107hullbreachexplosionsourcescript ; #DEBUG_LINE_NO:38
      If myExplosionSource != None ; #DEBUG_LINE_NO:39
        myLinkedRefs.remove(I, 1) ; #DEBUG_LINE_NO:40
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:42
    EndWhile ; #DEBUG_LINE_NO:
    If myExplosionSource != None ; #DEBUG_LINE_NO:46
      myExplosionSource.TriggerBreach() ; #DEBUG_LINE_NO:47
    EndIf ; #DEBUG_LINE_NO:
    ObjectReference myBreach = Self.GetLinkedRef(LC107_LinkHullBreach) ; #DEBUG_LINE_NO:51
    myBreach.DamageObject(CONST_DamageObjectHealth as Float) ; #DEBUG_LINE_NO:52
    ObjectReference myVFX = Self.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:53
    myVFX.EnableNoWait(False) ; #DEBUG_LINE_NO:54
    ObjectReference myHazard = Self.GetLinkedRef(LinkCustom02) ; #DEBUG_LINE_NO:55
    myHazard.EnableNoWait(False) ; #DEBUG_LINE_NO:56
    If isQuestWaitingOnBreach ; #DEBUG_LINE_NO:59
      LC107VaultInstantBreachesCurrentGlobal.Mod(1.0) ; #DEBUG_LINE_NO:60
    EndIf ; #DEBUG_LINE_NO:
    I = 0 ; #DEBUG_LINE_NO:64
    While I < myLinkedRefs.Length ; #DEBUG_LINE_NO:65
      If myLinkedRefs[I] != None ; #DEBUG_LINE_NO:66
        If myLinkedRefs[I] as lc107hullbreachexplosionsourcescript != None ; #DEBUG_LINE_NO:67
          (myLinkedRefs[I] as lc107hullbreachexplosionsourcescript).TriggerBreach() ; #DEBUG_LINE_NO:68
        ElseIf myLinkedRefs[I] as trappipespray != None ; #DEBUG_LINE_NO:69
          (myLinkedRefs[I] as trappipespray).BreakPipe() ; #DEBUG_LINE_NO:70
        Else ; #DEBUG_LINE_NO:
          myLinkedRefs[I].EnableNoWait(False) ; #DEBUG_LINE_NO:72
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:75
    EndWhile ; #DEBUG_LINE_NO:
  EndFunction
EndState

;-- State -------------------------------------------
Auto State WaitingForInit

  Function InitHullBreach()
    Self.GoToState("WaitingForBreach") ; #DEBUG_LINE_NO:21
    ObjectReference hullBreach = Self.GetLinkedRef(LC107_LinkHullBreach) ; #DEBUG_LINE_NO:23
    hullBreach.Enable(False) ; #DEBUG_LINE_NO:24
    hullBreach.DamageObject(CONST_DamageObjectHealth as Float) ; #DEBUG_LINE_NO:25
  EndFunction
EndState
