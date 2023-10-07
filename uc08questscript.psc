ScriptName UC08QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard FollowerStateGuard

;-- Properties --------------------------------------
sq_followersscript Property SQ_Followers Auto Const mandatory
{ Followers quest property }
ReferenceAlias Property Hadrian Auto Const mandatory
{ Ref alias for Hadrian }
ReferenceAlias Property Kaiser Auto Const mandatory
{ Ref alias for Kaiser }
GlobalVariable Property UC08_HadrianKaiserFollowingPlayer Auto Const mandatory
{ Global used to track if Hadrian and Kaiser are currently following the player }
Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const mandatory
{ Keyword used to manage the companions using their custom followers package or not }

;-- Functions ---------------------------------------

Function ToggleFollowerState(Int iForceState)
  Guard FollowerStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:21
    Int iFollowerState = UC08_HadrianKaiserFollowingPlayer.GetValueInt() ; #DEBUG_LINE_NO:22
    Actor HadACT = Hadrian.GetActorRef() ; #DEBUG_LINE_NO:23
    Actor KaiACT = Kaiser.GetActorRef() ; #DEBUG_LINE_NO:24
    If iForceState >= 0 ; #DEBUG_LINE_NO:26
      If iForceState == 0 ; #DEBUG_LINE_NO:28
        UC08_HadrianKaiserFollowingPlayer.SetValue(1.0) ; #DEBUG_LINE_NO:29
      ElseIf iForceState == 1 ; #DEBUG_LINE_NO:31
        UC08_HadrianKaiserFollowingPlayer.SetValue(0.0) ; #DEBUG_LINE_NO:32
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If iFollowerState < 1 ; #DEBUG_LINE_NO:36
      UC08_HadrianKaiserFollowingPlayer.SetValue(1.0) ; #DEBUG_LINE_NO:37
      HadACT.AddKeyword(SQ_Followers_UseFollowPlayerCustom) ; #DEBUG_LINE_NO:38
      KaiACT.AddKeyword(SQ_Followers_UseFollowPlayerCustom) ; #DEBUG_LINE_NO:39
      SQ_Followers.SetRoleActive(HadACT, False, True, 0.0, 0.0) ; #DEBUG_LINE_NO:40
      SQ_Followers.SetRoleActive(KaiACT, False, True, 0.0, 0.0) ; #DEBUG_LINE_NO:41
      SQ_Followers.CommandFollow(HadACT) ; #DEBUG_LINE_NO:42
      SQ_Followers.CommandFollow(KaiACT) ; #DEBUG_LINE_NO:43
    Else ; #DEBUG_LINE_NO:
      UC08_HadrianKaiserFollowingPlayer.SetValue(0.0) ; #DEBUG_LINE_NO:45
      HadACT.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom) ; #DEBUG_LINE_NO:46
      KaiACT.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom) ; #DEBUG_LINE_NO:47
      SQ_Followers.SetRoleInactive(HadACT, False, False, True) ; #DEBUG_LINE_NO:48
      SQ_Followers.SetRoleInactive(KaiACT, False, False, True) ; #DEBUG_LINE_NO:49
    EndIf ; #DEBUG_LINE_NO:
    HadACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:52
    KaiACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:53
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function CatchUpFollowers()
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:58
  Kaiser.GetRef().Moveto(PlayREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:59
  Hadrian.GetRef().Moveto(PlayREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:60
EndFunction

Function JumpFollowersToPackageDest()
  Kaiser.GetActorRef().MoveToPackageLocation() ; #DEBUG_LINE_NO:64
  Hadrian.GetActorRef().MoveToPackageLocation() ; #DEBUG_LINE_NO:65
EndFunction

Function EVPFollowers()
  Kaiser.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:69
  Hadrian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:70
EndFunction

Function PauseFollowers()
  SQ_Followers.SetRoleInactive(Hadrian.GetActorRef(), False, False, True) ; #DEBUG_LINE_NO:74
  SQ_Followers.SetRoleInactive(Kaiser.GetActorRef(), False, False, True) ; #DEBUG_LINE_NO:75
EndFunction

Function ResumeFollowers()
  Actor HadACT = Hadrian.GetActorRef() ; #DEBUG_LINE_NO:79
  Actor KaiACT = Kaiser.GetActorRef() ; #DEBUG_LINE_NO:80
  SQ_Followers.SetRoleActive(HadACT, False, True, 0.0, 0.0) ; #DEBUG_LINE_NO:81
  SQ_Followers.SetRoleActive(KaiACT, False, True, 0.0, 0.0) ; #DEBUG_LINE_NO:82
  SQ_Followers.CommandFollow(HadACT) ; #DEBUG_LINE_NO:84
  SQ_Followers.CommandFollow(KaiACT) ; #DEBUG_LINE_NO:85
  Self.EVPFollowers() ; #DEBUG_LINE_NO:86
EndFunction

Function ToggleLazPlants(RefCollectionAlias akTargetCollection)
  Int I = 0 ; #DEBUG_LINE_NO:90
  Int iCount = akTargetCollection.GetCount() ; #DEBUG_LINE_NO:91
  While I < iCount ; #DEBUG_LINE_NO:93
    ObjectReference currRef = akTargetCollection.GetAt(I) ; #DEBUG_LINE_NO:94
    currRef.PlayAnimation("Stage2") ; #DEBUG_LINE_NO:96
    I += 1 ; #DEBUG_LINE_NO:98
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
