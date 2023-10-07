ScriptName Fragments:Quests:QF_OE_AustinF_DeployMicrobe_0001575C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_VanguardNPC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_VanguardNPC.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_VanguardNPC.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:23
  Self.Stop() ; #DEBUG_LINE_NO:24
EndFunction
