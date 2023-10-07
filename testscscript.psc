ScriptName TestSCScript Extends Quest
{ Quest script for TestSC, the Test Space Combat quest. }

;-- Variables ---------------------------------------
Actor player
Int pridEnemyIndex
Bool waitingForPlayerToSit

;-- Properties --------------------------------------
Group QuestProperties
  Int Property TestDefaultPlayerLevel = 35 Auto Const
  { DEFAULT=35. When running test commands, if no level is specified, set the player to this level. }
  spaceshipbase[] Property TestPlayerShips Auto Const mandatory
  { Array of potential player test ships. }
  Int Property TestDefaultEnemyShipSpawnDistance = 700 Auto Const
  { Default=500. When running test commands, if spawning an enemy ship, and no distance is specified, spawn the ship(s) at this distance from the player. }
  Int Property TestDefaultEnemyShipLevelMod = 3 Auto Const
  { Default=3, Hard, player level. When running test commands, if spawning an enemy ship, and no level mod is specified, spawn the ship(s) with this level mod. }
  spaceshipbase[] Property TestEnemyShips Auto Const mandatory
  { Array of potential enemy test ships. }
  Cell[] Property TestEnemySpaceCells Auto Const mandatory
  { Array of potential enemy ship space cells. }
EndGroup

Group AutofillProperties
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property TestSpaceCombatStartMarker Auto Const mandatory
  RefCollectionAlias Property EnemyShips Auto Const mandatory
  ActorValue Property Experience Auto Const mandatory
  ObjectReference Property CTestCOCMarkerRef Auto Const mandatory
  ObjectReference Property NewGameShipMarkerRef Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function TracePlayer()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  player = Game.GetPlayer() ; #DEBUG_LINE_NO:47
EndEvent

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
  waitingForPlayerToSit = False ; #DEBUG_LINE_NO:51
EndEvent

