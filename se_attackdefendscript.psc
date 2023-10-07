ScriptName SE_AttackDefendScript Extends Quest
{ Handles spawning ships for SE_Attack encounters.  Deadcounts must be defined in SEScript and RECollectionAlias scripts for each group }

;-- Variables ---------------------------------------
Int AttackersDeadGroup = 0
Int DefendersDeadGroup = 1
sescript SEQuestScript
Float percentMaxDamage = 0.699999988
Float percentMaxSpeed = 1.0
Float percentMinDamage = 0.100000001

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_AttackersRC Auto Const mandatory
{ RefcollectionAlias that holds all of the enemy ships }
RefCollectionAlias Property Alias_DefendersRC Auto Const mandatory
{ RefcollectionAlias that holds all of the enemy ships }
ActorValue Property Health Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestStarted()
  SEQuestScript = (Self as Quest) as sescript ; #DEBUG_LINE_NO:24
  Self.SetupShips(Alias_AttackersRC, AttackersDeadGroup) ; #DEBUG_LINE_NO:25
  Self.SetupShips(Alias_DefendersRC, DefendersDeadGroup) ; #DEBUG_LINE_NO:26
EndEvent

Function SetupShips(RefCollectionAlias akCurrentRefCol, Int DeadGroup)
  Int I = 0 ; #DEBUG_LINE_NO:31
  Int GroupSize = akCurrentRefCol.GetCount() ; #DEBUG_LINE_NO:32
  Int DeadCount = 0 ; #DEBUG_LINE_NO:33
  While I < GroupSize ; #DEBUG_LINE_NO:35
    spaceshipreference currentShip = akCurrentRefCol.GetAt(I) as spaceshipreference ; #DEBUG_LINE_NO:38
    If currentShip.IsAIEnabled() ; #DEBUG_LINE_NO:39
      currentShip.SetForwardVelocity(percentMaxSpeed) ; #DEBUG_LINE_NO:40
      Float DamagePercent = Utility.RandomFloat(percentMinDamage, percentMaxDamage) ; #DEBUG_LINE_NO:41
      currentShip.DamageValue(Health, currentShip.GetValue(Health) * DamagePercent) ; #DEBUG_LINE_NO:42
      DeadCount += 1 ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:45
  EndWhile ; #DEBUG_LINE_NO:
  If SEQuestScript ; #DEBUG_LINE_NO:48
    SEQuestScript.UpdateDeadCountGroupSize(DeadGroup, DeadCount) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction
