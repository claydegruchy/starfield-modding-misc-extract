ScriptName Fragments:Quests:QF_OE_CECSuperfan_Script Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property PlayerEnemyFaction Auto Const
ReferenceAlias Property Alias_Superfan Auto Const mandatory
Scene Property Scene_PlayerWins Auto Const mandatory
ReferenceAlias Property Alias_Furniture_Wounded Auto Const mandatory
Scene Property Scene_PlayerLoses Auto Const mandatory
ReferenceAlias Property Alias_ShipA_InteriorMarker Auto Const mandatory
ReferenceAlias Property Alias_Furniture_Wounded_Interior Auto Const mandatory
GlobalVariable Property gLockLevel Auto Const mandatory
Scene Property Scene_Cheater Auto Const mandatory
Faction Property OE_AustinF_CECSuperfan_EnemyFaction Auto Const
GlobalVariable Property OE_AustinF_CECSuperfanDone Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  ObjectReference InteriorMarker = Alias_ShipA_InteriorMarker.GetRef() ; #DEBUG_LINE_NO:7
  ObjectReference WoundedFurniture = Alias_Furniture_Wounded_Interior.GetRef() ; #DEBUG_LINE_NO:8
  WoundedFurniture.MoveTo(InteriorMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  Alias_Superfan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0100_Item_00()
  OE_AustinF_CECSuperfanDone.SetValueInt(1) ; #DEBUG_LINE_NO:23
  ObjectReference FurnitureREF = Alias_Furniture_Wounded_Interior.GetRef() ; #DEBUG_LINE_NO:25
  ObjectReference InteriorMarker = Alias_ShipA_InteriorMarker.GetRef() ; #DEBUG_LINE_NO:26
  If Self.GetStageDone(50) ; #DEBUG_LINE_NO:28
    Alias_Superfan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:29
    If FurnitureREF != None && InteriorMarker != None ; #DEBUG_LINE_NO:32
      FurnitureREF.MoveTo(InteriorMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_Superfan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0140_Item_00()
  Alias_Superfan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0180_Item_00()
  Alias_Superfan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:75
  If Self.GetStageDone(200) ; #DEBUG_LINE_NO:77
    Self.SetStage(400) ; #DEBUG_LINE_NO:78
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Superfan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:89
  Alias_Superfan.GetActorRef().AddToFaction(OE_AustinF_CECSuperfan_EnemyFaction) ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor Superfan = Alias_Superfan.GetActorRef() ; #DEBUG_LINE_NO:98
  ObjectReference Marker = Alias_Furniture_Wounded.GetRef() ; #DEBUG_LINE_NO:99
  Superfan.SetValue(Game.GetAggressionAV(), 0.0) ; #DEBUG_LINE_NO:101
  Superfan.StopCombat() ; #DEBUG_LINE_NO:102
  Marker.MoveTo(Superfan as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:103
  Marker.Enable(False) ; #DEBUG_LINE_NO:104
  Superfan.EvaluatePackage(False) ; #DEBUG_LINE_NO:105
  Superfan.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:107
  Scene_PlayerWins.Start() ; #DEBUG_LINE_NO:108
  If Superfan.IsInCombat() ; #DEBUG_LINE_NO:111
    Superfan.StopCombat() ; #DEBUG_LINE_NO:112
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0310_Item_00()
  Actor Superfan = Alias_Superfan.GetActorRef() ; #DEBUG_LINE_NO:121
  ObjectReference Marker = Alias_Furniture_Wounded.GetRef() ; #DEBUG_LINE_NO:122
  Superfan.SetValue(Game.GetAggressionAV(), 0.0) ; #DEBUG_LINE_NO:125
  If Superfan.IsInCombat() ; #DEBUG_LINE_NO:126
    Superfan.StopCombat() ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(110) || Self.GetStageDone(170) ; #DEBUG_LINE_NO:131
    Self.SetStage(999) ; #DEBUG_LINE_NO:132
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(500) ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  Actor Superfan = Alias_Superfan.GetActorRef() ; #DEBUG_LINE_NO:143
  Scene_PlayerLoses.Start() ; #DEBUG_LINE_NO:145
  Superfan.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:146
  Superfan.SetValue(Game.GetAggressionAV(), 0.0) ; #DEBUG_LINE_NO:147
  Superfan.EvaluatePackage(False) ; #DEBUG_LINE_NO:148
  Superfan.StopCombat() ; #DEBUG_LINE_NO:149
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:151
  If Superfan.IsInCombat() ; #DEBUG_LINE_NO:153
    Superfan.StopCombat() ; #DEBUG_LINE_NO:154
    Superfan.EvaluatePackage(False) ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(999) ; #DEBUG_LINE_NO:167
EndFunction

Function Fragment_Stage_0999_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:175
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:176
  Actor Superfan = Alias_Superfan.GetActorRef() ; #DEBUG_LINE_NO:179
  GlobalVariable newLockLevel = None ; #DEBUG_LINE_NO:180
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:183
    kmyQuest.ToggleShipDoors(newLockLevel, None, False, True) ; #DEBUG_LINE_NO:185
  Else ; #DEBUG_LINE_NO:
    kmyQuest.ToggleShipDoors(gLockLevel, None, False, True) ; #DEBUG_LINE_NO:187
  EndIf ; #DEBUG_LINE_NO:
  Superfan.StopCombat() ; #DEBUG_LINE_NO:190
  Superfan.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:191
  Superfan.EvaluatePackage(False) ; #DEBUG_LINE_NO:192
  Superfan.SetValue(Game.GetAggressionAV(), 0.0) ; #DEBUG_LINE_NO:195
  If Superfan.IsInCombat() ; #DEBUG_LINE_NO:196
    Superfan.StopCombat() ; #DEBUG_LINE_NO:197
  EndIf ; #DEBUG_LINE_NO:
EndFunction