Function SetLevel(Int level)
  If level <= 0 ; #DEBUG_LINE_NO:60
    level = TestDefaultPlayerLevel ; #DEBUG_LINE_NO:61
  EndIf ; #DEBUG_LINE_NO:
  Int currentLevel = Game.GetPlayerLevel() ; #DEBUG_LINE_NO:63
  If currentLevel < level ; #DEBUG_LINE_NO:64
    Float currentXP = Game.GetXPForLevel(currentLevel) as Float ; #DEBUG_LINE_NO:65
    Float targetXP = Game.GetXPForLevel(level) as Float ; #DEBUG_LINE_NO:66
    player.SetValue(Experience, targetXP - currentXP) ; #DEBUG_LINE_NO:67
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:68
  ElseIf currentLevel > level ; #DEBUG_LINE_NO:70
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetShipIfNeeded(Int shipID)
  If PlayerShip.GetShipRef() == None ; #DEBUG_LINE_NO:77
    Self.SetShip(shipID) ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetShip(Int shipID)
  If shipID >= 0 && shipID < TestPlayerShips.Length ; #DEBUG_LINE_NO:83
    Self.SetShipBase(TestPlayerShips[shipID]) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetShipBase(spaceshipbase shipBase)
  spaceshipreference oldShip = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:91
  If oldShip != None ; #DEBUG_LINE_NO:92
    PlayerShipPilotSeat.GetRef().Activate(player as ObjectReference, False) ; #DEBUG_LINE_NO:93
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:94
    player.MoveTo(CTestCOCMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:95
    oldShip.DisableNoWait(False) ; #DEBUG_LINE_NO:96
    oldShip.Delete() ; #DEBUG_LINE_NO:97
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference newShip = NewGameShipMarkerRef.PlaceShipAtMe(shipBase as Form, 4, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:99
  SQ_PlayerShip.ResetPlayerShip(newShip) ; #DEBUG_LINE_NO:100
  SQ_PlayerShip.ResetHomeShip(newShip) ; #DEBUG_LINE_NO:101
  inputenablelayer myEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:102
  myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:103
  player.MoveTo(newShip as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:104
  SQ_PlayerShip.HandleShipTakeOff(True, False) ; #DEBUG_LINE_NO:105
  PlayerShipPilotSeat.GetRef().Activate(player as ObjectReference, False) ; #DEBUG_LINE_NO:106
  myEnableLayer.Delete() ; #DEBUG_LINE_NO:107
  waitingForPlayerToSit = True ; #DEBUG_LINE_NO:108
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnSit") ; #DEBUG_LINE_NO:109
  While waitingForPlayerToSit ; #DEBUG_LINE_NO:
    Utility.Wait(0.5) ; #DEBUG_LINE_NO:111
  EndWhile ; #DEBUG_LINE_NO:
  newShip.MoveTo(TestSpaceCombatStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:113
EndFunction

Function SpawnEnemy(Int enemyID, Int count, Int distance, Int levelMod, Bool shouldNotDeleteEnemies)
  Self.SetLevel(-1) ; #DEBUG_LINE_NO:118
  Self.SetShipIfNeeded(0) ; #DEBUG_LINE_NO:119
  If enemyID < 0 || enemyID >= TestEnemyShips.Length ; #DEBUG_LINE_NO:120
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    If !shouldNotDeleteEnemies ; #DEBUG_LINE_NO:123
      Self.DeleteEnemies() ; #DEBUG_LINE_NO:124
    EndIf ; #DEBUG_LINE_NO:
    If count <= 0 ; #DEBUG_LINE_NO:126
      count = 1 ; #DEBUG_LINE_NO:127
    EndIf ; #DEBUG_LINE_NO:
    If distance <= 0 ; #DEBUG_LINE_NO:129
      distance = TestDefaultEnemyShipSpawnDistance ; #DEBUG_LINE_NO:130
    EndIf ; #DEBUG_LINE_NO:
    If levelMod <= 0 ; #DEBUG_LINE_NO:132
      levelMod = TestDefaultEnemyShipLevelMod ; #DEBUG_LINE_NO:133
    EndIf ; #DEBUG_LINE_NO:
    levelMod -= 1 ; #DEBUG_LINE_NO:135
    spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:136
    Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:137
    offsets[1] = distance as Float ; #DEBUG_LINE_NO:138
    offsets[5] = 180.0 ; #DEBUG_LINE_NO:139
    Int I = 0 ; #DEBUG_LINE_NO:140
    While I < count ; #DEBUG_LINE_NO:141
      offsets[0] = (I * 125) as Float ; #DEBUG_LINE_NO:142
      spaceshipreference newEnemyShip = playerShipRef.PlaceShipAtMe(TestEnemyShips[enemyID] as Form, levelMod, False, False, False, True, offsets, None, None, True) ; #DEBUG_LINE_NO:143
      EnemyShips.AddRef(newEnemyShip as ObjectReference) ; #DEBUG_LINE_NO:144
      I += 1 ; #DEBUG_LINE_NO:146
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SpawnEnemyCell(Int cellID, Bool shouldNotDeleteEnemies)
  If cellID >= 0 && cellID < TestEnemySpaceCells.Length ; #DEBUG_LINE_NO:153
    Self.SpawnEnemyCellName(TestEnemySpaceCells[cellID], shouldNotDeleteEnemies) ; #DEBUG_LINE_NO:154
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SpawnEnemyCellName(Cell cellToPlace, Bool shouldNotDeleteEnemies)
  Self.SetLevel(-1) ; #DEBUG_LINE_NO:161
  Self.SetShipIfNeeded(0) ; #DEBUG_LINE_NO:162
  If !shouldNotDeleteEnemies ; #DEBUG_LINE_NO:163
    Self.DeleteEnemies() ; #DEBUG_LINE_NO:164
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:166
  playerShipRef.PlaceCellAtMe(cellToPlace, EnemyShips, False, True, False, None) ; #DEBUG_LINE_NO:167
  spaceshipreference[] enemyShipRefs = EnemyShips.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:168
  If enemyShipRefs != None ; #DEBUG_LINE_NO:169
    Int I = 0 ; #DEBUG_LINE_NO:170
    While I < enemyShipRefs.Length ; #DEBUG_LINE_NO:171
      I += 1 ; #DEBUG_LINE_NO:173
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DeleteEnemies()
  spaceshipreference[] enemyShipRefs = EnemyShips.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:180
  If enemyShipRefs != None ; #DEBUG_LINE_NO:181
    Int I = 0 ; #DEBUG_LINE_NO:182
    While I < enemyShipRefs.Length ; #DEBUG_LINE_NO:183
      spaceshipreference current = enemyShipRefs[I] ; #DEBUG_LINE_NO:184
      EnemyShips.RemoveRef(enemyShipRefs[I] as ObjectReference) ; #DEBUG_LINE_NO:185
      enemyShipRefs[I].DisableNoWait(False) ; #DEBUG_LINE_NO:186
      enemyShipRefs[I].Delete() ; #DEBUG_LINE_NO:187
      I += 1 ; #DEBUG_LINE_NO:188
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ResetPosition()
  PlayerShip.GetRef().MoveTo(TestSpaceCombatStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:195
EndFunction

Function ResetAll()
  Self.DeleteEnemies() ; #DEBUG_LINE_NO:199
  Self.ResetPosition() ; #DEBUG_LINE_NO:200
EndFunction

Function TraceEnemies()
  Int enemyShipCount = EnemyShips.GetCount() ; #DEBUG_LINE_NO:210
  If enemyShipCount == 0 ; #DEBUG_LINE_NO:211
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    spaceshipreference[] enemyShipRefs = EnemyShips.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:214
    Int I = 0 ; #DEBUG_LINE_NO:215
    While I < enemyShipRefs.Length ; #DEBUG_LINE_NO:216
      I += 1 ; #DEBUG_LINE_NO:218
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
