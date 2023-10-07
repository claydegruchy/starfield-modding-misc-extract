ScriptName Fragments:Quests:QF_RL027Quest_002611DC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EnableMarkerShutters Auto Const mandatory
ReferenceAlias Property Alias_EnableMarkerLights Auto Const mandatory
ReferenceAlias Property Alias_Robot01 Auto Const mandatory
Faction Property CreatureFaction Auto Const
ReferenceAlias Property Alias_Boss Auto Const mandatory
ReferenceAlias Property Alias_ControlRoomDoor Auto Const mandatory
ReferenceAlias Property Alias_CentralRoomDoor Auto Const mandatory
Faction Property PredatorAFaction Auto Const
Faction Property PredatorAEnemyFaction Auto Const
wwiseevent Property RL027_MassiveShutters_Open Auto Const
RefCollectionAlias Property Alias_DamagedPipes Auto Const mandatory
RefCollectionAlias Property Alias_AllFlyers Auto Const mandatory
RefCollectionAlias Property Alias_MainRoomCreatures Auto Const mandatory
Spell Property AbModIncomingDamageFakeCombat Auto Const
RefCollectionAlias Property Alias_ExtCreatures Auto Const mandatory
ReferenceAlias Property Alias_AmbianceMarker Auto Const mandatory
ReferenceAlias Property Alias_EnableMarkerLightsMain Auto Const mandatory
ReferenceAlias Property Alias_StingerTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Int ExtActorCount = Alias_ExtCreatures.GetCount() ; #DEBUG_LINE_NO:8
  Int currentExtActorIndex = 0 ; #DEBUG_LINE_NO:9
  While currentExtActorIndex < ExtActorCount ; #DEBUG_LINE_NO:11
    (Alias_ExtCreatures.GetAt(currentExtActorIndex) as Actor).RemoveSpell(AbModIncomingDamageFakeCombat) ; #DEBUG_LINE_NO:12
    currentExtActorIndex += 1 ; #DEBUG_LINE_NO:13
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0002_Item_00()
  Int ActorCount = Alias_MainRoomCreatures.GetCount() ; #DEBUG_LINE_NO:23
  Int currentActorIndex = 0 ; #DEBUG_LINE_NO:24
  While currentActorIndex < ActorCount ; #DEBUG_LINE_NO:26
    (Alias_MainRoomCreatures.GetAt(currentActorIndex) as Actor).RemoveSpell(AbModIncomingDamageFakeCombat) ; #DEBUG_LINE_NO:27
    currentActorIndex += 1 ; #DEBUG_LINE_NO:28
  EndWhile ; #DEBUG_LINE_NO:
  Int PipeCount = Alias_DamagedPipes.GetCount() ; #DEBUG_LINE_NO:32
  Int currentPipeIndex = 0 ; #DEBUG_LINE_NO:33
  While currentPipeIndex < PipeCount ; #DEBUG_LINE_NO:35
    Alias_DamagedPipes.GetAt(currentPipeIndex).DamageObject(2000.0) ; #DEBUG_LINE_NO:36
    currentPipeIndex += 1 ; #DEBUG_LINE_NO:37
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_AmbianceMarker.getref().enable(False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0010_Item_00()
  RL027_MassiveShutters_Open.play(Alias_CentralRoomDoor.getref(), None, None) ; #DEBUG_LINE_NO:55
  Alias_StingerTrigger.getref().enable(False) ; #DEBUG_LINE_NO:56
  Utility.wait(1.5) ; #DEBUG_LINE_NO:58
  Alias_EnableMarkerLightsMain.getref().enable(False) ; #DEBUG_LINE_NO:59
  Utility.wait(4.0) ; #DEBUG_LINE_NO:61
  Alias_EnableMarkerLights.getref().enable(False) ; #DEBUG_LINE_NO:62
  Alias_ControlRoomDoor.getref().unlock(False) ; #DEBUG_LINE_NO:64
  Alias_ControlRoomDoor.getref().setopen(True) ; #DEBUG_LINE_NO:65
EndFunction
