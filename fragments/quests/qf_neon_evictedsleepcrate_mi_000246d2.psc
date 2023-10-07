ScriptName Fragments:Quests:QF_Neon_EvictedSleepcrate_Mi_000246D2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Door1 Auto Const mandatory
ReferenceAlias Property Alias_Door2 Auto Const mandatory
ReferenceAlias Property Alias_Door3 Auto Const mandatory
ReferenceAlias Property Alias_Door4 Auto Const mandatory
GlobalVariable Property pNeon_EvictedSleepcrate_Global Auto Const mandatory
MiscObject Property Credits Auto Const
Key Property Neon_EvictedSleepcrate_Key01 Auto Const
Key Property Neon_EvictedSleepcrate_Key02 Auto Const
Key Property Neon_EvictedSleepcrate_Key03 Auto Const
Key Property Neon_EvictedSleepcrate_Key04 Auto Const
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().AddItem(Neon_EvictedSleepcrate_Key01 as Form, 1, False) ; #DEBUG_LINE_NO:9
  pNeon_EvictedSleepcrate_Global.Mod(1.0) ; #DEBUG_LINE_NO:10
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:11
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:20
  If Self.GetStageDone(40) == True && Self.GetStageDone(60) == True && Self.GetStageDone(80) == True ; #DEBUG_LINE_NO:24
    Self.SetStage(1000) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().AddItem(Neon_EvictedSleepcrate_Key02 as Form, 1, False) ; #DEBUG_LINE_NO:36
  pNeon_EvictedSleepcrate_Global.Mod(1.0) ; #DEBUG_LINE_NO:37
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:38
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:47
  If Self.GetStageDone(20) == True && Self.GetStageDone(60) == True && Self.GetStageDone(80) == True ; #DEBUG_LINE_NO:49
    Self.SetStage(1000) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  Game.GetPlayer().AddItem(Neon_EvictedSleepcrate_Key03 as Form, 1, False) ; #DEBUG_LINE_NO:61
  pNeon_EvictedSleepcrate_Global.Mod(1.0) ; #DEBUG_LINE_NO:62
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:63
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:72
  If Self.GetStageDone(20) == True && Self.GetStageDone(40) == True && Self.GetStageDone(80) == True ; #DEBUG_LINE_NO:76
    Self.SetStage(1000) ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0070_Item_00()
  Game.GetPlayer().AddItem(Neon_EvictedSleepcrate_Key04 as Form, 1, False) ; #DEBUG_LINE_NO:88
  pNeon_EvictedSleepcrate_Global.Mod(1.0) ; #DEBUG_LINE_NO:89
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:90
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:99
  If Self.GetStageDone(20) == True && Self.GetStageDone(40) == True && Self.GetStageDone(60) == True ; #DEBUG_LINE_NO:103
    Self.SetStage(1000) ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:113
  Self.stop() ; #DEBUG_LINE_NO:114
EndFunction
