ScriptName Fragments:Quests:QF_SQ_RemoveItem01_00_000256C6 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property BotPickUpSound Auto Const mandatory
ReferenceAlias Property Bot Auto Const
ReferenceAlias Property theItem Auto Const
wwiseevent Property BotSuccessSound Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0010_Item_00()
  ObjectReference theBot = Bot.GetRef() ; #DEBUG_LINE_NO:25
  theBot.AddItem(theItem.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:26
  Int s1 = BotPickUpSound.Play(theBot, None, None) ; #DEBUG_LINE_NO:27
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:28
  Int s2 = BotSuccessSound.Play(theBot, None, None) ; #DEBUG_LINE_NO:29
  Self.Stop() ; #DEBUG_LINE_NO:30
EndFunction
