ScriptName Fragments:Quests:QF_TestKris_AnimationBug_01002D0C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Bug02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Self.SetobjectiveDisplayed(5, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Bug02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Bug02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:23
EndFunction
