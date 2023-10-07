ScriptName COM_CommitmentQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CompanionAlias Auto Const mandatory
ReferenceAlias Property CommitmentGiftAlias Auto Const mandatory
MiscObject Property CommitmentGift Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory

;-- Functions ---------------------------------------

Function GiveCommitmentGift()
  Game.GetPlayer().AddAliasedItem(CommitmentGift as Form, CommitmentGiftAlias as Alias, 1, False) ; #DEBUG_LINE_NO:9
  (SQ_Companions as sq_companionsscript).CommitmentGifts.AddRef(CommitmentGiftAlias.GetRef()) ; #DEBUG_LINE_NO:10
EndFunction

Function MakeCommitted()
  (CompanionAlias.GetActorReference() as companionactorscript).COM_CompanionQuest.MakeCommitted() ; #DEBUG_LINE_NO:14
EndFunction
