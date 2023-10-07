ScriptName Fragments:Quests:QF_FFNeonZ03_000A935F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Styx Auto Const mandatory
objectmod Property bot_ModelA_Styx_Graffiti_01 Auto Const mandatory
objectmod Property bot_ModelA_Civ_01 Auto Const mandatory
Quest Property FFNeonZ03_SpeechChallengeQuest Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Warlord Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_Credits Auto Const mandatory
ReferenceAlias Property Alias_Disciple Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Scene Property FFNeonZ03_Scene Auto Const mandatory
Quest Property FFNeonGuardPointer_Z03 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  FFNeonZ03_Scene.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:15
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:16
  FFNeonZ03_SpeechChallengeQuest.Start() ; #DEBUG_LINE_NO:17
  Alias_Warlord.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:18
  Actor DiscipleRef = Alias_Disciple.GetActorRef() ; #DEBUG_LINE_NO:19
  DiscipleRef.EnableNoWait(False) ; #DEBUG_LINE_NO:20
  DiscipleRef.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:21
  FFNeonGuardPointer_Z03.SetStage(200) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:32
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:33
  Game.GetPlayer().AddItem(Alias_Credits.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveSkipped(10) ; #DEBUG_LINE_NO:42
  Self.SetObjectiveSkipped(20) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0030_Item_01()
  Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:51
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor WarlordRef = Alias_Warlord.GetActorRef() ; #DEBUG_LINE_NO:60
  Actor DiscipleRef = Alias_Disciple.GetActorRef() ; #DEBUG_LINE_NO:61
  WarlordRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:63
  DiscipleRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:64
  WarlordRef.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:65
  WarlordRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:66
  DiscipleRef.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:67
  DiscipleRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:76
  Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:85
  Game.GetPlayer().RemoveItem(Alias_Credits.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:86
  FFNeonZ03_SpeechChallengeQuest.Stop() ; #DEBUG_LINE_NO:87
  Alias_Warlord.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:88
  Alias_Disciple.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:89
  FFNeonZ03_SpeechChallengeQuest.Stop() ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0200_Item_00()
  ObjectReference StyxRef = Alias_Styx.GetRef() ; #DEBUG_LINE_NO:98
  StyxRef.RemoveMod(bot_ModelA_Styx_Graffiti_01) ; #DEBUG_LINE_NO:100
  StyxRef.AttachMod(bot_ModelA_Civ_01, 0) ; #DEBUG_LINE_NO:101
  DialogueFCNeon.SetStage(200) ; #DEBUG_LINE_NO:102
  Self.Stop() ; #DEBUG_LINE_NO:104
EndFunction
