ScriptName MQ402Script Extends Quest

;-- Structs -----------------------------------------
Struct LodgeArtifacts
  Int ArtifactNumber
  ObjectReference PlacementMarker
  ReferenceAlias ArtifactRefAlias
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
mq402script:lodgeartifacts[] Property LodgeArtifactsArray Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
GlobalVariable Property MQ402LodgeActorsSkip Auto Const mandatory
ReferenceAlias Property Andreja Auto Const mandatory
ReferenceAlias Property Barrett Auto Const mandatory
ReferenceAlias Property SamCoe Auto Const mandatory
ReferenceAlias Property CoraCoe Auto Const mandatory
Faction Property AvailableCompanionFaction Auto Const mandatory
ObjectReference Property Lodge_RoomMarker_Library01 Auto Const mandatory
Quest Property COM_Companion_Andreja Auto Const mandatory

;-- Functions ---------------------------------------

Function AddLodgeArtifacts(Actor akActorRef)
  Int currentElement = 0 ; #DEBUG_LINE_NO:22
  While currentElement < LodgeArtifactsArray.Length ; #DEBUG_LINE_NO:23
    Int CurrentArtifactNumber = LodgeArtifactsArray[currentElement].ArtifactNumber ; #DEBUG_LINE_NO:24
    ObjectReference CurrentPlacementMarker = LodgeArtifactsArray[currentElement].PlacementMarker ; #DEBUG_LINE_NO:25
    ReferenceAlias CurrentRefAlias = LodgeArtifactsArray[currentElement].ArtifactRefAlias ; #DEBUG_LINE_NO:26
    ObjectReference ArtifactREF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(CurrentArtifactNumber, CurrentPlacementMarker) ; #DEBUG_LINE_NO:28
    ArtifactREF.Enable(False) ; #DEBUG_LINE_NO:29
    akActorRef.AddItem(ArtifactREF as Form, 1, False) ; #DEBUG_LINE_NO:30
    CurrentRefAlias.ForceRefTo(ArtifactREF) ; #DEBUG_LINE_NO:31
    (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(CurrentArtifactNumber) ; #DEBUG_LINE_NO:33
    currentElement += 1 ; #DEBUG_LINE_NO:34
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function EnableLodgeActors()
  Actor AndrejaREF = Andreja.GetActorRef() ; #DEBUG_LINE_NO:40
  Actor BarrettREF = Barrett.GetActorRef() ; #DEBUG_LINE_NO:41
  Actor SamCoeREF = SamCoe.GetActorRef() ; #DEBUG_LINE_NO:42
  Actor CoraCoeREF = CoraCoe.GetActorRef() ; #DEBUG_LINE_NO:43
  MQ402LodgeActorsSkip.SetValueInt(1) ; #DEBUG_LINE_NO:45
  AndrejaREF.AddToFaction(AvailableCompanionFaction) ; #DEBUG_LINE_NO:46
  BarrettREF.AddToFaction(AvailableCompanionFaction) ; #DEBUG_LINE_NO:47
  SamCoeREF.AddToFaction(AvailableCompanionFaction) ; #DEBUG_LINE_NO:48
  AndrejaREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:50
  BarrettREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:51
  SamCoeREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:52
  CoraCoeREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:53
  AndrejaREF.moveto(Lodge_RoomMarker_Library01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:55
  BarrettREF.moveto(Lodge_RoomMarker_Library01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:56
  SamCoeREF.moveto(Lodge_RoomMarker_Library01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:57
  CoraCoeREF.moveto(Lodge_RoomMarker_Library01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:58
  COM_Companion_Andreja.SetStage(50) ; #DEBUG_LINE_NO:61
  COM_Companion_Andreja.SetStage(100) ; #DEBUG_LINE_NO:62
EndFunction
