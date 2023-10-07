ScriptName Fragments:Quests:QF_Hope02_002A0790 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AdellaFaheem Auto Const mandatory
ReferenceAlias Property Alias_Ernesto Auto Const mandatory
Book Property Hope02_FaheemSlate Auto Const mandatory
ReferenceAlias Property Alias_FaheemSlate Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Scene Property Hope02_050_AdellaBark Auto Const mandatory
GlobalVariable Property Hope02_Foreknowledge_KilledErnesto Auto Const mandatory
ActorValue Property Hope02_Foreknowledge_KilledErnestoAV Auto Const mandatory
Scene Property Hope02_SalShout Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_AdellaFaheem.GetRef().Enable(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0050_Item_00()
  Hope02_050_AdellaBark.Start() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:24
  Game.GetPlayer().AddAliasedItem(Hope02_FaheemSlate as Form, Alias_FaheemSlate as Alias, 1, True) ; #DEBUG_LINE_NO:27
  Alias_Ernesto.GetRef().Enable(False) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:41
  Actor aTarg = Alias_Ernesto.GetActorRef() ; #DEBUG_LINE_NO:44
  Actor aPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:45
  aTarg.StartCombat(aPlayer as ObjectReference, False) ; #DEBUG_LINE_NO:47
  aTarg.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:56
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:57
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:58
  Game.GetPlayer().SetValue(Hope02_Foreknowledge_KilledErnestoAV, 1.0) ; #DEBUG_LINE_NO:61
  Hope02_SalShout.Start() ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:72
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:73
  Alias_AdellaFaheem.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:84
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:85
  Alias_Ernesto.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:95
  Alias_AdellaFaheem.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_AdellaFaheem.GetRef().Disable(False) ; #DEBUG_LINE_NO:115
  Alias_Ernesto.GetRef().Disable(False) ; #DEBUG_LINE_NO:116
  Self.Stop() ; #DEBUG_LINE_NO:118
EndFunction
