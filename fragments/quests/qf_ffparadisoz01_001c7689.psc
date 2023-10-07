ScriptName Fragments:Quests:QF_FFParadisoZ01_001C7689 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFParadisoZ01Misc Auto Const mandatory
Book Property FFParadisoZ01_Claim Auto Const mandatory
ReferenceAlias Property Alias_Claim Auto Const mandatory
ReferenceAlias Property Alias_Akachi Auto Const mandatory
ReferenceAlias Property Alias_Emilian Auto Const mandatory
ReferenceAlias Property Alias_Parts Auto Const mandatory
ActorValue Property FFParadisoZ01_Foreknowledge_AV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_Akachi.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_Emilian.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0100_Item_00()
  If FFParadisoZ01Misc.IsRunning() ; #DEBUG_LINE_NO:24
    FFParadisoZ01Misc.SetStage(1000) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:28
  Game.GetPlayer().AddAliasedItem(FFParadisoZ01_Claim as Form, Alias_Claim as Alias, 1, False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:38
  ffparadisoz01questscript kmyQuest = __temp as ffparadisoz01questscript ; #DEBUG_LINE_NO:39
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:42
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:43
  kmyQuest.StartWaitTimer() ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:53
  ffparadisoz01questscript kmyQuest = __temp as ffparadisoz01questscript ; #DEBUG_LINE_NO:54
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:57
  kmyQuest.ComputerAllowActivate() ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetStage(500) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0460_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:83
  ffparadisoz01questscript kmyQuest = __temp as ffparadisoz01questscript ; #DEBUG_LINE_NO:84
  kmyQuest.ComputerNoActivate() ; #DEBUG_LINE_NO:87
  Self.SetStage(500) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:97
  ffparadisoz01questscript kmyQuest = __temp as ffparadisoz01questscript ; #DEBUG_LINE_NO:98
  kmyQuest.StopWaitTimer() ; #DEBUG_LINE_NO:101
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:102
  If Self.IsObjectiveDisplayed(300) ; #DEBUG_LINE_NO:103
    Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:106
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_0600_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:115
  myPlayer.RemoveItem(Alias_Claim.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:116
  myPlayer.AddItem(Alias_Parts.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:117
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:119
  If Self.IsObjectiveDisplayed(300) ; #DEBUG_LINE_NO:120
    Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:121
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:123
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:124
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:133
  myPlayer.SetValue(FFParadisoZ01_Foreknowledge_AV, 1.0) ; #DEBUG_LINE_NO:134
  myPlayer.RemoveItem(Alias_Parts.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:136
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:138
  Self.Stop() ; #DEBUG_LINE_NO:139
EndFunction
