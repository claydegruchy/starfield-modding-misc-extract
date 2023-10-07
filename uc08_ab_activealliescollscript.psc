ScriptName UC08_AB_ActiveAlliesCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------
Bool bDoOnce
Int iKillCount

;-- Properties --------------------------------------
Int Property WrapUpStage = 900 Auto Const
{ Stage denoting the sequence is done }
Faction Property UC08_PlayerAlignedNPCAllyFaction Auto Const mandatory
{ Faction applied to the player's allied critters }
Faction Property PlayerAllyFaction Auto Const mandatory
{ Faction applied to the player's allied critters }
Faction Property PlayerEnemyFaction Auto Const mandatory
{ Faction applied to the player's allied critters if the player kills any of them after the fight }
Int Property iFreebieCount = 1 Auto Const
{ How many free kills I'll let the player get before turning the NPCs on the player }

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:23
  If !bDoOnce && (akKiller == Game.GetPlayer() as ObjectReference) && Self.GetOwningQuest().GetStageDone(WrapUpStage) ; #DEBUG_LINE_NO:26
    If iKillCount < iFreebieCount ; #DEBUG_LINE_NO:28
      iKillCount += 1 ; #DEBUG_LINE_NO:29
    Else ; #DEBUG_LINE_NO:
      bDoOnce = True ; #DEBUG_LINE_NO:31
      Self.TurnAlliesToFoes() ; #DEBUG_LINE_NO:32
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function TurnAlliesToFoes()
  Int I = 0 ; #DEBUG_LINE_NO:38
  Int iCount = Self.GetCount() ; #DEBUG_LINE_NO:39
  While I < iCount ; #DEBUG_LINE_NO:41
    Actor currACT = Self.GetAt(I) as Actor ; #DEBUG_LINE_NO:42
    currACT.RemoveFromFaction(UC08_PlayerAlignedNPCAllyFaction) ; #DEBUG_LINE_NO:44
    currACT.RemoveFromFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:45
    currACT.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:46
    I += 1 ; #DEBUG_LINE_NO:48
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
