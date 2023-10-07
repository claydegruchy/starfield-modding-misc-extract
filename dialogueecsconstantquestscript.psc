ScriptName DialogueECSConstantQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct NPCData
  ReferenceAlias NPCAlias
  { The Alias for the NPC we want to move }
  ReferenceAlias MarkerAlias
  { The Marker Alias we're moving the NPC to }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property ECSConstantShip Auto Const mandatory
RefCollectionAlias Property GenericNPCs Auto Const mandatory
dialogueecsconstantquestscript:npcdata[] Property NPCDatum Auto Const mandatory

;-- Functions ---------------------------------------

Function MoveNPCs()
  Int I = 0 ; #DEBUG_LINE_NO:16
  Int iLength = NPCDatum.Length ; #DEBUG_LINE_NO:17
  While I < iLength ; #DEBUG_LINE_NO:18
    Actor myNPC = NPCDatum[I].NPCAlias.GetActorRef() ; #DEBUG_LINE_NO:19
    ObjectReference myMarker = NPCDatum[I].MarkerAlias.GetRef() ; #DEBUG_LINE_NO:20
    myNPC.MoveTo(myMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:21
    I += 1 ; #DEBUG_LINE_NO:22
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  ECSConstantShip.GetShipReference().SetValue(Game.GetInvulnerableAV(), 1.0) ; #DEBUG_LINE_NO:28
EndEvent
