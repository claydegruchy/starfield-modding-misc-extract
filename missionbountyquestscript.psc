ScriptName MissionBountyQuestScript Extends missionquestscript
{ for bounty missions that need to select enemy type }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Bounty
  ReferenceAlias Property EnemyType Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Actor enemyActor = PrimaryRef.GetActorRef() ; #DEBUG_LINE_NO:11
  If enemyActor ; #DEBUG_LINE_NO:12
    Int I = 0 ; #DEBUG_LINE_NO:13
    Form enemyTypeMarker = None ; #DEBUG_LINE_NO:14
    While I < MissionParent.enemyTypes.Length && enemyTypeMarker == None ; #DEBUG_LINE_NO:15
      missionparentscript:missionenemytype theEnemyType = MissionParent.enemyTypes[I] ; #DEBUG_LINE_NO:16
      If enemyActor.IsInFaction(theEnemyType.enemyFaction) ; #DEBUG_LINE_NO:17
        enemyTypeMarker = theEnemyType.enemyName ; #DEBUG_LINE_NO:18
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:20
    EndWhile ; #DEBUG_LINE_NO:
    If enemyTypeMarker ; #DEBUG_LINE_NO:22
      EnemyType.ForceRefTo(enemyActor.PlaceAtMe(enemyTypeMarker, 1, False, True, True, None, None, True)) ; #DEBUG_LINE_NO:23
      Parent.OnQuestStarted() ; #DEBUG_LINE_NO:24
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.Stop() ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndEvent
