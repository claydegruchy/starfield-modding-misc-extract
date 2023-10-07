ScriptName Fragments:Quests:QF_OE_KT_AutomatedFacility_0006A35B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property OE_KT_AutomatedFacility_Scene01 Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
ReferenceAlias Property Alias_NPC00 Auto Const mandatory
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
ReferenceAlias Property Alias_NPC02 Auto Const mandatory
ReferenceAlias Property Alias_NPC03 Auto Const mandatory
ReferenceAlias Property Alias_NPC04 Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Scene Property OE_KT_AutomatedFacility_Scene02 Auto Const mandatory
ReferenceAlias Property Alias_Terminal Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
RefCollectionAlias Property Alias_Markers_Corpses Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0030_Item_00()
  Alias_NPC_Group00.KillAll(None) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_NPC_Group00.RemovefromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:15
  Alias_NPC_Group00.AddtoFaction(REPlayerFriend) ; #DEBUG_LINE_NO:16
  Alias_NPC_Group00.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:17
  Alias_NPC_Group00.StopCombat() ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_NPC_Group00.RemovefromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:26
  Alias_NPC_Group00.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:27
  Alias_NPC_Group00.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:28
  Alias_NPC_Group00.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0055_Item_01()
  Self.SetStage(50) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0060_Item_00()
  OE_KT_AutomatedFacility_Scene01.Stop() ; #DEBUG_LINE_NO:45
  OE_KT_AutomatedFacility_Scene02.Start() ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0090_Item_00()
  OE_KT_AutomatedFacility_Scene01.Start() ; #DEBUG_LINE_NO:54
  Alias_NPC_Group00.AddRef(Alias_NPC00.GetRef()) ; #DEBUG_LINE_NO:56
  Alias_NPC_Group00.AddRef(Alias_NPC01.GetRef()) ; #DEBUG_LINE_NO:57
  Alias_NPC_Group00.AddRef(Alias_NPC02.GetRef()) ; #DEBUG_LINE_NO:58
  Alias_NPC_Group00.AddRef(Alias_NPC03.GetRef()) ; #DEBUG_LINE_NO:59
  Alias_NPC_Group00.AddRef(Alias_NPC04.GetRef()) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Terminal.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:76
EndFunction
