ScriptName TestNPCSimpleSpawn Extends ObjectReference

;-- Variables ---------------------------------------
Int CurrentGroupSize
FormList FactionFormList
Int NPCTypeIndex
Actor[] SpawnedActors

;-- Properties --------------------------------------
Group SharedDefaults collapsedonref
  ActorBase Property ActorToSpawn Auto mandatory
  Keyword Property SpawnLocationsKeyword Auto Const mandatory
  Keyword Property DestinationLocationKeyword Auto Const mandatory
  Outfit[] Property AllTestOutfits Auto Const
  wwiseevent Property PositiveSoundEvent Auto Const
  Keyword Property PatrolTypeKeyword Auto
EndGroup

Group Settings
  Int Property GroupSize = 3 Auto
  ObjectReference Property GroupSpawnButton Auto Const
  ObjectReference Property SingleSpawnButton Auto Const
  ObjectReference Property KillAllButton Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SpawnedActors = new Actor[0] ; #DEBUG_LINE_NO:32
  CurrentGroupSize = GroupSize ; #DEBUG_LINE_NO:33
EndEvent

Event OnActivate(ObjectReference akActionRef)
  PositiveSoundEvent.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:38
  If akActionRef == GroupSpawnButton ; #DEBUG_LINE_NO:39
    CurrentGroupSize == GroupSize ; #DEBUG_LINE_NO:41
    Self.SpawnActors() ; #DEBUG_LINE_NO:42
  ElseIf akActionRef == SingleSpawnButton ; #DEBUG_LINE_NO:44
    CurrentGroupSize = 1 ; #DEBUG_LINE_NO:46
    Self.SpawnActors() ; #DEBUG_LINE_NO:47
  ElseIf akActionRef == KillAllButton ; #DEBUG_LINE_NO:49
    Self.KillAllNPCs() ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SpawnActors()
  Self.KillAllNPCs() ; #DEBUG_LINE_NO:61
  ObjectReference[] SpawnLocations = Self.GetLinkedRefChain(SpawnLocationsKeyword, 100) ; #DEBUG_LINE_NO:64
  Int I = 0 ; #DEBUG_LINE_NO:67
  Int j = 0 ; #DEBUG_LINE_NO:68
  Actor newActor = None ; #DEBUG_LINE_NO:69
  Actor previousActor = None ; #DEBUG_LINE_NO:70
  While I < SpawnLocations.Length ; #DEBUG_LINE_NO:71
    Outfit outfitToUse = AllTestOutfits[I % AllTestOutfits.Length] ; #DEBUG_LINE_NO:74
    newActor = SpawnLocations[I].PlaceActorAtMe(ActorToSpawn, 4, None, False, False, True, None, True) ; #DEBUG_LINE_NO:77
    SpawnedActors.add(newActor, 1) ; #DEBUG_LINE_NO:78
    newActor.RemoveFromAllFactions() ; #DEBUG_LINE_NO:79
    newActor.SetLinkedRef(SpawnLocations[I].GetLinkedRef(DestinationLocationKeyword), PatrolTypeKeyword, True) ; #DEBUG_LINE_NO:81
    newActor.SetOutfit(outfitToUse, False) ; #DEBUG_LINE_NO:82
    newActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:83
    If CurrentGroupSize > 1 ; #DEBUG_LINE_NO:85
      j = 0 ; #DEBUG_LINE_NO:86
      While j < CurrentGroupSize - 1 ; #DEBUG_LINE_NO:87
        previousActor = newActor ; #DEBUG_LINE_NO:88
        newActor = SpawnLocations[I].PlaceActorAtMe(ActorToSpawn, 4, None, False, False, True, None, True) ; #DEBUG_LINE_NO:89
        SpawnedActors.add(newActor, 1) ; #DEBUG_LINE_NO:90
        newActor.RemoveFromAllFactions() ; #DEBUG_LINE_NO:91
        newActor.SetLinkedRef(previousActor as ObjectReference, None, True) ; #DEBUG_LINE_NO:93
        newActor.SetOutfit(outfitToUse, False) ; #DEBUG_LINE_NO:94
        newActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:95
        j += 1 ; #DEBUG_LINE_NO:96
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:99
    Utility.Wait(3.0) ; #DEBUG_LINE_NO:100
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function KillAllNPCs()
  Int count = 0 ; #DEBUG_LINE_NO:106
  While count < SpawnedActors.Length ; #DEBUG_LINE_NO:107
    Actor curItem = SpawnedActors[count] ; #DEBUG_LINE_NO:108
    curItem.KillSilent(None) ; #DEBUG_LINE_NO:109
    count += 1 ; #DEBUG_LINE_NO:110
  EndWhile ; #DEBUG_LINE_NO:
  SpawnedActors.clear() ; #DEBUG_LINE_NO:112
EndFunction

Actor[] Function GetSpawnedActors()
  Return SpawnedActors ; #DEBUG_LINE_NO:116
EndFunction

Function SetDestinationKeyword(Keyword newKeyword)
  PatrolTypeKeyword = newKeyword ; #DEBUG_LINE_NO:120
EndFunction

Function SetFaction(FormList newFactionFormList)
  FactionFormList = newFactionFormList ; #DEBUG_LINE_NO:125
  ActorToSpawn = FactionFormList.GetAt(NPCTypeIndex) as ActorBase ; #DEBUG_LINE_NO:126
EndFunction

Function SetClass(Int newNPCTypeIndex)
  NPCTypeIndex = newNPCTypeIndex ; #DEBUG_LINE_NO:131
  ActorToSpawn = FactionFormList.GetAt(NPCTypeIndex) as ActorBase ; #DEBUG_LINE_NO:132
EndFunction
