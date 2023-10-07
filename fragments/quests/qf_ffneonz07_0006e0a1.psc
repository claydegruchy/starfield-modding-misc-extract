ScriptName Fragments:Quests:QF_FFNeonZ07_0006E0A1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FlyersHandedOut Auto Const
GlobalVariable Property NewillFlyerHandedOut Auto Const
ReferenceAlias Property Alias_Flyer Auto Const mandatory
ReferenceAlias Property Alias_Saburo Auto Const mandatory
ReferenceAlias Property Alias_Flyer01 Auto Const mandatory
ReferenceAlias Property Alias_Flyer02 Auto Const mandatory
ReferenceAlias Property Alias_Flyer03 Auto Const mandatory
ReferenceAlias Property Alias_Flyer04 Auto Const mandatory
ReferenceAlias Property Alias_Flyer05 Auto Const mandatory
ReferenceAlias Property Alias_Flyer06 Auto Const mandatory
ReferenceAlias Property Alias_Flyer07 Auto Const mandatory
ReferenceAlias Property Alias_Flyer08 Auto Const mandatory
ReferenceAlias Property Alias_Flyer09 Auto Const mandatory
Quest Property NeonDialogueQuest Auto Const
GlobalVariable Property TLTimer Auto Const
GlobalVariable Property DaysPassed Auto Const
GlobalVariable Property TLTimer2 Auto Const
GlobalVariable Property KosmoLeeFlyerHandedOut Auto Const
Quest Property FFNeonGuardPointer_Z07 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().AddItem(Alias_Flyer.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:11
  Game.GetPlayer().AddItem(Alias_Flyer01.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:12
  Game.GetPlayer().AddItem(Alias_Flyer02.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:13
  Game.GetPlayer().AddItem(Alias_Flyer03.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:14
  Game.GetPlayer().AddItem(Alias_Flyer04.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:15
  FFNeonGuardPointer_Z07.SetStage(200) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0020_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool ; #DEBUG_LINE_NO:27
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:29
  If FlyersHandedOut.GetValue() == 5.0 ; #DEBUG_LINE_NO:31
    Self.SetStage(120) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0030_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool ; #DEBUG_LINE_NO:41
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:43
  NewillFlyerHandedOut.Mod(1.0) ; #DEBUG_LINE_NO:44
  If FlyersHandedOut.GetValue() == 5.0 ; #DEBUG_LINE_NO:47
    Self.SetStage(120) ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool ; #DEBUG_LINE_NO:57
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:59
  If FlyersHandedOut.GetValue() == 5.0 ; #DEBUG_LINE_NO:61
    Self.SetStage(120) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool ; #DEBUG_LINE_NO:71
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:73
  If FlyersHandedOut.GetValue() == 5.0 ; #DEBUG_LINE_NO:75
    Self.SetStage(120) ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0060_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool ; #DEBUG_LINE_NO:85
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:87
  If FlyersHandedOut.GetValue() == 5.0 ; #DEBUG_LINE_NO:89
    Self.SetStage(120) ; #DEBUG_LINE_NO:90
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0070_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool ; #DEBUG_LINE_NO:99
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:101
  KosmoLeeFlyerHandedOut.Mod(1.0) ; #DEBUG_LINE_NO:102
  If FlyersHandedOut.GetValue() == 5.0 ; #DEBUG_LINE_NO:104
    Self.SetStage(120) ; #DEBUG_LINE_NO:105
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0080_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool ; #DEBUG_LINE_NO:114
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:116
  If FlyersHandedOut.GetValue() == 5.0 ; #DEBUG_LINE_NO:118
    Self.SetStage(120) ; #DEBUG_LINE_NO:119
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0090_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool ; #DEBUG_LINE_NO:128
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:130
  If FlyersHandedOut.GetValue() == 5.0 ; #DEBUG_LINE_NO:132
    Self.SetStage(120) ; #DEBUG_LINE_NO:133
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool ; #DEBUG_LINE_NO:142
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:144
  If FlyersHandedOut.GetValue() == 5.0 ; #DEBUG_LINE_NO:146
    Self.SetStage(120) ; #DEBUG_LINE_NO:147
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  (((Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) as Bool || Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) as Bool) || Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) as Bool ; #DEBUG_LINE_NO:156
  Self.ModObjectiveGlobal(1.0, FlyersHandedOut, -1, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:158
  If FlyersHandedOut.GetValue() == 5.0 ; #DEBUG_LINE_NO:160
    Self.SetStage(120) ; #DEBUG_LINE_NO:161
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:170
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_1000_Item_00()
  NeonDialogueQuest.SetStage(460) ; #DEBUG_LINE_NO:179
  TLTimer.SetValue(DaysPassed.GetValue() + 2.0) ; #DEBUG_LINE_NO:182
  TLTimer2.SetValue(DaysPassed.GetValue() + 4.0) ; #DEBUG_LINE_NO:183
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:185
  Game.GetPlayer().RemoveItem(Alias_Flyer.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:188
  Game.GetPlayer().RemoveItem(Alias_Flyer01.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:189
  Game.GetPlayer().RemoveItem(Alias_Flyer02.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:190
  Game.GetPlayer().RemoveItem(Alias_Flyer03.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:191
  Game.GetPlayer().RemoveItem(Alias_Flyer04.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:192
  Game.GetPlayer().RemoveItem(Alias_Flyer05.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:193
  Game.GetPlayer().RemoveItem(Alias_Flyer06.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:194
  Game.GetPlayer().RemoveItem(Alias_Flyer07.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:195
  Game.GetPlayer().RemoveItem(Alias_Flyer08.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:196
  Game.GetPlayer().RemoveItem(Alias_Flyer09.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:197
  Self.Stop() ; #DEBUG_LINE_NO:199
EndFunction
