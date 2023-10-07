ScriptName Fragments:Quests:QF_FFKeyZ02_001B6246 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_MedicalSupplies_Container Auto Const mandatory
ReferenceAlias Property Alias_SupplyStorageKey Auto Const mandatory
MiscObject Property FFKeyZ02_MedicalSupplies Auto Const mandatory
ReferenceAlias Property Alias_SaminaStartMarker Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
ReferenceAlias Property Alias_GennadyStartMarker Auto Const mandatory
ReferenceAlias Property Alias_SuppliesStartMarker Auto Const mandatory
Perk Property FactionCrimsonFleetPerk Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ReferenceAlias Property Alias_CFSD01Evidence Auto Const mandatory
ReferenceAlias Property Alias_TheClinicMapMarker Auto Const mandatory
ActorBase Property Gennady Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().MoveTo(Alias_SaminaStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0001_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:18
  DialogueCFTheKey.SetStage(800) ; #DEBUG_LINE_NO:19
  Game.GetPlayer().MoveTo(Alias_GennadyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False) ; #DEBUG_LINE_NO:21
  Self.SetStage(100) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0002_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:30
  DialogueCFTheKey.SetStage(800) ; #DEBUG_LINE_NO:31
  Game.GetPlayer().MoveTo(Alias_SuppliesStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:32
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False) ; #DEBUG_LINE_NO:33
  Self.SetStage(200) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0003_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:42
  DialogueCFTheKey.SetStage(800) ; #DEBUG_LINE_NO:43
  Game.GetPlayer().MoveTo(Alias_SaminaStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:44
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False) ; #DEBUG_LINE_NO:45
  Self.SetStage(300) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:54
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveFailed(100, True) ; #DEBUG_LINE_NO:63
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:72
  Self.Stop() ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:81
  Alias_TheClinicMapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:83
  Alias_TheClinicMapMarker.GetRef().SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:84
  Alias_MedicalSupplies_Container.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:86
  Alias_CFSD01Evidence.TryToEnable() ; #DEBUG_LINE_NO:87
  Gennady.SetEssential(False) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0190_Item_00()
  Game.GetPlayer().AddItem(Alias_SupplyStorageKey.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:105
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:106
  If !Self.GetStageDone(155) ; #DEBUG_LINE_NO:108
    Game.GetPlayer().AddItem(Alias_SupplyStorageKey.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:109
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.IsObjectiveDisplayed(100) ; #DEBUG_LINE_NO:118
    Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:119
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(200) ; #DEBUG_LINE_NO:121
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:123
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveSkipped(50) ; #DEBUG_LINE_NO:126
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0350_Item_00()
  Game.GetPlayer().RemoveItem(FFKeyZ02_MedicalSupplies as Form, 1, False, None) ; #DEBUG_LINE_NO:135
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:144
  Self.Stop() ; #DEBUG_LINE_NO:145
EndFunction
