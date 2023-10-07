ScriptName UCR05QuestScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct TargetDatum
  ActorBase Target
  { Lvl used to spawn an appropriate NPC }
  Int TargetIndex = -1
  { Index used to manage any custom dialogue or behaviors in the quest }
EndStruct


;-- Variables ---------------------------------------
Int iSpawnIndex

;-- Properties --------------------------------------
ucr05questscript:targetdatum[] Property PossibleTargets Auto Const mandatory
{ Array of targets for the quest }
ReferenceAlias Property ChosenTarget Auto Const mandatory
{ Alias that holds the chosen target and any specific behaviors }
ReferenceAlias Property Bodyguard Auto Const mandatory
{ Alias for the player's bodyguard }
Int Property TargetIndex = -1 Auto conditional
{ Property used to keep track of any custom dialogue/behaviors for this NPC }
RefCollectionAlias Property PossibleSpawnPoints Auto Const mandatory
{ Collection of possible spawn points for our target }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Int iRand = Utility.RandomInt(0, PossibleTargets.Length - 1) ; #DEBUG_LINE_NO:30
  If iRand < 0 || iRand >= PossibleTargets.Length ; #DEBUG_LINE_NO:32
    iRand = 0 ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
  iSpawnIndex = iRand ; #DEBUG_LINE_NO:36
  Self.SpawnTarget(iRand, False, False) ; #DEBUG_LINE_NO:38
EndEvent

Function SpawnTarget(Int iTargetIndex, Bool bSpawnAtPlayer, Bool bAttemptRespawn)
  If iTargetIndex < 0 || iTargetIndex >= PossibleTargets.Length ; #DEBUG_LINE_NO:42
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    If bAttemptRespawn ; #DEBUG_LINE_NO:45
      iTargetIndex = iSpawnIndex ; #DEBUG_LINE_NO:46
    EndIf ; #DEBUG_LINE_NO:
    ucr05questscript:targetdatum currDatum = PossibleTargets[iTargetIndex] ; #DEBUG_LINE_NO:50
    ActorBase TargetType = currDatum.Target ; #DEBUG_LINE_NO:51
    Int iRand = Utility.RandomInt(0, PossibleSpawnPoints.GetCount() - 1) ; #DEBUG_LINE_NO:54
    ObjectReference SpawnRef = PossibleSpawnPoints.GetAt(iRand) ; #DEBUG_LINE_NO:55
    ObjectReference TargetRef = SpawnRef.PlaceAtMe(TargetType as Form, 1, False, True, True, None, ChosenTarget as Alias, True) ; #DEBUG_LINE_NO:58
    TargetRef.MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:59
    TargetRef.Enable(False) ; #DEBUG_LINE_NO:60
    (TargetRef as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:61
    Actor BodyACT = Bodyguard.GetActorRef() ; #DEBUG_LINE_NO:64
    BodyACT.MoveTo(TargetRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:65
    BodyACT.MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:66
    BodyACT.Enable(False) ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:75
EndFunction
