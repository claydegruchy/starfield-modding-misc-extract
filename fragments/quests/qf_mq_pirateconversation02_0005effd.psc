ScriptName Fragments:Quests:QF_MQ_PirateConversation02_0005EFFD Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ_PirateConversation02Scene Auto Const mandatory
ReferenceAlias Property Alias_MQ_PirateScene02A Auto Const mandatory
ReferenceAlias Property Alias_MQ_PirateScene02B Auto Const mandatory
ActorBase Property MQ_PirateScene02A Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  MQ_PirateConversation02Scene.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0255_Item_00()
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:17
  Self.Stop() ; #DEBUG_LINE_NO:18
EndFunction
