ScriptName MQ204BasementNPCTriggerScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Bool CompanionMoved
Bool CoraMoved
Bool MatteoMoved
Bool VascoMoved
Bool WalterMoved

;-- Properties --------------------------------------
Int Property PreReqStage = 110 Auto Const
Int Property PostStage = 127 Auto Const
ReferenceAlias Property Noel Auto Const mandatory
ReferenceAlias Property CompanionAtLodge Auto Const mandatory
ReferenceAlias Property WalterStroud Auto Const mandatory
ReferenceAlias Property Vasco Auto Const mandatory
ReferenceAlias Property MatteoKhatri Auto Const mandatory
ReferenceAlias Property CoraCoe Auto Const mandatory
ObjectReference Property MQ204_NoelWellEscort_Marker Auto Const mandatory
ObjectReference Property MQ204_RunMarker_Walter02 Auto Const mandatory
ObjectReference Property MQ204_RunMarker_Companion02 Auto Const mandatory
ObjectReference Property MQ204_RunMarker_Vasco02 Auto Const mandatory
ObjectReference Property MQ204_RunMarker_Matteo02 Auto Const mandatory
ObjectReference Property MQ204_RunMarker_Cora02 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:24
  If myQuest.GetStageDone(PreReqStage) && !myQuest.GetStageDone(PostStage) ; #DEBUG_LINE_NO:25
    If akActionRef == Noel.GetActorRef() as ObjectReference ; #DEBUG_LINE_NO:26
       ; #DEBUG_LINE_NO:
    ElseIf (akActionRef == CompanionAtLodge.GetActorRef() as ObjectReference) && !CompanionMoved ; #DEBUG_LINE_NO:28
      CompanionMoved = True ; #DEBUG_LINE_NO:29
      akActionRef.moveto(MQ204_RunMarker_Companion02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:30
    ElseIf (akActionRef == WalterStroud.GetActorRef() as ObjectReference) && !WalterMoved ; #DEBUG_LINE_NO:31
      WalterMoved = True ; #DEBUG_LINE_NO:32
      akActionRef.moveto(MQ204_RunMarker_Walter02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
    ElseIf (akActionRef == Vasco.GetActorRef() as ObjectReference) && !VascoMoved ; #DEBUG_LINE_NO:34
      VascoMoved = True ; #DEBUG_LINE_NO:35
      akActionRef.moveto(MQ204_RunMarker_Vasco02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:36
    ElseIf (akActionRef == MatteoKhatri.GetActorRef() as ObjectReference) && !MatteoMoved ; #DEBUG_LINE_NO:37
      MatteoMoved = True ; #DEBUG_LINE_NO:38
      akActionRef.moveto(MQ204_RunMarker_Matteo02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:39
    ElseIf (akActionRef == CoraCoe.GetActorRef() as ObjectReference) && !CoraMoved ; #DEBUG_LINE_NO:40
      CoraMoved = True ; #DEBUG_LINE_NO:41
      akActionRef.moveto(MQ204_RunMarker_Cora02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:42
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
