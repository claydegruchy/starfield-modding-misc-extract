ScriptName AirlockControl Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkKeyword1 Auto Const mandatory
Keyword Property LinkKeyword2 Auto Const mandatory
Keyword Property LinkPassOpenCloseEvent Auto Const mandatory
Message Property BusyActivatorMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnInit()
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkKeyword1) as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:12
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkKeyword2) as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:13
  ObjectReference Link1 = Self.GetLinkedRef(LinkKeyword1) ; #DEBUG_LINE_NO:17
  ObjectReference[] LinkedRefs = Link1.GetLinkedRefChain(LinkPassOpenCloseEvent, 100) ; #DEBUG_LINE_NO:18
  ObjectReference Link2 = Self.GetLinkedRef(LinkKeyword2) ; #DEBUG_LINE_NO:19
  ObjectReference[] LinkedRefsToAdd = Link2.GetLinkedRefChain(LinkPassOpenCloseEvent, 100) ; #DEBUG_LINE_NO:20
  Int index = 0 ; #DEBUG_LINE_NO:22
  While index < LinkedRefsToAdd.Length ; #DEBUG_LINE_NO:23
    LinkedRefs.add(LinkedRefsToAdd[index], 1) ; #DEBUG_LINE_NO:24
    index += 1 ; #DEBUG_LINE_NO:25
  EndWhile ; #DEBUG_LINE_NO:
  LinkedRefs.add(Link1, 1) ; #DEBUG_LINE_NO:27
  LinkedRefs.add(Link2, 1) ; #DEBUG_LINE_NO:28
  index = 0 ; #DEBUG_LINE_NO:31
  While index < LinkedRefs.Length ; #DEBUG_LINE_NO:32
    ObjectReference item = LinkedRefs[index] ; #DEBUG_LINE_NO:33
    Self.RegisterForRemoteEvent(item as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:34
    index += 1 ; #DEBUG_LINE_NO:35
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

;-- State -------------------------------------------
State Busy

  Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    akSender.BlockActivation(True, False) ; #DEBUG_LINE_NO:
  EndEvent

  Event OnTimer(Int aiTimerID)
    ObjectReference Link1 = Self.GetLinkedRef(LinkKeyword1) ; #DEBUG_LINE_NO:
    ObjectReference[] LinkedRefs = Link1.GetLinkedRefChain(LinkPassOpenCloseEvent, 100) ; #DEBUG_LINE_NO:
    ObjectReference Link2 = Self.GetLinkedRef(LinkKeyword2) ; #DEBUG_LINE_NO:
    ObjectReference[] LinkedRefsToAdd = Link2.GetLinkedRefChain(LinkPassOpenCloseEvent, 100) ; #DEBUG_LINE_NO:
    Int index = 0 ; #DEBUG_LINE_NO:
    While index < LinkedRefsToAdd.Length ; #DEBUG_LINE_NO:
      LinkedRefs.add(LinkedRefsToAdd[index], 1) ; #DEBUG_LINE_NO:
      index += 1 ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
    LinkedRefs.add(Link1, 1) ; #DEBUG_LINE_NO:
    LinkedRefs.add(Link2, 1) ; #DEBUG_LINE_NO:
    Bool readyToGoIdle = True ; #DEBUG_LINE_NO:
    index = 0 ; #DEBUG_LINE_NO:
    While index < LinkedRefs.Length ; #DEBUG_LINE_NO:
      ObjectReference item = LinkedRefs[index] ; #DEBUG_LINE_NO:
      Int openState = item.GetOpenState() ; #DEBUG_LINE_NO:
      If openState == 2 || openState == 4 ; #DEBUG_LINE_NO:
        readyToGoIdle = False ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      index += 1 ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
    If readyToGoIdle ; #DEBUG_LINE_NO:
      Self.GotoState("Idle") ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(1.0, 0) ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event onBeginState(String asOldState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Idle

  Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    Self.GotoState("Busy") ; #DEBUG_LINE_NO:
    Self.StartTimer(3.0, 0) ; #DEBUG_LINE_NO:
    ObjectReference Sys1Link1 = Self.GetLinkedRef(LinkKeyword1) ; #DEBUG_LINE_NO:
    ObjectReference[] Sys1LinkedRefs = Sys1Link1.GetLinkedRefChain(LinkPassOpenCloseEvent, 100) ; #DEBUG_LINE_NO:
    Sys1LinkedRefs.add(Sys1Link1, 1) ; #DEBUG_LINE_NO:
    If Sys1LinkedRefs.find(akSender, 0) > -1 ; #DEBUG_LINE_NO:
      If Self.GetLinkedRef(LinkKeyword2).GetOpenState() == 1 ; #DEBUG_LINE_NO:
        Self.GetLinkedRef(LinkKeyword2).Activate(akActionRef, False) ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        ObjectReference Sys2Link1 = Self.GetLinkedRef(LinkKeyword2) ; #DEBUG_LINE_NO:
        ObjectReference[] Sys2LinkedRefs = Sys2Link1.GetLinkedRefChain(LinkPassOpenCloseEvent, 100) ; #DEBUG_LINE_NO:
        Sys2LinkedRefs.add(Sys2Link1, 1) ; #DEBUG_LINE_NO:
        Int index = 0 ; #DEBUG_LINE_NO:
        While index < Sys2LinkedRefs.Length ; #DEBUG_LINE_NO:
          ObjectReference item = Sys2LinkedRefs[index] ; #DEBUG_LINE_NO:
          item.BlockActivation(True, False) ; #DEBUG_LINE_NO:
          index += 1 ; #DEBUG_LINE_NO:
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    ElseIf Self.GetLinkedRef(LinkKeyword1).GetOpenState() == 1 ; #DEBUG_LINE_NO:
      Self.GetLinkedRef(LinkKeyword1).Activate(akActionRef, False) ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Int index = 0 ; #DEBUG_LINE_NO:
      While index < Sys1LinkedRefs.Length ; #DEBUG_LINE_NO:
        ObjectReference item = Sys1LinkedRefs[index] ; #DEBUG_LINE_NO:
        item.BlockActivation(True, False) ; #DEBUG_LINE_NO:
        index += 1 ; #DEBUG_LINE_NO:
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    akSender.BlockActivation(True, False) ; #DEBUG_LINE_NO:
  EndEvent

  Event onBeginState(String asOldState)
    ObjectReference Link1 = Self.GetLinkedRef(LinkKeyword1) ; #DEBUG_LINE_NO:51
    ObjectReference[] LinkedRefs = Link1.GetLinkedRefChain(LinkPassOpenCloseEvent, 100) ; #DEBUG_LINE_NO:52
    ObjectReference Link2 = Self.GetLinkedRef(LinkKeyword2) ; #DEBUG_LINE_NO:53
    ObjectReference[] LinkedRefsToAdd = Link2.GetLinkedRefChain(LinkPassOpenCloseEvent, 100) ; #DEBUG_LINE_NO:54
    Int index = 0 ; #DEBUG_LINE_NO:56
    While index < LinkedRefsToAdd.Length ; #DEBUG_LINE_NO:57
      LinkedRefs.add(LinkedRefsToAdd[index], 1) ; #DEBUG_LINE_NO:58
      index += 1 ; #DEBUG_LINE_NO:59
    EndWhile ; #DEBUG_LINE_NO:
    LinkedRefs.add(Link1, 1) ; #DEBUG_LINE_NO:61
    LinkedRefs.add(Link2, 1) ; #DEBUG_LINE_NO:62
    index = 0 ; #DEBUG_LINE_NO:65
    While index < LinkedRefs.Length ; #DEBUG_LINE_NO:66
      ObjectReference item = LinkedRefs[index] ; #DEBUG_LINE_NO:67
      item.BlockActivation(False, False) ; #DEBUG_LINE_NO:69
      index += 1 ; #DEBUG_LINE_NO:71
    EndWhile ; #DEBUG_LINE_NO:
  EndEvent
EndState
