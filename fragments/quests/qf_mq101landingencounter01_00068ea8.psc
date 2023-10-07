ScriptName Fragments:Quests:QF_MQ101LandingEncounter01_00068EA8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_AllPiratesRefColl Auto Const mandatory
ReferenceAlias Property Alias_Pirate01 Auto Const mandatory
ReferenceAlias Property Alias_Pirate02 Auto Const mandatory
ReferenceAlias Property Alias_Pirate03 Auto Const mandatory
ReferenceAlias Property Alias_Pirate04 Auto Const mandatory
ReferenceAlias Property Alias_Pirate05 Auto Const mandatory
ReferenceAlias Property Alias_Pirate06 Auto Const mandatory
ReferenceAlias Property Alias_Pirate07 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_Pirate01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:8
  Alias_Pirate02.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:9
  Alias_Pirate03.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:10
  Alias_Pirate04.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:11
  Alias_Pirate05.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:12
  Alias_Pirate06.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:13
  Alias_Pirate07.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:14
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:16
  Alias_Pirate01.GetActorRef().StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:18
  Alias_Pirate02.GetActorRef().StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:19
  Alias_Pirate03.GetActorRef().StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:20
  Alias_Pirate04.GetActorRef().StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:21
  Alias_Pirate05.GetActorRef().StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:22
  Alias_Pirate06.GetActorRef().StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:23
  Alias_Pirate07.GetActorRef().StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:24
EndFunction
