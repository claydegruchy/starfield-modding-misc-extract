ScriptName TestNPCArenaScript Extends ObjectReference

;-- Variables ---------------------------------------
FormList AllBlueTeamNPCTypes
FormList AllRedTeamNPCTypes
ActorBase[] BlueActorsToSpawn
ActorBase[] RedActorsToSpawn
Actor[] SpawnedActors

;-- Properties --------------------------------------
Group SharedDefaults collapsedonref
  ActorBase Property ActorToSpawn Auto mandatory
  { Actor to spawn for the first group }
  Faction Property TestNPCBehaviorRedTeam Auto Const mandatory
  { Red Team Faction }
  Faction Property TestNPCBehaviorBlueTeam Auto Const mandatory
  { Blue Team Faction }
  Faction Property TestNPCPlayerEnemyFaction Auto Const mandatory
  { Faction for fighting against the player. }
  Keyword Property RedSpawnLocationsKeyword Auto Const mandatory
  { Where the red team and noncombat NPCs will spawn. }
  Keyword Property BlueSpawnLocationsKeyword Auto Const mandatory
  { Where the blue team will spawn }
  Keyword Property DestinationLocationsKeyword Auto Const mandatory
  { Where the spawned NPCs will go. Shared for combat NPCs, set through linked refs from spawn points for non combat NPCs. }
  Keyword Property TestNPCSpawnLocationsKeyword Auto Const mandatory
  { Used to spawn and patrol NPCs if there are no spawn locations or destinations linked to the spawn activator }
  Keyword Property PatrolTypeKeyword Auto
  { Used to set run, jog, etc. for noncombat NPCs. should contain any patrol styles to be tested. }
  Keyword Property SandboxKeyword Auto Const mandatory
  { For Sandboxing NPCs }
  Outfit[] Property AllTestOutfits Auto Const mandatory
  { Used to differentiate groups of Noncombat NPCs }
  Outfit Property BlueOutfit Auto Const mandatory
  Outfit Property RedOutfit Auto Const mandatory
  wwiseevent Property PositiveSoundEvent Auto Const mandatory
  wwiseevent Property NegativeSoundEvent Auto Const mandatory
  FormList Property AllFactionFormList Auto Const mandatory
  { Form List of FormLists, for choosing random factions }
  Activator Property TestNPCSpawnMarker Auto Const mandatory
  { This marker is placed when using quick placement. }
  VoiceType Property NPCNoLinesVoiceType Auto Const
  { Select a voice type override for all spawned NPCs }
EndGroup

