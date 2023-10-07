ScriptName Fragments:Quests:QF_City_Akila_Jansen_001A8B64 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_Akila_Jansen_MilenaSpace Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_MarkoJensan Auto Const mandatory
ReferenceAlias Property Alias_SimoneJansen Auto Const mandatory
Keyword Property AnimArchetypeFriendly Auto Const mandatory
Keyword Property AnimArchetypeDepressed Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0025_Item_00()
  If !Self.GetStageDone(100) ; #DEBUG_LINE_NO:7
    Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:17
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0200_Item_00()
  City_Akila_Jansen_MilenaSpace.Start() ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:35
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:44
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:53
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:54
  Alias_MarkoJensan.GetActorRef().ChangeAnimArchetype(AnimArchetypeFriendly) ; #DEBUG_LINE_NO:57
  Alias_SimoneJansen.GetActorRef().ChangeAnimArchetype(AnimArchetypeFriendly) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetStage(500) ; #DEBUG_LINE_NO:66
  Game.GetPlayer().RemoveItem(Credits as Form, 1000, False, None) ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetStage(500) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:85
  Self.SetStage(9000) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:95
EndFunction
