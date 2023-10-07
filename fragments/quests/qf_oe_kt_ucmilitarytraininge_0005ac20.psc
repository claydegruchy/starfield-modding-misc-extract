ScriptName Fragments:Quests:QF_OE_KT_UCMilitaryTrainingE_0005AC20 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property OE_KT_UCTrainingExercise_MoveTo Auto Const mandatory
Scene Property OE_KT_UCTrainingExercise_Scene01 Auto Const mandatory
RefCollectionAlias Property Alias_ModelA_Group Auto Const mandatory
RefCollectionAlias Property Alias_ModelS_Grouip Auto Const mandatory
Faction Property UnitedColoniesMarineFaction Auto Const mandatory
Scene Property OE_KT_UCTrainingExercise_Scene02 Auto Const mandatory
ReferenceAlias Property Alias_NPC00 Auto Const mandatory
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
ReferenceAlias Property Alias_NPC02 Auto Const mandatory
Faction Property OE_GroupEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_NPC04 Auto Const mandatory
ReferenceAlias Property Alias_NPC03 Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group01 Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group02 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Perk Property OE_KT_ModDamageResistancePerk Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  OE_KT_UCTrainingExercise_Scene02.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  OE_KT_UCTrainingExercise_MoveTo.Stop() ; #DEBUG_LINE_NO:15
  OE_KT_UCTrainingExercise_Scene01.Start() ; #DEBUG_LINE_NO:16
  Actor[] ModelA = Alias_ModelA_Group.GetActorArray() ; #DEBUG_LINE_NO:18
  Actor[] ModelS = Alias_ModelS_Grouip.GetActorArray() ; #DEBUG_LINE_NO:19
  ObjectReference[] NPCs = Alias_NPC_Group00.GetArray() ; #DEBUG_LINE_NO:20
  Int I = 0 ; #DEBUG_LINE_NO:22
  While I < ModelA.Length ; #DEBUG_LINE_NO:24
    Alias_NPC_Group02.AddRef(ModelA[I] as ObjectReference) ; #DEBUG_LINE_NO:25
    ModelA[I].AddPerk(OE_KT_ModDamageResistancePerk, False) ; #DEBUG_LINE_NO:26
    I += 1 ; #DEBUG_LINE_NO:27
  EndWhile ; #DEBUG_LINE_NO:
  Int k = 0 ; #DEBUG_LINE_NO:30
  While k < ModelS.Length ; #DEBUG_LINE_NO:32
    Alias_NPC_Group02.AddRef(ModelS[k] as ObjectReference) ; #DEBUG_LINE_NO:33
    ModelS[k].AddPerk(OE_KT_ModDamageResistancePerk, False) ; #DEBUG_LINE_NO:34
    k += 1 ; #DEBUG_LINE_NO:35
  EndWhile ; #DEBUG_LINE_NO:
  Int j = 0 ; #DEBUG_LINE_NO:38
  While j < NPCs.Length ; #DEBUG_LINE_NO:40
    Alias_NPC_Group02.AddRef(NPCs[j]) ; #DEBUG_LINE_NO:41
    j += 1 ; #DEBUG_LINE_NO:42
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_ModelA_Group.RemoveFromFaction(UnitedColoniesMarineFaction) ; #DEBUG_LINE_NO:51
  Alias_ModelA_Group.RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:52
  Alias_ModelS_Grouip.RemoveFromFaction(UnitedColoniesMarineFaction) ; #DEBUG_LINE_NO:54
  Alias_ModelS_Grouip.RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:55
  Alias_ModelA_Group.AddtoFaction(OE_GroupEnemyFaction) ; #DEBUG_LINE_NO:57
  Alias_ModelS_Grouip.AddtoFaction(OE_GroupEnemyFaction) ; #DEBUG_LINE_NO:58
  Alias_ModelA_Group.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:60
  Alias_ModelS_Grouip.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:61
  Alias_ModelA_Group.StartCombatAll(Alias_NPC02.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:62
  Alias_ModelS_Grouip.StartCombatAll(Alias_NPC01.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:63
  Alias_NPC_Group00.EvaluateAll() ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetStage(80) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0064_Item_00()
  Self.SetStage(66) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0065_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:89
  Alias_ModelA_Group.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:91
  Alias_ModelS_Grouip.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_0066_Item_00()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:100
  If !Self.GetStageDone(80) ; #DEBUG_LINE_NO:102
    Alias_NPC_Group02.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:103
    Alias_NPC_Group02.RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:104
    Alias_NPC_Group02.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:105
    Alias_NPC_Group02.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:106
  Else ; #DEBUG_LINE_NO:
    Alias_NPC_Group00.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:108
    Alias_NPC_Group00.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:109
    Alias_NPC_Group00.RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:110
    Alias_NPC_Group00.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:111
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetStage(80) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0080_Item_00()
  OE_KT_UCTrainingExercise_Scene02.Start() ; #DEBUG_LINE_NO:128
  ObjectReference[] Marines = Alias_NPC_Group00.GetArray() ; #DEBUG_LINE_NO:130
  Int I = 0 ; #DEBUG_LINE_NO:132
  While I < Marines.Length ; #DEBUG_LINE_NO:134
    (Marines[I] as Actor).RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:135
    (Marines[I] as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:136
    Alias_NPC_Group02.AddRef(Marines[I]) ; #DEBUG_LINE_NO:137
    I += 1 ; #DEBUG_LINE_NO:138
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0090_Item_00()
  OE_KT_UCTrainingExercise_Scene02.Stop() ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0100_Item_00()
  OE_KT_UCTrainingExercise_MoveTo.Start() ; #DEBUG_LINE_NO:155
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:163
EndFunction
