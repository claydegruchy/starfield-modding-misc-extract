ScriptName Fragments:Quests:QF_UCR04_Dupe00_0003517B_2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UCR04_TimesCompleted Auto Const mandatory
Quest Property DialogueRedDevilsHQ Auto Const mandatory
MiscObject Property UCR04_SpecimenSample Auto Const mandatory
ReferenceAlias Property Alias_DebugMarker Auto Const mandatory
ObjectReference Property UCR04_DebugMarker Auto Const mandatory
GlobalVariable Property UCR04_SamplesTotalRequired Auto Const mandatory
Message Property UCR04_DEBUG_HadrianForKaiser Auto Const mandatory
Quest Property DialogueUCFaction Auto Const mandatory
Perk Property UCR04_HarvestSamplePerk Auto Const mandatory
ReferenceAlias Property Alias_DropOffNPC Auto Const mandatory
Scene Property UCR04_100_Jakob_StartUp Auto Const mandatory
ReferenceAlias Property Alias_RDHQMapMarker Auto Const mandatory
ReferenceAlias Property Alias_ActiveUCR04Instance Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  DialogueRedDevilsHQ.SetStage(1) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().Moveto(Alias_DebugMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  Alias_RDHQMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0002_Item_00()
  DialogueRedDevilsHQ.SetStage(1) ; #DEBUG_LINE_NO:23
  Self.SetStage(500) ; #DEBUG_LINE_NO:25
  Game.GetPlayer().AddItem(UCR04_SpecimenSample as Form, UCR04_SamplesTotalRequired.GetValueInt(), False) ; #DEBUG_LINE_NO:26
  Game.GetPlayer().Moveto(UCR04_DebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:36
  ucr04questscript kmyQuest = __temp as ucr04questscript ; #DEBUG_LINE_NO:37
  Alias_ActiveUCR04Instance.ForceRefTo(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:40
  Game.GetPlayer().AddPerk(UCR04_HarvestSamplePerk, False) ; #DEBUG_LINE_NO:41
  kmyQuest.PrepQuest() ; #DEBUG_LINE_NO:43
  UCR04_100_Jakob_StartUp.Start() ; #DEBUG_LINE_NO:45
  If !DialogueRedDevilsHQ.GetStageDone(200) ; #DEBUG_LINE_NO:48
    DialogueRedDevilsHQ.SetStage(200) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:58
  Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:59
  Self.SetObjectiveDisplayed(111, False, False) ; #DEBUG_LINE_NO:60
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:61
  Alias_DropOffNPC.GetRef().Enable(False) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0999_Item_00()
  Game.GetPlayer().RemovePerk(UCR04_HarvestSamplePerk) ; #DEBUG_LINE_NO:72
  ObjectReference XBRef = Alias_DropOffNPC.GetRef() ; #DEBUG_LINE_NO:75
  If !XBRef.Is3DLoaded() && XBRef.IsEnabled() ; #DEBUG_LINE_NO:76
    XBRef.Disable(False) ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_ActiveUCR04Instance.Clear() ; #DEBUG_LINE_NO:88
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:89
  PlayREF.RemoveItem(UCR04_SpecimenSample as Form, PlayREF.GetItemCount(UCR04_SpecimenSample as Form), False, None) ; #DEBUG_LINE_NO:90
  Game.GetPlayer().RemovePerk(UCR04_HarvestSamplePerk) ; #DEBUG_LINE_NO:92
  ObjectReference XBRef = Alias_DropOffNPC.GetRef() ; #DEBUG_LINE_NO:95
  If !XBRef.Is3DLoaded() && XBRef.IsEnabled() ; #DEBUG_LINE_NO:96
    XBRef.Disable(False) ; #DEBUG_LINE_NO:97
  EndIf ; #DEBUG_LINE_NO:
  UCR04_TimesCompleted.SetValue(UCR04_TimesCompleted.GetValue() + 1.0) ; #DEBUG_LINE_NO:100
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:101
  Self.Stop() ; #DEBUG_LINE_NO:102
EndFunction
