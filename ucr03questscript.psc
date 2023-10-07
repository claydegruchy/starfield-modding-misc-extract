ScriptName UCR03QuestScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct EnemyShipDatum
  spaceshipbase ShipToSpawn
  { Leveled list we want to spawn }
  GlobalVariable MinEnemies
  { Minimum number of enemy ships to spawn }
  GlobalVariable MaxEnemies
  { Maximum number of enemy ships to spawn }
  Int DialogueIndex = -1
  { This enemy type's dialogue index (if we end up writing custom dialogue per enemy type) }
  Faction BlockingFaction
  { If the player has this faction, don't chose this group }
EndStruct


;-- Variables ---------------------------------------
Int iFailSafeLoops = 20 Const

;-- Properties --------------------------------------
ucr03questscript:enemyshipdatum[] Property EnemyShipData Auto mandatory
{ Collection of data to determine which enemy ships we're spawning }
GlobalVariable Property UCR03_MostRecentEnemyType Auto Const mandatory
{ Global used to prevent the player from getting the same enemy type over and over }
GlobalVariable Property UCR03_SpawnDistanceOffset Auto Const mandatory
{ Global containing the standard offset for spawning in the enemies for this quest }
ReferenceAlias Property GeneralMarker Auto Const mandatory
{ Alias of the general marker in the space (around which all the NPCs will be spawned) }
RefCollectionAlias Property Enemies Auto Const mandatory
{ Holding collection for spawned opponents }
ReferenceAlias Property PatrolingEnemy Auto Const mandatory
{ Alias to give at least one of the ship a patrol }
ReferenceAlias Property PlayerShip Auto Const mandatory
{ Ref alias to the player's current ship }
ActorValue Property Aggression Auto Const mandatory
{ Aggression actor value (to ensure all these enemies are always out for blood) }
Float Property DebugShipSpawnOffset = 250.0 Auto Const
{ Offset used to make sure the spawned enemy ships don't spawn right on the player }
Int Property EnemyIndex Auto
{ Index to know which enemy type we've gotten }
Int Property EnemyDialogueIndex = -1 Auto conditional
{ Index used to keep track of Tuala's custom lines }
Int Property OffsetDistanceZ = 300 Auto Const
{ How much we want to offset each ship from its peers as we spawn them in on the Z axis }
Int Property OffsetDistanceY = 100 Auto Const
{ How much we want to offset each ship from its peers as we spawn them in on the Y axis }
Int Property OffsetRandomizer = 30 Auto Const
{ Rnadomizer number added to the offsets so they don't all look so uniform }

;-- Functions ---------------------------------------

Function SelectEnemySeed()
  Int iMostRecentEnemy = UCR03_MostRecentEnemyType.GetValueInt() ; #DEBUG_LINE_NO:66
  Int iRandomSeed = 0 ; #DEBUG_LINE_NO:67
  Int I = 0 ; #DEBUG_LINE_NO:68
  Bool bFoundEnemy = False ; #DEBUG_LINE_NO:69
  While !bFoundEnemy && I < iFailSafeLoops ; #DEBUG_LINE_NO:71
    Int iRandMax = EnemyShipData.Length - 1 ; #DEBUG_LINE_NO:73
    iRandomSeed = Utility.RandomInt(0, iRandMax) ; #DEBUG_LINE_NO:74
    ucr03questscript:enemyshipdatum currDatum = EnemyShipData[iRandomSeed] ; #DEBUG_LINE_NO:75
    If currDatum.BlockingFaction != None && Game.GetPlayer().IsInFaction(currDatum.BlockingFaction) ; #DEBUG_LINE_NO:80
      EnemyShipData.remove(iRandomSeed, 1) ; #DEBUG_LINE_NO:82
    ElseIf iRandomSeed != iMostRecentEnemy ; #DEBUG_LINE_NO:84
      bFoundEnemy = True ; #DEBUG_LINE_NO:85
      EnemyDialogueIndex = currDatum.DialogueIndex ; #DEBUG_LINE_NO:86
      EnemyIndex = iRandomSeed ; #DEBUG_LINE_NO:87
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:92
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SpawnEnemies(Bool bSpawnAtPlayer)
  Int iDatumIndex = EnemyIndex ; #DEBUG_LINE_NO:100
  If iDatumIndex < 0 || iDatumIndex >= EnemyShipData.Length ; #DEBUG_LINE_NO:103
    iDatumIndex = 0 ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
  ucr03questscript:enemyshipdatum currEnemy = EnemyShipData[iDatumIndex] ; #DEBUG_LINE_NO:107
  Int iNumEnemiesToSpawn = Utility.RandomInt(currEnemy.MinEnemies.GetValueInt(), currEnemy.MaxEnemies.GetValueInt()) ; #DEBUG_LINE_NO:110
  Int I = 0 ; #DEBUG_LINE_NO:111
  While I < iNumEnemiesToSpawn ; #DEBUG_LINE_NO:115
    ObjectReference currSpawn = GeneralMarker.GetRef() ; #DEBUG_LINE_NO:116
    Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:117
    If !bSpawnAtPlayer ; #DEBUG_LINE_NO:119
      Int iRandY = Utility.RandomInt(0, 2) ; #DEBUG_LINE_NO:122
      Int iRandomizer = Utility.RandomInt(0, 2) ; #DEBUG_LINE_NO:123
      Int iRandomizerValue = 0 ; #DEBUG_LINE_NO:124
      If iRandomizer < 1 ; #DEBUG_LINE_NO:126
        iRandomizerValue = OffsetRandomizer ; #DEBUG_LINE_NO:127
      ElseIf iRandomizer == 1 ; #DEBUG_LINE_NO:128
        iRandomizerValue = OffsetRandomizer * -1 ; #DEBUG_LINE_NO:129
      Else ; #DEBUG_LINE_NO:
        iRandomizerValue = 0 ; #DEBUG_LINE_NO:131
      EndIf ; #DEBUG_LINE_NO:
      If iRandY < 1 ; #DEBUG_LINE_NO:134
        offsets[0] = (OffsetDistanceY + iRandomizerValue) as Float ; #DEBUG_LINE_NO:135
      ElseIf iRandY == 1 ; #DEBUG_LINE_NO:136
        offsets[0] = (OffsetDistanceY * -1 + iRandomizerValue) as Float ; #DEBUG_LINE_NO:137
      Else ; #DEBUG_LINE_NO:
        offsets[0] = (OffsetDistanceY * (I + iNumEnemiesToSpawn) + iRandomizerValue) as Float ; #DEBUG_LINE_NO:139
      EndIf ; #DEBUG_LINE_NO:
      offsets[1] = (UCR03_SpawnDistanceOffset.GetValueInt() + iRandomizer) as Float ; #DEBUG_LINE_NO:142
    Else ; #DEBUG_LINE_NO:
      offsets[1] = DebugShipSpawnOffset ; #DEBUG_LINE_NO:144
      currSpawn = PlayerShip.GetRef() ; #DEBUG_LINE_NO:145
    EndIf ; #DEBUG_LINE_NO:
    spaceshipreference newShip = currSpawn.PlaceShipAtMe(currEnemy.ShipToSpawn as Form, 4, True, False, False, True, offsets, None, None, True) ; #DEBUG_LINE_NO:148
    Enemies.AddRef(newShip as ObjectReference) ; #DEBUG_LINE_NO:149
    newShip.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:150
    If PatrolingEnemy.GetRef() == None ; #DEBUG_LINE_NO:156
      PatrolingEnemy.ForceRefTo(newShip as ObjectReference) ; #DEBUG_LINE_NO:157
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:161
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:169
EndFunction
