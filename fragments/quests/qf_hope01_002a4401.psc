ScriptName Fragments:Quests:QF_Hope01_002A4401 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_MrSood Auto Const mandatory
Message Property TestHope01_200 Auto Const mandatory
ReferenceAlias Property Alias_MrSoodPackage Auto Const mandatory
MiscObject Property Hope01SoodPackage Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Message Property HelpSmuggling Auto Const mandatory
ReferenceAlias Property Alias_Chest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_MrSood.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:16
  Game.GetPlayer().AddAliasedItem(Hope01SoodPackage as Form, Alias_MrSoodPackage as Alias, 1, True) ; #DEBUG_LINE_NO:19
  HelpSmuggling.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().RemoveItem(Alias_MrSoodPackage.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:30
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:31
  Self.Stop() ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:49
  Game.GetPlayer().RemoveItem(Alias_MrSoodPackage.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:52
  Alias_playerShip.GetRef().RemoveItem(Alias_MrSoodPackage.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:53
  Alias_MrSood.GetRef().Disable(False) ; #DEBUG_LINE_NO:56
  Self.SetStage(9000) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_8900_Item_00()
  Alias_Chest.GetRef().AddItem(Alias_MrSoodPackage.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:66
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:68
  Self.SetStage(9000) ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:77
EndFunction
