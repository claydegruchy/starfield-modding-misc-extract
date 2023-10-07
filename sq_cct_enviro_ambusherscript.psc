ScriptName SQ_CCT_Enviro_AmbusherScript Extends Quest

;-- Structs -----------------------------------------
Struct AmbushData
  ReferenceAlias AmbushMarker
  ReferenceAlias Prey
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SQ_CCT_Enviro_AmbusherScene Auto Const mandatory
{ scene to start once target is initialized }
sq_cct_enviro_ambusherscript:ambushdata[] Property AmbushMarkers Auto Const mandatory
{ array of ambush markers and nearest prey }
ReferenceAlias Property BehaviorActor Auto Const mandatory
{ ambusher }
ReferenceAlias Property BehaviorTarget Auto Const mandatory
{ ambush marker to use - fill in with one that's farthest from prey }
RefCollectionAlias Property BehaviorActorHerd Auto Const
{ OPTIONAL - used for herd actors }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  ObjectReference actorRef = BehaviorActor.GetRef() ; #DEBUG_LINE_NO:24
  ObjectReference targetRef = BehaviorTarget.GetRef() ; #DEBUG_LINE_NO:25
  Int h = 0 ; #DEBUG_LINE_NO:29
  While h < BehaviorActorHerd.GetCount() ; #DEBUG_LINE_NO:30
    h += 1 ; #DEBUG_LINE_NO:32
  EndWhile ; #DEBUG_LINE_NO:
  Float minDistance = 0.0 ; #DEBUG_LINE_NO:35
  ObjectReference bestMarker = None ; #DEBUG_LINE_NO:36
  Int I = 0 ; #DEBUG_LINE_NO:38
  While I < AmbushMarkers.Length ; #DEBUG_LINE_NO:39
    ObjectReference AmbushMarker = AmbushMarkers[I].AmbushMarker.GetRef() ; #DEBUG_LINE_NO:40
    ObjectReference preyRef = AmbushMarkers[I].Prey.GetRef() ; #DEBUG_LINE_NO:41
    If AmbushMarker as Bool && preyRef as Bool ; #DEBUG_LINE_NO:43
      Float preyDistance = AmbushMarker.GetDistance(preyRef) ; #DEBUG_LINE_NO:44
      If preyDistance > minDistance ; #DEBUG_LINE_NO:46
        minDistance = preyDistance ; #DEBUG_LINE_NO:47
        bestMarker = AmbushMarker ; #DEBUG_LINE_NO:48
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:52
  EndWhile ; #DEBUG_LINE_NO:
  If bestMarker ; #DEBUG_LINE_NO:55
    BehaviorTarget.ForceRefTo(bestMarker) ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
  SQ_CCT_Enviro_AmbusherScene.Start() ; #DEBUG_LINE_NO:60
EndEvent
