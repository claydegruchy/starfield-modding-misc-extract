ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_GemJea_000C55B0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Guillaume Auto Const mandatory
ReferenceAlias Property Alias_George Auto Const mandatory
ReferenceAlias Property Alias_Gem Auto Const mandatory
ReferenceAlias Property Alias_Plate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  Alias_Guillaume.GetActorRef().RemoveItem(Alias_Plate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:11
  Game.GetPlayer().AddItem(Alias_Plate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:22
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:31
  Self.Stop() ; #DEBUG_LINE_NO:32
EndFunction
