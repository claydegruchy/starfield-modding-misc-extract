ScriptName UC06_CompanionWaitScript Extends ReferenceAlias Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group CompanionResponseMarkup
  Bool Property PlayCompanionResponseScene = False Auto Const
  Scene Property CompanionResponseScene Auto Const
  Quest Property CompanionResponsePrereqQuest Auto Const
  Int Property CompanionResponsePrereqStage Auto Const
  ReferenceAlias Property Companion Auto Const
EndGroup

ReferenceAlias Property Alias_WaitHereMarker Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
Keyword Property WaitTriggerKeyword Auto Const mandatory
ReferenceAlias Property Alias_ResumeTrigger Auto Const mandatory
RefCollectionAlias Property Alias_WaitingCompanions Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  ObjectReference myTrigger = Self.GetRef() ; #DEBUG_LINE_NO:26
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:27
    If myTrigger.HasKeyword(WaitTriggerKeyword) ; #DEBUG_LINE_NO:31
      Actor[] ActorsNewlyToldToWaitAtMyRef = SQ_Followers.AllFollowersWait(Alias_WaitHereMarker.GetRef(), True, False) ; #DEBUG_LINE_NO:32
      Int I = 0 ; #DEBUG_LINE_NO:33
      While I < ActorsNewlyToldToWaitAtMyRef.Length ; #DEBUG_LINE_NO:34
        Alias_WaitingCompanions.AddRef(ActorsNewlyToldToWaitAtMyRef[I] as ObjectReference) ; #DEBUG_LINE_NO:35
        I += 1 ; #DEBUG_LINE_NO:36
      EndWhile ; #DEBUG_LINE_NO:
      Alias_ResumeTrigger.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:38
      If PlayCompanionResponseScene && CompanionResponsePrereqQuest.GetStageDone(CompanionResponsePrereqStage) && Companion.GetRef() != None ; #DEBUG_LINE_NO:41
        CompanionResponseScene.Start() ; #DEBUG_LINE_NO:42
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Actor[] ActorsToFollowMyRef = Alias_WaitingCompanions.GetActorArray() ; #DEBUG_LINE_NO:45
      If ActorsToFollowMyRef[0] != None ; #DEBUG_LINE_NO:46
        SQ_Followers.AllFollowersFollow(ActorsToFollowMyRef) ; #DEBUG_LINE_NO:47
        Alias_WaitingCompanions.RemoveAll() ; #DEBUG_LINE_NO:48
      EndIf ; #DEBUG_LINE_NO:
      myTrigger.DisableNoWait(False) ; #DEBUG_LINE_NO:50
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnCellDetach()
  Actor[] ActorsToFollowMyRef = Alias_WaitingCompanions.GetActorArray() ; #DEBUG_LINE_NO:57
  If ActorsToFollowMyRef[0] != None ; #DEBUG_LINE_NO:58
    SQ_Followers.TeleportFollowers(Game.GetPlayer() as ObjectReference, ActorsToFollowMyRef, True, True, False, False, False) ; #DEBUG_LINE_NO:59
    SQ_Followers.AllFollowersFollow(ActorsToFollowMyRef) ; #DEBUG_LINE_NO:60
    Alias_WaitingCompanions.RemoveAll() ; #DEBUG_LINE_NO:61
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference myTrigger = Self.GetRef() ; #DEBUG_LINE_NO:63
  If !myTrigger.HasKeyword(WaitTriggerKeyword) && myTrigger.IsEnabled() ; #DEBUG_LINE_NO:64
    myTrigger.DisableNoWait(False) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
EndEvent
