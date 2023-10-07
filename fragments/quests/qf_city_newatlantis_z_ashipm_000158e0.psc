ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_AShipm_000158E0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Package Auto Const mandatory
ReferenceAlias Property Alias_SalinasDoor Auto Const mandatory
ReferenceAlias Property Alias_Salinas Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:7
  Alias_Package.GetRef().Enable(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:16
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Package.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Salinas.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:36
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:38
  Self.Stop() ; #DEBUG_LINE_NO:40
EndFunction
