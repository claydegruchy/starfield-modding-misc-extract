ScriptName Fragments:Quests:QF_FFKeyZ01_001BB164 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_BogStartMarker Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
ReferenceAlias Property Alias_MadeleineRing Auto Const mandatory
Perk Property FactionCrimsonFleetPerk Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ReferenceAlias Property Alias_CFSD01Evidence Auto Const mandatory
ReferenceAlias Property Alias_ClayContainer Auto Const mandatory
ReferenceAlias Property Alias_Clay Auto Const mandatory
ReferenceAlias Property Alias_BossMarker Auto Const mandatory
ReferenceAlias Property Alias_BackupClay Auto Const mandatory
ReferenceAlias Property Alias_ClayLetter Auto Const mandatory
Faction Property SpacerFaction Auto Const mandatory
Faction Property EclipticFaction Auto Const mandatory
Book Property FFKeyZ01_ClayLetter Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:7
  DialogueCFTheKey.SetStage(250) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().MoveTo(Alias_BogStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  Self.SetStage(100) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0001_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:18
  DialogueCFTheKey.SetStage(200) ; #DEBUG_LINE_NO:19
  Self.SetStage(100) ; #DEBUG_LINE_NO:20
  Self.SetStage(200) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0002_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:29
  DialogueCFTheKey.SetStage(200) ; #DEBUG_LINE_NO:30
  Self.SetStage(100) ; #DEBUG_LINE_NO:31
  Self.SetStage(200) ; #DEBUG_LINE_NO:32
  Game.GetPlayer().AddItem(Alias_MadeleineRing.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:33
  Game.GetPlayer().MoveTo(Alias_BogStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0010_Item_00()
  Actor ClayRef = Alias_Clay.GetActorRef() ; #DEBUG_LINE_NO:42
  Actor SpacerClayRef = Alias_BackupClay.GetActorRef() ; #DEBUG_LINE_NO:43
  If Alias_BossMarker.GetActorRef().IsInFaction(SpacerFaction) ; #DEBUG_LINE_NO:45
    SpacerClayRef.AddAliasedItem(FFKeyZ01_ClayLetter as Form, Alias_ClayLetter as Alias, 1, True) ; #DEBUG_LINE_NO:46
    SpacerClayRef.EnableNoWait(False) ; #DEBUG_LINE_NO:47
  Else ; #DEBUG_LINE_NO:
    ClayRef.AddAliasedItem(FFKeyZ01_ClayLetter as Form, Alias_ClayLetter as Alias, 1, True) ; #DEBUG_LINE_NO:49
    ClayRef.EnableNoWait(False) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:59
  Self.Stop() ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:76
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:77
  Alias_ClayContainer.GetRef().AddItem(Alias_CFSD01Evidence.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:86
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0310_Item_00()
  Game.GetPlayer().RemoveItem(Alias_MadeleineRing.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:103
  Self.Stop() ; #DEBUG_LINE_NO:104
EndFunction
