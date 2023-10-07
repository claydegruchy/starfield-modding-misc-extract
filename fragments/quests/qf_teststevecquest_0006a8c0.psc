ScriptName Fragments:Quests:QF_TestSteveCQuest_0006A8C0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Cell Property TestSteveCSpaceCell Auto Const mandatory
RefCollectionAlias Property Alias_TestSpaceCellRefs Auto Const mandatory
RefCollectionAlias Property Alias_TestSpaceCellRefs_Ship01 Auto Const mandatory
ReferenceAlias Property Alias_TestSpaceCellRefs_Ship02 Auto Const mandatory
Scene Property TestIntercomDialogueNoName Auto Const mandatory
ReferenceAlias Property Alias_Blah Auto Const mandatory
ObjectReference Property TestSteveCDoor06 Auto Const mandatory
Actor Property TestHostileActorRef Auto Const mandatory
LocationAlias Property Alias_TestSteveCLocation Auto Const mandatory
LocationAlias Property Alias_TestSteveCLocation02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:8
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0101_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:17
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0200_Item_00()
  TestIntercomDialogueNoName.Start() ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0291_Item_00()
  Utility.Wait(10.0) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0410_Item_00()
  TestSteveCDoor06.SetOpen(True) ; #DEBUG_LINE_NO:51
  TestHostileActorRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:52
  TestHostileActorRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_TestSteveCLocation02.ForceLocationTo(Alias_TestSteveCLocation.GetLocation()) ; #DEBUG_LINE_NO:61
EndFunction
