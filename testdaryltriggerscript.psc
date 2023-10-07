ScriptName TestDarylTriggerScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property EnemySpawnPoint Auto Const mandatory
ObjectReference Property EnemySpawnButton Auto Const mandatory
ActorBase Property EnemyToSpawn Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  Self.RegisterForRemoteEvent(EnemySpawnButton as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:9
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  EnemySpawnPoint.PlaceActorAtMe(EnemyToSpawn, 4, None, False, False, True, None, True) ; #DEBUG_LINE_NO:23
EndEvent