Group Inputs
  Int Property RedTeamSize = 1 Auto mandatory
  { Number of Actors to spawn for the first group }
  Int Property BlueTeamSize = 1 Auto mandatory
  { Number of Actors to spawn for the second group }
  ObjectReference[] Property AddToRedTeamButton Auto Const
  { These buttons will increase the team size to be spawned for the Red Team }
  ObjectReference[] Property AddToBlueTeamButton Auto Const
  { These buttons will increase the team size to be spawned for the Blue Team }
  ObjectReference[] Property SubtractFromRedTeamButton Auto Const
  { These buttons will reduce the team size to be spawned for the Red Team }
  ObjectReference[] Property SubtractFromBlueTeamButton Auto Const
  { These buttons will reduce the team size to be spawned for the Blue Team }
  Bool Property SpawnOnLoad Auto Const
  { Should a default NPC spawn into the pathing test area on load? }
  Bool Property VersusPlayer = False Auto
  Int Property HealthBoost = 200 Auto
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SpawnedActors = new Actor[0] ; #DEBUG_LINE_NO:68
  RedActorsToSpawn = new ActorBase[0] ; #DEBUG_LINE_NO:69
  BlueActorsToSpawn = new ActorBase[0] ; #DEBUG_LINE_NO:70
  AllRedTeamNPCTypes = AllFactionFormList.GetAt(1) as FormList ; #DEBUG_LINE_NO:71
  AllBlueTeamNPCTypes = AllFactionFormList.GetAt(0) as FormList ; #DEBUG_LINE_NO:72
  Int count = 0 ; #DEBUG_LINE_NO:74
  While count < RedTeamSize ; #DEBUG_LINE_NO:75
    RedActorsToSpawn.add(ActorToSpawn, 1) ; #DEBUG_LINE_NO:76
    count += 1 ; #DEBUG_LINE_NO:77
  EndWhile ; #DEBUG_LINE_NO:
  count = 0 ; #DEBUG_LINE_NO:79
  While count < BlueTeamSize ; #DEBUG_LINE_NO:80
    BlueActorsToSpawn.add(ActorToSpawn, 1) ; #DEBUG_LINE_NO:81
    count += 1 ; #DEBUG_LINE_NO:82
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:91
  If AddToRedTeamButton.find(akActionRef, 0) >= 0 ; #DEBUG_LINE_NO:96
    RedActorsToSpawn.add(ActorToSpawn, 1) ; #DEBUG_LINE_NO:97
  ElseIf AddToBlueTeamButton.find(akActionRef, 0) >= 0 ; #DEBUG_LINE_NO:99
    BlueActorsToSpawn.add(ActorToSpawn, 1) ; #DEBUG_LINE_NO:100
  ElseIf SubtractFromRedTeamButton.find(akActionRef, 0) >= 0 ; #DEBUG_LINE_NO:102
    RedActorsToSpawn.removelast() ; #DEBUG_LINE_NO:103
  ElseIf SubtractFromBlueTeamButton.find(akActionRef, 0) >= 0 ; #DEBUG_LINE_NO:105
    BlueActorsToSpawn.removelast() ; #DEBUG_LINE_NO:106
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SpawnTeams(ObjectReference akActionRef)
  ObjectReference[] SpawnLocationsRedTeam = akActionRef.GetLinkedRefChain(RedSpawnLocationsKeyword, 100) ; #DEBUG_LINE_NO:118
  ObjectReference[] SpawnLocationsBlueTeam = akActionRef.GetLinkedRefChain(BlueSpawnLocationsKeyword, 100) ; #DEBUG_LINE_NO:119
  ObjectReference[] DestinationLocations = akActionRef.GetLinkedRefChain(DestinationLocationsKeyword, 100) ; #DEBUG_LINE_NO:120
  If SpawnLocationsRedTeam.Length == 0 && SpawnLocationsBlueTeam.Length == 0 ; #DEBUG_LINE_NO:125
    Self.RandomNavLocations(akActionRef) ; #DEBUG_LINE_NO:127
    SpawnLocationsRedTeam = Self.FindAllReferencesWithKeyword(TestNPCSpawnLocationsKeyword as Form, 1000.0) ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
  If DestinationLocations.Length == 0 ; #DEBUG_LINE_NO:131
    DestinationLocations = SpawnLocationsRedTeam ; #DEBUG_LINE_NO:133
  EndIf ; #DEBUG_LINE_NO:
  Int count = 0 ; #DEBUG_LINE_NO:137
  While count < RedActorsToSpawn.Length ; #DEBUG_LINE_NO:138
    Actor newActor = SpawnLocationsRedTeam[Utility.RandomInt(0, SpawnLocationsRedTeam.Length - 1)].PlaceActorAtMe(RedActorsToSpawn[count], 1, None, False, False, True, None, True) ; #DEBUG_LINE_NO:139
    newActor.RemoveFromAllFactions() ; #DEBUG_LINE_NO:140
    If VersusPlayer ; #DEBUG_LINE_NO:142
      newActor.AddToFaction(TestNPCPlayerEnemyFaction) ; #DEBUG_LINE_NO:143
    Else ; #DEBUG_LINE_NO:
      newActor.AddToFaction(TestNPCBehaviorRedTeam) ; #DEBUG_LINE_NO:145
    EndIf ; #DEBUG_LINE_NO:
    newActor.SetLinkedRef(DestinationLocations[Utility.RandomInt(0, DestinationLocations.Length - 1)], PatrolTypeKeyword, True) ; #DEBUG_LINE_NO:148
    If HealthBoost > 0 ; #DEBUG_LINE_NO:151
      newActor.SetValue(Game.GetHealthAV(), HealthBoost as Float) ; #DEBUG_LINE_NO:152
    EndIf ; #DEBUG_LINE_NO:
    newActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:154
    SpawnedActors.add(newActor, 1) ; #DEBUG_LINE_NO:155
    count += 1 ; #DEBUG_LINE_NO:156
  EndWhile ; #DEBUG_LINE_NO:
  count = 0 ; #DEBUG_LINE_NO:159
  While count < BlueActorsToSpawn.Length ; #DEBUG_LINE_NO:160
    Actor newactor = SpawnLocationsBlueTeam[Utility.RandomInt(0, SpawnLocationsBlueTeam.Length - 1)].PlaceActorAtMe(BlueActorsToSpawn[count], 1, None, False, False, True, None, True) ; #DEBUG_LINE_NO:161
    newactor.RemoveFromAllFactions() ; #DEBUG_LINE_NO:162
    newactor.AddToFaction(TestNPCBehaviorBlueTeam) ; #DEBUG_LINE_NO:163
    newactor.SetLinkedRef(DestinationLocations[Utility.RandomInt(0, DestinationLocations.Length - 1)], PatrolTypeKeyword, True) ; #DEBUG_LINE_NO:164
    If HealthBoost > 0 ; #DEBUG_LINE_NO:167
      newactor.SetValue(Game.GetHealthAV(), HealthBoost as Float) ; #DEBUG_LINE_NO:168
    EndIf ; #DEBUG_LINE_NO:
    newactor.EvaluatePackage(False) ; #DEBUG_LINE_NO:170
    SpawnedActors.add(newactor, 1) ; #DEBUG_LINE_NO:171
    count += 1 ; #DEBUG_LINE_NO:172
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function AddSpecificNPC(Int classToAddIndex, Int TeamToAddTo)
  If TeamToAddTo == 1 && AllRedTeamNPCTypes.GetAt(classToAddIndex) as Bool ; #DEBUG_LINE_NO:178
    RedActorsToSpawn.add(AllRedTeamNPCTypes.GetAt(classToAddIndex) as ActorBase, 1) ; #DEBUG_LINE_NO:179
    PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:180
  ElseIf TeamToAddTo == 2 && AllBlueTeamNPCTypes.GetAt(classToAddIndex) as Bool ; #DEBUG_LINE_NO:181
    BlueActorsToSpawn.add(AllBlueTeamNPCTypes.GetAt(classToAddIndex) as ActorBase, 1) ; #DEBUG_LINE_NO:182
    PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:183
  Else ; #DEBUG_LINE_NO:
    NegativeSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:185
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ClearActorsToSpawn()
  RedActorsToSpawn.clear() ; #DEBUG_LINE_NO:190
  BlueActorsToSpawn.clear() ; #DEBUG_LINE_NO:191
