ScriptName Fragments:Quests:QF_RQ_OE_Deliver_01_00043278 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Item Auto Const mandatory
ReferenceAlias Property Alias_Recipient Auto Const mandatory
Keyword Property AnimArchetypeDepressed Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:15
  rq_deliverscript kmyQuest = __temp as rq_deliverscript ; #DEBUG_LINE_NO:16
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:19
  Alias_Recipient.TryToEnable() ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0485_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:28
  rq_deliverscript kmyQuest = __temp as rq_deliverscript ; #DEBUG_LINE_NO:29
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:32
  kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:33
  Self.SetStage(990) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:42
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0800_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Item.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:51
  Actor recipient = Alias_Recipient.GetActorRef() ; #DEBUG_LINE_NO:52
  recipient.ChangeAnimArchetype(AnimArchetypeDepressed) ; #DEBUG_LINE_NO:53
  Self.SetStage(900) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0850_Item_00()
  Alias_Recipient.TryToDisable() ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:71
  Self.SetStage(990) ; #DEBUG_LINE_NO:72
EndFunction
