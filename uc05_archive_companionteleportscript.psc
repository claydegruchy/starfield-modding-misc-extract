ScriptName UC05_Archive_CompanionTeleportScript Extends ReferenceAlias
{ Followers told to wait in Armistice Archives are moved outside the vault to prevent them from getting stuck }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_followersscript Property SQ_Followers Auto Const mandatory
Int Property StageToCheck Auto Const
Cell Property CityNewAtlantisArmisticeArchives Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnCellDetach()
    Actor[] WaitingFollowers = SQ_Followers.GetFollowers(False, True) ; #DEBUG_LINE_NO:13
    If WaitingFollowers[0] != None && Self.GetOwningQuest().GetStageDone(StageToCheck) ; #DEBUG_LINE_NO:14
      Self.goToState("Done") ; #DEBUG_LINE_NO:15
      Int I = 0 ; #DEBUG_LINE_NO:16
      While I < WaitingFollowers.Length ; #DEBUG_LINE_NO:17
        If WaitingFollowers[I].GetParentCell() == CityNewAtlantisArmisticeArchives ; #DEBUG_LINE_NO:18
          SQ_Followers.CommandFollow(WaitingFollowers[I]) ; #DEBUG_LINE_NO:19
          WaitingFollowers[I].MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:22
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
