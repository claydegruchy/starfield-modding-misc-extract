ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Reliab_0011378F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property ResearchNotes Auto Const
ReferenceAlias Property AlexiLebedev Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  Self.SetStage(10) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:16
  Self.SetObjectiveDisplayed(10, False, False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0025_Item_00()
  AlexiLebedev.GetActorRef().RemoveItem(ResearchNotes.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:42
  Game.GetPlayer().AddItem(ResearchNotes.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:51
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().RemoveItem(ResearchNotes.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:68
  Self.Stop() ; #DEBUG_LINE_NO:69
EndFunction
