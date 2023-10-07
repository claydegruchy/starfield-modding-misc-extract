ScriptName GenericBrawlScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property EndTimerID = 1 Auto Const
Float Property EndTime = 30.0 Auto Const
ReferenceAlias Property Opponent Auto Const
ReferenceAlias Property OpponentFriend Auto Const
RefCollectionAlias Property PlayerAllies Auto Const
Weapon Property Unarmed Auto Const
ActorValue Property GenericBrawlWinner Auto Const
ActorValue Property GenericBrawlLoser Auto Const
Int Property EndBrawlStage = 200 Auto Const
Int Property PlayerWinsStage = 15 Auto Const
Int Property PlayerDefeatedStage = 180 Auto Const
Int Property CheatingStage = 150 Auto Const
Int Property QuestDoneStage = 250 Auto Const
{ quests can look for this stage to be done to trigger 'react to end of brawl' content }

;-- Functions ---------------------------------------

Function StartBrawl(Bool bStart)
  Actor OpponentREF = Opponent.GetActorRef() ; #DEBUG_LINE_NO:4
  Actor OpponentFriendREF = OpponentFriend.GetActorRef() ; #DEBUG_LINE_NO:5
  OpponentREF.SetNoBleedoutRecovery(bStart) ; #DEBUG_LINE_NO:8
  OpponentREF.AllowBleedoutDialogue(bStart) ; #DEBUG_LINE_NO:9
  (Opponent as genericbrawlopponentaliasscript).StartUpdateTimer(bStart) ; #DEBUG_LINE_NO:11
  If OpponentFriendREF ; #DEBUG_LINE_NO:12
    OpponentFriendREF.SetNoBleedoutRecovery(bStart) ; #DEBUG_LINE_NO:13
    (OpponentFriend as genericbrawlopponentaliasscript).StartUpdateTimer(bStart) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
  If bStart ; #DEBUG_LINE_NO:17
    Game.GetPlayer().EquipItem(Unarmed as Form, False, True) ; #DEBUG_LINE_NO:19
    OpponentREF.EquipItem(Unarmed as Form, False, True) ; #DEBUG_LINE_NO:20
    OpponentREF.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:22
    If OpponentFriendREF ; #DEBUG_LINE_NO:24
      OpponentFriendREF.EquipItem(Unarmed as Form, False, True) ; #DEBUG_LINE_NO:25
      OpponentFriendREF.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:26
    EndIf ; #DEBUG_LINE_NO:
    Int I = 0 ; #DEBUG_LINE_NO:30
    While I < PlayerAllies.GetCount() ; #DEBUG_LINE_NO:31
      Actor theAlly = PlayerAllies.GetAt(I) as Actor ; #DEBUG_LINE_NO:32
      If theAlly ; #DEBUG_LINE_NO:33
        theAlly.EquipItem(Unarmed as Form, False, True) ; #DEBUG_LINE_NO:34
        theAlly.StartCombat(OpponentREF as ObjectReference, False) ; #DEBUG_LINE_NO:35
        OpponentREF.StartCombat(theAlly as ObjectReference, False) ; #DEBUG_LINE_NO:36
        If OpponentFriendREF ; #DEBUG_LINE_NO:37
          theAlly.StartCombat(OpponentFriendREF as ObjectReference, False) ; #DEBUG_LINE_NO:38
          OpponentFriendREF.StartCombat(theAlly as ObjectReference, False) ; #DEBUG_LINE_NO:39
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:42
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function OpponentDefeated()
  Self.StopBrawlCombat() ; #DEBUG_LINE_NO:50
  Opponent.GetActorRef().ModValue(GenericBrawlLoser, 1.0) ; #DEBUG_LINE_NO:51
  Self.StartEndingTimer() ; #DEBUG_LINE_NO:52
EndFunction

Function PlayerDefeated()
  Self.StopBrawlCombat() ; #DEBUG_LINE_NO:57
  Opponent.GetActorRef().ModValue(GenericBrawlWinner, 1.0) ; #DEBUG_LINE_NO:58
  Self.StartEndingTimer() ; #DEBUG_LINE_NO:59
EndFunction

Function StopBrawlCombat()
  Actor OpponentREF = Opponent.GetActorRef() ; #DEBUG_LINE_NO:64
  Actor OpponentFriendREF = OpponentFriend.GetActorRef() ; #DEBUG_LINE_NO:65
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:66
  OpponentREF.StopCombatAlarm() ; #DEBUG_LINE_NO:67
  If OpponentFriendREF ; #DEBUG_LINE_NO:68
    OpponentFriendREF.StopCombatAlarm() ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartEndingTimer()
  Self.StartTimer(EndTime, EndTimerID) ; #DEBUG_LINE_NO:75
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == EndTimerID ; #DEBUG_LINE_NO:79
    Self.Stop() ; #DEBUG_LINE_NO:81
  EndIf ; #DEBUG_LINE_NO:
EndEvent
