ScriptName RHQ_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property MaxStaggerTime = 0.5 Auto Const
{ Max amount of time between staggered NPCs }

;-- Functions ---------------------------------------

Function StaggerEVP(RefCollectionAlias akTargetColl)
  Int I = akTargetColl.GetCount() - 1 ; #DEBUG_LINE_NO:7
  While I >= 0 ; #DEBUG_LINE_NO:9
    Actor currAct = akTargetColl.GetAt(I) as Actor ; #DEBUG_LINE_NO:10
    If currAct != None && !currAct.IsDead() && currAct.IsEnabled() ; #DEBUG_LINE_NO:12
      Utility.Wait(Utility.RandomFloat(0.0, MaxStaggerTime)) ; #DEBUG_LINE_NO:13
      currAct.EvaluatePackage(False) ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
    akTargetColl.RemoveRef(currAct as ObjectReference) ; #DEBUG_LINE_NO:17
    I -= 1 ; #DEBUG_LINE_NO:19
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
