ScriptName Fragments:Quests:QF_FFNewHomesteadR04_0021B1FA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Joyce Auto Const mandatory
GlobalVariable Property FFNewHomesteadR04_NumTimesCompleted Auto Const mandatory
Quest Property FFNewHomesteadR04Misc Auto Const mandatory
Quest Property DialogueNewHomestead Auto Const mandatory
ActorValue Property FFNewHomesteadR04_Foreknowledge_AV Auto Const mandatory
Keyword Property FFNewHomesteadR04MiscQuestStartKeyword Auto Const mandatory
ReferenceAlias Property Alias_Ice01 Auto Const mandatory
ReferenceAlias Property Alias_Ice02 Auto Const mandatory
ReferenceAlias Property Alias_Turbine01 Auto Const mandatory
ReferenceAlias Property Alias_Turbine02 Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
RefCollectionAlias Property Alias_LightEnableMarkers Auto Const mandatory
GlobalVariable Property FFNewHomesteadR04_Repeated Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Joyce.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:23
  DialogueNewHomestead.SetStage(412) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0200_Item_00()
  If FFNewHomesteadR04Misc.IsRunning() ; #DEBUG_LINE_NO:32
    FFNewHomesteadR04Misc.SetStage(1000) ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
  If DialogueNewHomestead.GetStageDone(411) && !DialogueNewHomestead.GetStageDone(412) && !DialogueNewHomestead.GetStageDone(413) ; #DEBUG_LINE_NO:36
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:40
  Alias_Ice01.GetRef().SetLinkedRef(Alias_Turbine01.GetRef(), LinkCustom01, True) ; #DEBUG_LINE_NO:42
  Alias_Ice02.GetRef().SetLinkedRef(Alias_Turbine02.GetRef(), LinkCustom01, True) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_LightEnableMarkers.DisableAll(False) ; #DEBUG_LINE_NO:52
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:53
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_10000_Item_00()
  FFNewHomesteadR04MiscQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:62
  If FFNewHomesteadR04_Repeated.GetValue() < 1.0 ; #DEBUG_LINE_NO:63
    FFNewHomesteadR04_Repeated.SetValue(1.0) ; #DEBUG_LINE_NO:64
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:74
  ffnewhomesteadr04questscript kmyQuest = __temp as ffnewhomesteadr04questscript ; #DEBUG_LINE_NO:75
  kmyQuest.SetCooldown() ; #DEBUG_LINE_NO:78
  If FFNewHomesteadR04_NumTimesCompleted.GetValue() == 0.0 ; #DEBUG_LINE_NO:80
    Game.GetPlayer().SetValue(FFNewHomesteadR04_Foreknowledge_AV, 1.0) ; #DEBUG_LINE_NO:81
  EndIf ; #DEBUG_LINE_NO:
  FFNewHomesteadR04_NumTimesCompleted.Mod(1.0) ; #DEBUG_LINE_NO:84
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:85
EndFunction
