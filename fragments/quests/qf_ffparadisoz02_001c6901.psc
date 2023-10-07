ScriptName Fragments:Quests:QF_FFparadisoZ02_001C6901 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property FFParadisoZ02_RoomKey Auto Const mandatory
MiscObject Property FFParadisoZ02_Thermos Auto Const mandatory
MiscObject Property FFParadisoZ02_WeddingRing Auto Const mandatory
MiscObject Property FFParadisoZ02_Slate Auto Const mandatory
Quest Property FFParadisoZ02Misc Auto Const mandatory
ReferenceAlias Property Alias_RoomKey Auto Const mandatory
ReferenceAlias Property Alias_Thermos Auto Const mandatory
ReferenceAlias Property Alias_WeddingRing Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory
ActorValue Property FFParadisoZ02_Foreknowledge_AV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_RoomKey.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().MoveTo(Alias_Thermos.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(Alias_WeddingRing.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().MoveTo(Alias_Slate.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0100_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:39
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:41
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:42
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:43
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:44
  If myPlayer.GetItemCount(FFParadisoZ02_RoomKey as Form) >= 1 ; #DEBUG_LINE_NO:46
    Self.SetStage(200) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
  If myPlayer.GetItemCount(FFParadisoZ02_Thermos as Form) >= 1 ; #DEBUG_LINE_NO:49
    Self.SetStage(300) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
  If myPlayer.GetItemCount(FFParadisoZ02_WeddingRing as Form) >= 1 ; #DEBUG_LINE_NO:52
    Self.SetStage(400) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
  If myPlayer.GetItemCount(FFParadisoZ02_Slate as Form) >= 1 ; #DEBUG_LINE_NO:55
    Self.SetStage(500) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:65
  If Self.GetStageDone(300) && Self.GetStageDone(400) && Self.GetStageDone(500) ; #DEBUG_LINE_NO:66
    Self.SetStage(600) ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:76
  If Self.GetStageDone(200) && Self.GetStageDone(400) && Self.GetStageDone(500) ; #DEBUG_LINE_NO:77
    Self.SetStage(600) ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:87
  If Self.GetStageDone(200) && Self.GetStageDone(300) && Self.GetStageDone(500) ; #DEBUG_LINE_NO:88
    Self.SetStage(600) ; #DEBUG_LINE_NO:89
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:98
  If Self.GetStageDone(200) && Self.GetStageDone(300) && Self.GetStageDone(400) ; #DEBUG_LINE_NO:99
    Self.SetStage(600) ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_10000_Item_00()
  FFParadisoZ02Misc.SetStage(1000) ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:125
  myPlayer.SetValue(FFParadisoZ02_Foreknowledge_AV, 1.0) ; #DEBUG_LINE_NO:127
  myPlayer.RemoveItem(Alias_Slate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:129
  myPlayer.RemoveItem(Alias_RoomKey.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:130
  myPlayer.RemoveItem(Alias_Thermos.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:131
  myPlayer.RemoveItem(Alias_WeddingRing.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:132
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:134
  Self.Stop() ; #DEBUG_LINE_NO:135
EndFunction
