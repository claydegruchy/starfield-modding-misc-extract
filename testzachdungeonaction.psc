ScriptName TestZachDungeonAction Extends ObjectReference

;-- Variables ---------------------------------------
Int hasRun = 0

;-- Properties --------------------------------------
Keyword Property SpawnLink Auto Const mandatory
ActorBase Property EnemyType Auto Const mandatory
Int Property MaxEnemies Auto Const mandatory
ObjectReference Property OptionAMarker Auto Const mandatory
ObjectReference Property OptionBMarker Auto Const mandatory
ObjectReference Property SpawnPoint Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If hasRun == 0 ; #DEBUG_LINE_NO:17
    Self.SetLevelState() ; #DEBUG_LINE_NO:18
    Self.SpawnEnemies() ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SpawnEnemies()
  ObjectReference[] Spawnpoints = Self.GetLinkedRefChain(SpawnLink, 100) ; #DEBUG_LINE_NO:27
  Int numEnemies = Utility.RandomInt(1, MaxEnemies) ; #DEBUG_LINE_NO:28
  Int I = 0 ; #DEBUG_LINE_NO:29
  While I < numEnemies ; #DEBUG_LINE_NO:30
    Int l = Spawnpoints.Length ; #DEBUG_LINE_NO:31
    Int r = Utility.RandomInt(0, l - 1) ; #DEBUG_LINE_NO:32
    ObjectReference m = Spawnpoints[r] ; #DEBUG_LINE_NO:33
    SpawnPoint.PlaceActorAtMe(EnemyType, 1, None, False, False, True, None, True) ; #DEBUG_LINE_NO:35
    Spawnpoints.remove(r, 1) ; #DEBUG_LINE_NO:36
    I += 1 ; #DEBUG_LINE_NO:37
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetLevelState()
  OptionAMarker.Enable(False) ; #DEBUG_LINE_NO:43
  OptionBMarker.Enable(False) ; #DEBUG_LINE_NO:44
  If Utility.RandomInt(0, 1) == 1 ; #DEBUG_LINE_NO:46
    OptionAMarker.Disable(False) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
  If Utility.RandomInt(0, 1) == 1 ; #DEBUG_LINE_NO:50
    OptionBMarker.Disable(False) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndFunction
