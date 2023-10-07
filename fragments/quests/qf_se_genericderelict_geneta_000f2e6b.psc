ScriptName Fragments:Quests:QF_SE_GenericDerelict_Geneta_000F2E6B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SE_GenericDerelict_GeneTagGlobal Auto Const mandatory
MiscObject Property SE_GenericDerelict_Genetag Auto Const mandatory
ReferenceAlias Property Alias_Mourner_UC01 Auto Const mandatory
ReferenceAlias Property Alias_Mourner Auto Const mandatory
ReferenceAlias Property Alias_Mourner_Freestar Auto Const mandatory
ReferenceAlias Property Alias_AkilaSanctumMarker Auto Const mandatory
ReferenceAlias Property Alias_NewAtlantisHoEMarker Auto Const mandatory
ReferenceAlias Property Alias_CydoniaMarker Auto Const mandatory
ReferenceAlias Property Alias_NewAtlantisSanctumMarker Auto Const mandatory
ReferenceAlias Property Alias_IDCard Auto Const mandatory
MiscObject Property SE_GenericDerelict_IDCard01 Auto Const mandatory
MiscObject Property SE_GenericDerelict_IDCard02 Auto Const mandatory
MiscObject Property SE_GenericDerelict_IDCard03 Auto Const mandatory
MiscObject Property SE_GenericDerelict_IDCard04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference MournerRef = Alias_Mourner_UC01.GetRef() ; #DEBUG_LINE_NO:7
  ObjectReference SandboxRef = Alias_NewAtlantisSanctumMarker.GetRef() ; #DEBUG_LINE_NO:8
  Alias_Mourner.ForceRefTo(MournerRef) ; #DEBUG_LINE_NO:10
  MournerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:11
  MournerRef.SetLinkedRef(SandboxRef, None, True) ; #DEBUG_LINE_NO:12
  MournerRef.MoveTo(SandboxRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:13
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_IDCard01 as Form, Alias_IDCard as Alias, 1, True) ; #DEBUG_LINE_NO:14
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0002_Item_00()
  ObjectReference MournerRef = Alias_Mourner_UC01.GetRef() ; #DEBUG_LINE_NO:23
  ObjectReference SandboxRef = Alias_NewAtlantisHoEMarker.GetRef() ; #DEBUG_LINE_NO:24
  Alias_Mourner.ForceRefTo(MournerRef) ; #DEBUG_LINE_NO:26
  MournerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:27
  MournerRef.SetLinkedRef(SandboxRef, None, True) ; #DEBUG_LINE_NO:28
  MournerRef.MoveTo(SandboxRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:29
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_IDCard02 as Form, Alias_IDCard as Alias, 1, True) ; #DEBUG_LINE_NO:31
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0003_Item_00()
  ObjectReference MournerRef = Alias_Mourner_Freestar.GetRef() ; #DEBUG_LINE_NO:40
  ObjectReference SandboxRef = Alias_CydoniaMarker.GetRef() ; #DEBUG_LINE_NO:41
  Alias_Mourner.ForceRefTo(MournerRef) ; #DEBUG_LINE_NO:43
  MournerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:44
  MournerRef.SetLinkedRef(SandboxRef, None, True) ; #DEBUG_LINE_NO:45
  MournerRef.MoveTo(SandboxRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:46
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_IDCard03 as Form, Alias_IDCard as Alias, 1, True) ; #DEBUG_LINE_NO:48
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0004_Item_00()
  ObjectReference MournerRef = Alias_Mourner_Freestar.GetRef() ; #DEBUG_LINE_NO:57
  ObjectReference SandboxRef = Alias_AkilaSanctumMarker.GetRef() ; #DEBUG_LINE_NO:58
  Alias_Mourner.ForceRefTo(MournerRef) ; #DEBUG_LINE_NO:60
  MournerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:61
  MournerRef.SetLinkedRef(SandboxRef, None, True) ; #DEBUG_LINE_NO:62
  MournerRef.MoveTo(SandboxRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:63
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_IDCard04 as Form, Alias_IDCard as Alias, 1, True) ; #DEBUG_LINE_NO:65
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0010_Item_00()
  SE_GenericDerelict_GeneTagGlobal.SetValue(100.0) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0020_Item_00()
  SE_GenericDerelict_GeneTagGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:82
  Game.GetPlayer().RemoveItem(Alias_IDCard.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:83
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:84
  Self.SetStage(30) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:93
  Self.SetStage(30) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Mourner.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:102
  SE_GenericDerelict_GeneTagGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:103
  Self.Stop() ; #DEBUG_LINE_NO:104
EndFunction
