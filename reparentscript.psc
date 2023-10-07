ScriptName REParentScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group ConstProperties
  Faction Property REPlayerFriend Auto Const mandatory
  Faction Property REPlayerEnemy Auto Const mandatory
  Faction Property REIgnoreForCleanup Auto Const mandatory
  { add actors to this faction to have them ignored during cleanup check
	  i.e. quest can clean up even if they are loaded/alive }
  GlobalVariable Property GameDaysPassed Auto Const mandatory
  GlobalVariable Property REGlobalCooldown Auto Const mandatory
  { global variable which holds the time that GameDaysPassed has to exceed before another RE can trigger }
  Float Property GlobalCooldownDays = 0.0 Auto
  { how long after a RE is triggered before another encounter can trigger? }
  Explosion Property REDeathExplosion Auto Const mandatory
  Keyword Property RELootedCorpse Auto conditional Const mandatory
  Keyword Property LocTypeStarSystem Auto conditional Const mandatory
  { use to check for system locations }
EndGroup


;-- Functions ---------------------------------------

Function KillWithForce(Actor akVictim, Actor akKiller, Bool abKillSilent)
  Int waitCount = 0 ; #DEBUG_LINE_NO:9
  Float afForceMagnitude = 150.0 ; #DEBUG_LINE_NO:10
  While !akVictim.Is3DLoaded() && waitCount < 10 ; #DEBUG_LINE_NO:11
    waitCount += 1 ; #DEBUG_LINE_NO:13
    Utility.wait(0.5) ; #DEBUG_LINE_NO:14
  EndWhile ; #DEBUG_LINE_NO:
  If abKillSilent ; #DEBUG_LINE_NO:17
    akVictim.KillSilent(akKiller) ; #DEBUG_LINE_NO:18
  Else ; #DEBUG_LINE_NO:
    akVictim.Kill(akKiller) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
  If akVictim.Is3DLoaded() ; #DEBUG_LINE_NO:23
    Int aiForceDirection = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:24
    akVictim.ApplyHavokImpulse(0.0, 0.0, 1.0, 250.0) ; #DEBUG_LINE_NO:26
    Utility.wait(0.200000003) ; #DEBUG_LINE_NO:27
    akVictim.PlaceAtMe(REDeathExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function KillWithForceNoWait(Actor akVictim, Actor akKiller, Bool abKillSilent)
  Var[] akArgs = new Var[3] ; #DEBUG_LINE_NO:35
  akArgs[0] = akVictim as Var ; #DEBUG_LINE_NO:36
  akArgs[1] = akKiller as Var ; #DEBUG_LINE_NO:37
  akArgs[2] = abKillSilent as Var ; #DEBUG_LINE_NO:38
  Self.CallFunctionNoWait("KillWithForce", akArgs) ; #DEBUG_LINE_NO:39
EndFunction

Function LootContainer(ObjectReference lootingRef, ObjectReference targetRef)
  targetRef.RemoveAllItems(lootingRef, False, False) ; #DEBUG_LINE_NO:44
  targetRef.AddKeyword(RELootedCorpse) ; #DEBUG_LINE_NO:45
EndFunction

Function UpdateGlobalCooldown()
  REGlobalCooldown.SetValue(GameDaysPassed.GetValue() + GlobalCooldownDays) ; #DEBUG_LINE_NO:50
EndFunction

Function RandomlyEnableOrKill(ReferenceAlias theAlias, Int PercentChanceEnable, Int PercentChanceKill)
  Self.RandomlyEnableOrKillActor(theAlias.GetActorRef(), PercentChanceEnable, PercentChanceKill) ; #DEBUG_LINE_NO:56
EndFunction

Function RandomlyEnableOrKillCollection(RefCollectionAlias theCollection, Int PercentChanceEnable, Int PercentChanceKill, Int minimumEnableCount)
  Int I = 0 ; #DEBUG_LINE_NO:60
  While I < theCollection.GetCount() ; #DEBUG_LINE_NO:61
    Actor theActor = theCollection.GetAt(I) as Actor ; #DEBUG_LINE_NO:62
    If I < minimumEnableCount ; #DEBUG_LINE_NO:63
      theActor.Enable(False) ; #DEBUG_LINE_NO:64
    Else ; #DEBUG_LINE_NO:
      Self.RandomlyEnableOrKillActor(theActor, PercentChanceEnable, PercentChanceKill) ; #DEBUG_LINE_NO:66
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:68
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RandomlyEnableOrKillActor(Actor theActor, Int PercentChanceEnable, Int PercentChanceKill)
  If theActor ; #DEBUG_LINE_NO:73
    If Utility.RandomInt(0, 100) <= PercentChanceEnable ; #DEBUG_LINE_NO:74
      theActor.Enable(False) ; #DEBUG_LINE_NO:75
      If Utility.RandomInt(0, 100) <= PercentChanceKill ; #DEBUG_LINE_NO:76
        theActor.KillSilent(None) ; #DEBUG_LINE_NO:77
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      theActor.KillSilent(None) ; #DEBUG_LINE_NO:80
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SendCleanupEvent()
  Self.SendCustomEvent("reparentscript_RECheckForCleanup", None) ; #DEBUG_LINE_NO:87
EndFunction
