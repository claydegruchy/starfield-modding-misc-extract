ScriptName defaultQuestRespawnScript Extends Quest default hidden
{ Simple script to respawn Aliases that have the DefaultAliasRespawnScript on them. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Respawn_Markers
  ObjectReference[] Property RespawnMarkers Auto Const
  { array of respawn markers - actors will randomly respawn at these out of player's LOS }
  ObjectReference Property RespawnMarkerFailsafe Auto Const
  { this is where I will respawn if player has LOS
	on other respawn points }
EndGroup

Group Quest_Stages
  Int Property StartStage = 0 Auto Const
  { Quest stage that needs to be set for respawning
	to start }
  Int Property DoneStage = 0 Auto Const
  { Respawning will stop if this stage is set }
EndGroup

Group Respawning_Values
  Int Property RespawnTimeMin = 5 Auto
  { min time between death and respawn in seconds }
  Int Property RespawnTimeMax = 10 Auto
  { max time between death and respawn in seconds }
  Int Property RespawnPool = 0 Auto
  { how many NPCs can be respawned?
	0 = infinite }
  Int Property MinRespawnDistance = 512 Auto Const
  { if the player is within this distance of a respawn point, don't use it }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log. }
EndGroup

Int Property respawnCount = 0 Auto hidden

;-- Functions ---------------------------------------

Function Respawn(ReferenceAlias aliasToRespawn)
  ObjectReference marker = Self.GetRespawnMarker() ; #DEBUG_LINE_NO:57
  If aliasToRespawn.GetActorRef().IsDead() ; #DEBUG_LINE_NO:61
    aliasToRespawn.ForceRefTo(marker.PlaceAtMe(aliasToRespawn.GetActorRef().GetBaseObject(), 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RespawnCollection(RefCollectionAlias collectionToRespawn, Actor actorToRespawn)
  ObjectReference marker = Self.GetRespawnMarker() ; #DEBUG_LINE_NO:71
  If actorToRespawn.IsDead() ; #DEBUG_LINE_NO:75
    collectionToRespawn.RemoveRef(actorToRespawn as ObjectReference) ; #DEBUG_LINE_NO:77
    collectionToRespawn.AddRef(marker.PlaceAtMe(actorToRespawn.GetBaseObject(), 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:79
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TryToRespawn(ReferenceAlias aliasToRespawn)
  defaultaliasrespawnscript respawnAlias = aliasToRespawn as defaultaliasrespawnscript ; #DEBUG_LINE_NO:88
  If respawnAlias == None ; #DEBUG_LINE_NO:89
    Return  ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
  If Self.ReadyToRespawn() ; #DEBUG_LINE_NO:94
    If respawnAlias.RespawningOn ; #DEBUG_LINE_NO:95
      Self.Respawn(respawnAlias as ReferenceAlias) ; #DEBUG_LINE_NO:96
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TryToRespawnCollection(RefCollectionAlias collectionToRespawn, Actor actorToRespawn)
  defaultcollectionaliasrespawnscript RespawnCollection = collectionToRespawn as defaultcollectionaliasrespawnscript ; #DEBUG_LINE_NO:105
  If RespawnCollection == None ; #DEBUG_LINE_NO:106
    Return  ; #DEBUG_LINE_NO:108
  ElseIf actorToRespawn == None ; #DEBUG_LINE_NO:109
    Return  ; #DEBUG_LINE_NO:111
  EndIf ; #DEBUG_LINE_NO:
  If Self.ReadyToRespawn() ; #DEBUG_LINE_NO:114
    If RespawnCollection.RespawningOn ; #DEBUG_LINE_NO:115
      Self.RespawnCollection(RespawnCollection as RefCollectionAlias, actorToRespawn) ; #DEBUG_LINE_NO:116
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function ReadyToRespawn()
  If (StartStage == 0 || StartStage > 0 && Self.GetStageDone(StartStage)) && (DoneStage == 0 || DoneStage > 0 && !Self.GetStageDone(DoneStage)) && (RespawnPool == 0 || RespawnPool > 0 && respawnCount < RespawnPool) ; #DEBUG_LINE_NO:128
    respawnCount += 1 ; #DEBUG_LINE_NO:129
    Utility.Wait(Utility.RandomInt(RespawnTimeMin, RespawnTimeMax) as Float) ; #DEBUG_LINE_NO:132
    Return True ; #DEBUG_LINE_NO:133
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:135
  EndIf ; #DEBUG_LINE_NO:
EndFunction

ObjectReference Function GetRespawnMarker()
  Int tryIndex = Utility.RandomInt(0, RespawnMarkers.Length - 1) ; #DEBUG_LINE_NO:142
  Actor playerActor = Game.GetPlayer() ; #DEBUG_LINE_NO:146
  ObjectReference marker = None ; #DEBUG_LINE_NO:147
  Int loopCount = 0 ; #DEBUG_LINE_NO:149
  While loopCount < RespawnMarkers.Length ; #DEBUG_LINE_NO:150
    If playerActor.HasDetectionLOS(RespawnMarkers[tryIndex]) == False && (playerActor.GetDistance(RespawnMarkers[tryIndex]) > MinRespawnDistance as Float) ; #DEBUG_LINE_NO:151
      Return RespawnMarkers[tryIndex] ; #DEBUG_LINE_NO:153
    Else ; #DEBUG_LINE_NO:
      loopCount += 1 ; #DEBUG_LINE_NO:155
      If tryIndex >= RespawnMarkers.Length - 1 ; #DEBUG_LINE_NO:157
        tryIndex = 0 ; #DEBUG_LINE_NO:159
      Else ; #DEBUG_LINE_NO:
        tryIndex += 1 ; #DEBUG_LINE_NO:161
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
  Return RespawnMarkerFailsafe ; #DEBUG_LINE_NO:167
EndFunction
