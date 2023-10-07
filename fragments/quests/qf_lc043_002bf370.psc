ScriptName Fragments:Quests:QF_LC043_002BF370 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_SY01_ActorsAll Auto Const mandatory
RefCollectionAlias Property Alias_SY02_ActorsAll Auto Const mandatory
RefCollectionAlias Property Alias_SY03_ActorsAll Auto Const mandatory
RefCollectionAlias Property Alias_SY02_ActorsInitiallyEnabled Auto Const mandatory
RefCollectionAlias Property Alias_SY03_ActorsInitiallyEnabled Auto Const mandatory
RefCollectionAlias Property Alias_SY_Ships_Quest_All Auto Const
RefCollectionAlias Property Alias_SY_Ships_Prequest_All Auto Const mandatory
RefCollectionAlias Property Alias_SY_Ships_Postquest_All Auto Const mandatory
RefCollectionAlias Property Alias_SY_Ships_Guards Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
RefCollectionAlias Property Alias_SY01_NavmeshPlatformDisableSpecial Auto Const mandatory
ReferenceAlias Property Alias_SY01_CargoBayBarracksGuard Auto Const mandatory
RefCollectionAlias Property Alias_SY02_CommandBayLobbySoliders Auto Const mandatory
ReferenceAlias Property Alias_SY02_Natara Auto Const mandatory
RefCollectionAlias Property Alias_SY02_CommandBayCombatResponders Auto Const mandatory
ReferenceAlias Property Alias_SY02_CommandBaySecurityDoor Auto Const mandatory
Scene Property LC043_50_GuardAttack Auto Const mandatory
Faction Property LC043SYQuestShipFaction Auto Const mandatory
Faction Property LC043SYNonquestShipFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property LC043SY01FriendFaction Auto Const mandatory
Faction Property LC043SY01Faction Auto Const mandatory
Faction Property LC043SY02Faction Auto Const mandatory
Faction Property LC043SY03Faction Auto Const mandatory
Quest Property CF05_Alarm Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Quest Property CF05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0320_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0460_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  LC043_50_GuardAttack.Start() ; #DEBUG_LINE_NO:19
  LC043SYNonquestShipFaction.SetEnemy(PlayerFaction, False, False) ; #DEBUG_LINE_NO:22
  Alias_SY_Ships_Guards.EvaluateAll() ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0051_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0099_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:42
  lc043questscript kmyQuest = __temp as lc043questscript ; #DEBUG_LINE_NO:43
  Alias_SY_Ships_Prequest_All.DisableAll(False) ; #DEBUG_LINE_NO:49
  Alias_SY_Ships_Quest_All.EnableAll(False) ; #DEBUG_LINE_NO:50
  kmyQuest.CleanupPrequestAliases() ; #DEBUG_LINE_NO:53
  kmyQuest.FillInteriorAliases() ; #DEBUG_LINE_NO:54
  Alias_SY01_NavmeshPlatformDisableSpecial.DisableAll(False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0120_Item_00()
  Game.GetPlayer().AddToFaction(LC043SY01FriendFaction) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_SY01_CargoBayBarracksGuard.TryToEnable() ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:96
  lc043questscript kmyQuest = __temp as lc043questscript ; #DEBUG_LINE_NO:97
  Game.GetPlayer().RemoveFromFaction(LC043SY01FriendFaction) ; #DEBUG_LINE_NO:104
  Self.SetStage(130) ; #DEBUG_LINE_NO:107
  kmyQuest.TriggerSecurityAlarm(Alias_SY01_ActorsAll, LC043SY01Faction) ; #DEBUG_LINE_NO:110
  CF05_Alarm.SetStage(60) ; #DEBUG_LINE_NO:113
  CF05.SetStage(61) ; #DEBUG_LINE_NO:114
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_SY02_ActorsInitiallyEnabled.EnableAll(False) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0220_Item_00()
  If !Self.GetStageDone(250) ; #DEBUG_LINE_NO:137
    Alias_SY02_CommandBayLobbySoliders.DisableAll(False) ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0250_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:147
  lc043questscript kmyQuest = __temp as lc043questscript ; #DEBUG_LINE_NO:148
  kmyQuest.TriggerSecurityAlarm(Alias_SY02_ActorsAll, LC043SY02Faction) ; #DEBUG_LINE_NO:155
  CF05_Alarm.SetStage(60) ; #DEBUG_LINE_NO:158
  CF05.SetStage(62) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0270_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:167
  lc043questscript kmyQuest = __temp as lc043questscript ; #DEBUG_LINE_NO:168
  If Self.GetStageDone(250) ; #DEBUG_LINE_NO:176
    Alias_SY02_CommandBaySecurityDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:177
    Alias_SY02_CommandBayCombatResponders.EnableAll(False) ; #DEBUG_LINE_NO:178
    Alias_SY02_CommandBayCombatResponders.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:179
    Alias_SY02_CommandBayCombatResponders.EvaluateAll() ; #DEBUG_LINE_NO:180
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:181
    Alias_SY02_CommandBayCombatResponders.EvaluateAll() ; #DEBUG_LINE_NO:182
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:183
    Alias_SY02_CommandBayCombatResponders.EvaluateAll() ; #DEBUG_LINE_NO:184
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_SY03_ActorsInitiallyEnabled.EnableAll(False) ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0350_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:212
  lc043questscript kmyQuest = __temp as lc043questscript ; #DEBUG_LINE_NO:213
  kmyQuest.TriggerSecurityAlarm(Alias_SY03_ActorsAll, LC043SY03Faction) ; #DEBUG_LINE_NO:220
  CF05_Alarm.SetStage(60) ; #DEBUG_LINE_NO:223
  CF05.SetStage(63) ; #DEBUG_LINE_NO:224
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:232
  lc043questscript kmyQuest = __temp as lc043questscript ; #DEBUG_LINE_NO:233
  kmyQuest.BlockSpaceTravelForEscape(True) ; #DEBUG_LINE_NO:241
  LC043SYQuestShipFaction.SetEnemy(PlayerFaction, False, False) ; #DEBUG_LINE_NO:244
  Alias_SY_Ships_Quest_All.EvaluateAll() ; #DEBUG_LINE_NO:245
EndFunction

Function Fragment_Stage_0451_Item_00()
  Self.SetStage(450) ; #DEBUG_LINE_NO:256
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:273
  lc043questscript kmyQuest = __temp as lc043questscript ; #DEBUG_LINE_NO:274
  kmyQuest.BlockSpaceTravelForEscape(False) ; #DEBUG_LINE_NO:281
  Alias_SY_Ships_Prequest_All.DisableAll(False) ; #DEBUG_LINE_NO:284
  Alias_SY_Ships_Quest_All.DisableAll(False) ; #DEBUG_LINE_NO:285
  Alias_SY_Ships_Postquest_All.EnableAll(False) ; #DEBUG_LINE_NO:286
  kmyQuest.CleanupQuestAliases() ; #DEBUG_LINE_NO:289
EndFunction