EndFunction

Function KillAllNPCs()
  Int count = 0 ; #DEBUG_LINE_NO:196
  While count < SpawnedActors.Length ; #DEBUG_LINE_NO:197
    Actor curItem = SpawnedActors[count] ; #DEBUG_LINE_NO:198
    curItem.KillSilent(None) ; #DEBUG_LINE_NO:199
    count += 1 ; #DEBUG_LINE_NO:200
  EndWhile ; #DEBUG_LINE_NO:
  SpawnedActors.clear() ; #DEBUG_LINE_NO:202
EndFunction

Function SetRandomTeams(Bool andSpawn, Bool onlyRed, ObjectReference akActionRef, Int randMin, Int randMax)
  RedActorsToSpawn.clear() ; #DEBUG_LINE_NO:206
  BlueActorsToSpawn.clear() ; #DEBUG_LINE_NO:207
  RedTeamSize = Utility.RandomInt(randMin, randMax) ; #DEBUG_LINE_NO:208
  BlueTeamSize = Utility.RandomInt(randMin, randMax) ; #DEBUG_LINE_NO:209
  If onlyRed ; #DEBUG_LINE_NO:211
    BlueTeamSize = 0 ; #DEBUG_LINE_NO:212
  EndIf ; #DEBUG_LINE_NO:
  Int count = 0 ; #DEBUG_LINE_NO:216
  While count < RedTeamSize ; #DEBUG_LINE_NO:217
    RedActorsToSpawn.add(AllRedTeamNPCTypes.GetAt(Utility.RandomInt(0, AllRedTeamNPCTypes.GetSize() - 1)) as ActorBase, 1) ; #DEBUG_LINE_NO:218
    count += 1 ; #DEBUG_LINE_NO:219
  EndWhile ; #DEBUG_LINE_NO:
  count = 0 ; #DEBUG_LINE_NO:221
  While count < BlueTeamSize ; #DEBUG_LINE_NO:222
    BlueActorsToSpawn.add(AllBlueTeamNPCTypes.GetAt(Utility.RandomInt(0, AllBlueTeamNPCTypes.GetSize() - 1)) as ActorBase, 1) ; #DEBUG_LINE_NO:223
    count += 1 ; #DEBUG_LINE_NO:224
  EndWhile ; #DEBUG_LINE_NO:
  If andSpawn && akActionRef as Bool ; #DEBUG_LINE_NO:226
    Self.SpawnTeams(akActionRef) ; #DEBUG_LINE_NO:227
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetFactionToSpawn(FormList newFactionList, Int TeamNumber)
  If TeamNumber == 1 ; #DEBUG_LINE_NO:232
    PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:233
    Int count = 0 ; #DEBUG_LINE_NO:234
    While count < RedActorsToSpawn.Length ; #DEBUG_LINE_NO:235
      Int index = AllRedTeamNPCTypes.Find(RedActorsToSpawn[count] as Form) ; #DEBUG_LINE_NO:236
      If index > -1 ; #DEBUG_LINE_NO:237
        If newFactionList.GetAt(index) ; #DEBUG_LINE_NO:238
          RedActorsToSpawn[count] = newFactionList.GetAt(index) as ActorBase ; #DEBUG_LINE_NO:239
        Else ; #DEBUG_LINE_NO:
          RedActorsToSpawn[count] = newFactionList.GetAt(0) as ActorBase ; #DEBUG_LINE_NO:241
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        RedActorsToSpawn[count] = newFactionList.GetAt(0) as ActorBase ; #DEBUG_LINE_NO:244
      EndIf ; #DEBUG_LINE_NO:
      count += 1 ; #DEBUG_LINE_NO:246
    EndWhile ; #DEBUG_LINE_NO:
    AllRedTeamNPCTypes = newFactionList ; #DEBUG_LINE_NO:248
  ElseIf TeamNumber == 2 ; #DEBUG_LINE_NO:249
    Int count = 0 ; #DEBUG_LINE_NO:250
    PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:251
    While count < BlueActorsToSpawn.Length ; #DEBUG_LINE_NO:252
      Int index = AllBlueTeamNPCTypes.Find(BlueActorsToSpawn[count] as Form) ; #DEBUG_LINE_NO:253
      If index > -1 ; #DEBUG_LINE_NO:254
        If newFactionList.GetAt(index) ; #DEBUG_LINE_NO:255
          BlueActorsToSpawn[count] = newFactionList.GetAt(index) as ActorBase ; #DEBUG_LINE_NO:256
        Else ; #DEBUG_LINE_NO:
          BlueActorsToSpawn[count] = newFactionList.GetAt(0) as ActorBase ; #DEBUG_LINE_NO:258
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        BlueActorsToSpawn[count] = newFactionList.GetAt(0) as ActorBase ; #DEBUG_LINE_NO:261
      EndIf ; #DEBUG_LINE_NO:
      count += 1 ; #DEBUG_LINE_NO:263
    EndWhile ; #DEBUG_LINE_NO:
    AllBlueTeamNPCTypes = newFactionList ; #DEBUG_LINE_NO:265
  Else ; #DEBUG_LINE_NO:
    NegativeSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:267
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SpawnNonCombatActors(Int GroupSize, ObjectReference LinkRefHub)
  Self.KillAllNPCs() ; #DEBUG_LINE_NO:275
  ObjectReference[] SpawnLocations = LinkRefHub.GetLinkedRefChain(RedSpawnLocationsKeyword, 100) ; #DEBUG_LINE_NO:277
  Int I = 0 ; #DEBUG_LINE_NO:280
  Int j = 0 ; #DEBUG_LINE_NO:281
  Actor newActor = None ; #DEBUG_LINE_NO:282
  Actor previousActor = None ; #DEBUG_LINE_NO:283
  While I < SpawnLocations.Length ; #DEBUG_LINE_NO:284
    Outfit outfitToUse = AllTestOutfits[I % AllTestOutfits.Length] ; #DEBUG_LINE_NO:287
    If RedActorsToSpawn[0] ; #DEBUG_LINE_NO:290
      newActor = SpawnLocations[I].PlaceActorAtMe(RedActorsToSpawn[0], 4, None, False, False, True, None, True) ; #DEBUG_LINE_NO:291
    Else ; #DEBUG_LINE_NO:
      newActor = SpawnLocations[I].PlaceActorAtMe(AllRedTeamNPCTypes.GetAt(0) as ActorBase, 4, None, False, False, True, None, True) ; #DEBUG_LINE_NO:293
    EndIf ; #DEBUG_LINE_NO:
    SpawnedActors.add(newActor, 1) ; #DEBUG_LINE_NO:295
    newActor.RemoveFromAllFactions() ; #DEBUG_LINE_NO:296
    If SpawnLocations[I].GetLinkedRef(DestinationLocationsKeyword) ; #DEBUG_LINE_NO:298
      newActor.SetLinkedRef(SpawnLocations[I].GetLinkedRef(DestinationLocationsKeyword), PatrolTypeKeyword, True) ; #DEBUG_LINE_NO:299
      PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:300
    ElseIf SpawnLocations[I].GetLinkedRef(SandboxKeyword) ; #DEBUG_LINE_NO:301
      newActor.SetLinkedRef(SpawnLocations[I].GetLinkedRef(SandboxKeyword), SandboxKeyword, True) ; #DEBUG_LINE_NO:302
      PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:303
    Else ; #DEBUG_LINE_NO:
      NegativeSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:305
    EndIf ; #DEBUG_LINE_NO:
    newActor.SetOutfit(outfitToUse, False) ; #DEBUG_LINE_NO:307
    newActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:308
    If GroupSize > 1 ; #DEBUG_LINE_NO:310
      j = 0 ; #DEBUG_LINE_NO:311
      While j < GroupSize - 1 ; #DEBUG_LINE_NO:312
        previousActor = newActor ; #DEBUG_LINE_NO:313
        If RedActorsToSpawn[j + 1] ; #DEBUG_LINE_NO:314
          newActor = SpawnLocations[I].PlaceActorAtMe(RedActorsToSpawn[j + 1], 4, None, False, False, True, None, True) ; #DEBUG_LINE_NO:315
        Else ; #DEBUG_LINE_NO:
          newActor = SpawnLocations[I].PlaceActorAtMe(AllRedTeamNPCTypes.GetAt(0) as ActorBase, 4, None, False, False, True, None, True) ; #DEBUG_LINE_NO:317
        EndIf ; #DEBUG_LINE_NO:
        SpawnedActors.add(newActor, 1) ; #DEBUG_LINE_NO:319
        newActor.RemoveFromAllFactions() ; #DEBUG_LINE_NO:320
        newActor.SetLinkedRef(previousActor as ObjectReference, None, True) ; #DEBUG_LINE_NO:322
        newActor.SetOutfit(outfitToUse, False) ; #DEBUG_LINE_NO:323
        newActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:324
        j += 1 ; #DEBUG_LINE_NO:325
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:328
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:329
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetPatrolSpeed(Keyword newPatrolKeyword)
  Int count = 0 ; #DEBUG_LINE_NO:334
  While count < SpawnedActors.Length ; #DEBUG_LINE_NO:335
    ObjectReference linkedObject = SpawnedActors[count].GetLinkedRef(PatrolTypeKeyword) ; #DEBUG_LINE_NO:336
    SpawnedActors[count].SetLinkedRef(None, PatrolTypeKeyword, True) ; #DEBUG_LINE_NO:337
    SpawnedActors[count].SetLinkedRef(linkedObject, newPatrolKeyword, True) ; #DEBUG_LINE_NO:338
    SpawnedActors[count].EvaluatePackage(False) ; #DEBUG_LINE_NO:339
    count += 1 ; #DEBUG_LINE_NO:340
  EndWhile ; #DEBUG_LINE_NO:
  PatrolTypeKeyword = newPatrolKeyword ; #DEBUG_LINE_NO:342
  PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:343
