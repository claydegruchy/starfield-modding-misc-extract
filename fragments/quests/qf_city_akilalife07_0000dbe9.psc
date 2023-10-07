ScriptName Fragments:Quests:QF_City_AkilaLife07_0000DBE9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property AkilaLife06_DocPending Auto Const mandatory
ReferenceAlias Property Alias_Book01 Auto Const mandatory
ReferenceAlias Property Alias_Book02 Auto Const mandatory
ReferenceAlias Property Alias_Book03 Auto Const mandatory
ReferenceAlias Property Alias_Book04 Auto Const mandatory
ReferenceAlias Property Alias_Book05 Auto Const mandatory
ReferenceAlias Property Alias_Book06 Auto Const mandatory
Book Property Book01 Auto Const
Book Property Book02 Auto Const
Book Property Book03 Auto Const
Book Property Book04 Auto Const
Book Property Book05 Auto Const
Book Property Book06 Auto Const
Scene Property City_AkilaLife07_500_RhysBark Auto Const mandatory
ReferenceAlias Property Alias_PlacedBook01 Auto Const mandatory
ReferenceAlias Property Alias_PlacedBook02 Auto Const mandatory
ReferenceAlias Property Alias_PlacedBook03 Auto Const mandatory
ReferenceAlias Property Alias_PlacedBook04 Auto Const mandatory
ReferenceAlias Property Alias_PlacedBook05 Auto Const mandatory
ReferenceAlias Property Alias_PlacedBook06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script ; #DEBUG_LINE_NO:8
  If Game.GetPlayer().GetItemCount(Book01 as Form) > 0 ; #DEBUG_LINE_NO:12
    kmyQuest.GotObject(200) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().GetItemCount(Book02 as Form) > 0 ; #DEBUG_LINE_NO:17
    kmyQuest.GotObject(300) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().GetItemCount(Book03 as Form) > 0 ; #DEBUG_LINE_NO:21
    kmyQuest.GotObject(400) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().GetItemCount(Book04 as Form) > 0 ; #DEBUG_LINE_NO:25
    kmyQuest.GotObject(500) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().GetItemCount(Book05 as Form) > 0 ; #DEBUG_LINE_NO:29
    kmyQuest.GotObject(600) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().GetItemCount(Book06 as Form) > 0 ; #DEBUG_LINE_NO:33
    kmyQuest.GotObject(700) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(200) ; #DEBUG_LINE_NO:44
    Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(300) ; #DEBUG_LINE_NO:47
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(400) ; #DEBUG_LINE_NO:50
    Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:53
    Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:54
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(600) ; #DEBUG_LINE_NO:56
    Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(700) ; #DEBUG_LINE_NO:59
    Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:69
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script ; #DEBUG_LINE_NO:70
  kmyQuest.GotObject(200) ; #DEBUG_LINE_NO:73
  Book bBook = Book01 ; #DEBUG_LINE_NO:76
  ObjectReference oPlayer = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:77
  oPlayer.RemoveItem(bBook as Form, 1, True, None) ; #DEBUG_LINE_NO:78
  oPlayer.AddAliasedItem(bBook as Form, Alias_Book01 as Alias, 1, True) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:87
  Game.GetPlayer().RemoveItem(Book01 as Form, 1, False, None) ; #DEBUG_LINE_NO:90
  Self.SetStage(150) ; #DEBUG_LINE_NO:93
  Alias_PlacedBook01.GetRef().Enable(False) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:104
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script ; #DEBUG_LINE_NO:105
  kmyQuest.GotObject(300) ; #DEBUG_LINE_NO:108
  Book bBook = Book02 ; #DEBUG_LINE_NO:111
  ObjectReference oPlayer = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:112
  oPlayer.RemoveItem(bBook as Form, 1, True, None) ; #DEBUG_LINE_NO:113
  oPlayer.AddAliasedItem(bBook as Form, Alias_Book02 as Alias, 1, True) ; #DEBUG_LINE_NO:114
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:122
  Game.GetPlayer().RemoveItem(Book02 as Form, 1, False, None) ; #DEBUG_LINE_NO:125
  Self.SetStage(150) ; #DEBUG_LINE_NO:128
  Alias_PlacedBook02.GetRef().Enable(False) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:139
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script ; #DEBUG_LINE_NO:140
  kmyQuest.GotObject(400) ; #DEBUG_LINE_NO:143
  Book bBook = Book03 ; #DEBUG_LINE_NO:146
  ObjectReference oPlayer = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:147
  oPlayer.RemoveItem(bBook as Form, 1, True, None) ; #DEBUG_LINE_NO:148
  oPlayer.AddAliasedItem(bBook as Form, Alias_Book03 as Alias, 1, True) ; #DEBUG_LINE_NO:149
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:157
  Game.GetPlayer().RemoveItem(Book03 as Form, 1, False, None) ; #DEBUG_LINE_NO:160
  Self.SetStage(150) ; #DEBUG_LINE_NO:163
  Alias_PlacedBook03.GetRef().Enable(False) ; #DEBUG_LINE_NO:166
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:174
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script ; #DEBUG_LINE_NO:175
  kmyQuest.GotObject(500) ; #DEBUG_LINE_NO:178
  Book bBook = Book04 ; #DEBUG_LINE_NO:181
  ObjectReference oPlayer = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:182
  oPlayer.RemoveItem(bBook as Form, 1, True, None) ; #DEBUG_LINE_NO:183
  oPlayer.AddAliasedItem(bBook as Form, Alias_Book04 as Alias, 1, True) ; #DEBUG_LINE_NO:184
  City_AkilaLife07_500_RhysBark.Start() ; #DEBUG_LINE_NO:187
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:195
  Game.GetPlayer().RemoveItem(Book04 as Form, 1, False, None) ; #DEBUG_LINE_NO:198
  Self.SetStage(150) ; #DEBUG_LINE_NO:201
  Alias_PlacedBook04.GetRef().Enable(False) ; #DEBUG_LINE_NO:204
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:212
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script ; #DEBUG_LINE_NO:213
  kmyQuest.GotObject(600) ; #DEBUG_LINE_NO:216
  Book bBook = Book05 ; #DEBUG_LINE_NO:219
  ObjectReference oPlayer = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:220
  oPlayer.RemoveItem(bBook as Form, 1, True, None) ; #DEBUG_LINE_NO:221
  oPlayer.AddAliasedItem(bBook as Form, Alias_Book05 as Alias, 1, True) ; #DEBUG_LINE_NO:222
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:230
  Game.GetPlayer().RemoveItem(Book05 as Form, 1, False, None) ; #DEBUG_LINE_NO:233
  Self.SetStage(150) ; #DEBUG_LINE_NO:236
  Alias_PlacedBook05.GetRef().Enable(False) ; #DEBUG_LINE_NO:239
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:247
  city_akilalife07_script kmyQuest = __temp as city_akilalife07_script ; #DEBUG_LINE_NO:248
  kmyQuest.GotObject(700) ; #DEBUG_LINE_NO:251
  Book bBook = Book06 ; #DEBUG_LINE_NO:254
  ObjectReference oPlayer = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:255
  oPlayer.RemoveItem(bBook as Form, 1, True, None) ; #DEBUG_LINE_NO:256
  oPlayer.AddAliasedItem(bBook as Form, Alias_Book06 as Alias, 1, True) ; #DEBUG_LINE_NO:257
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:265
  Game.GetPlayer().RemoveItem(Book06 as Form, 1, False, None) ; #DEBUG_LINE_NO:268
  Self.SetStage(150) ; #DEBUG_LINE_NO:271
  Alias_PlacedBook06.GetRef().Enable(False) ; #DEBUG_LINE_NO:274
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetStage(9000) ; #DEBUG_LINE_NO:282
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:290
EndFunction