EndFunction

FormList Function GetFactionFormList(Int TeamNumber)
  FormList factionFormList = None ; #DEBUG_LINE_NO:347
  If TeamNumber == 1 ; #DEBUG_LINE_NO:348
    factionFormList = AllRedTeamNPCTypes ; #DEBUG_LINE_NO:349
  ElseIf TeamNumber == 2 ; #DEBUG_LINE_NO:350
    factionFormList = AllBlueTeamNPCTypes ; #DEBUG_LINE_NO:351
  EndIf ; #DEBUG_LINE_NO:
  Return factionFormList ; #DEBUG_LINE_NO:355
EndFunction

Bool Function RandomNavLocations(ObjectReference akActionRef)
  Int range = 50 ; #DEBUG_LINE_NO:359
  Int numberOfSpawnLocations = 10 ; #DEBUG_LINE_NO:360
  ObjectReference[] newMarkers = new ObjectReference[0] ; #DEBUG_LINE_NO:363
  Int I = 0 ; #DEBUG_LINE_NO:366
  While I < numberOfSpawnLocations ; #DEBUG_LINE_NO:367
    ObjectReference newSpawnMarker = Self.PlaceAtMe(TestNPCSpawnMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:369
    newMarkers.add(newSpawnMarker, 1) ; #DEBUG_LINE_NO:370
    I += 1 ; #DEBUG_LINE_NO:371
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:373
  While I < numberOfSpawnLocations ; #DEBUG_LINE_NO:374
    newMarkers[I].SetPosition(newMarkers[I].GetPositionX() + Utility.RandomInt(-range, range) as Float, newMarkers[I].GetPositionY() + Utility.RandomInt(-range, range) as Float, newMarkers[I].GetPositionZ()) ; #DEBUG_LINE_NO:376
    I += 1 ; #DEBUG_LINE_NO:377
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:379
  While I < numberOfSpawnLocations ; #DEBUG_LINE_NO:380
    newMarkers[I].MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:382
    I += 1 ; #DEBUG_LINE_NO:383
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:388
  While I < newMarkers.Length - 1 ; #DEBUG_LINE_NO:389
    newMarkers[I].SetLinkedRef(newMarkers[I + 1], None, True) ; #DEBUG_LINE_NO:390
    I += 1 ; #DEBUG_LINE_NO:391
  EndWhile ; #DEBUG_LINE_NO:
  newMarkers.clear() ; #DEBUG_LINE_NO:394
  Return True ; #DEBUG_LINE_NO:395
EndFunction
