ScriptName Fragments:Quests:QF_FFNewHomesteadR05_0021952E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Luthor Auto Const mandatory
ReferenceAlias Property Alias_ChunksVendor Auto Const mandatory
ReferenceAlias Property Alias_SpecialSauce Auto Const mandatory
GlobalVariable Property FFNewHomesteadR05_NumTimesCompleted Auto Const mandatory
Quest Property FFNewHomesteadR05Misc Auto Const mandatory
ActorValue Property FFNewHomesteadR05_Foreknowledge_AV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Luthor.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().MoveTo(Alias_ChunksVendor.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().MoveTo(Alias_Luthor.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0200_Item_00()
  If FFNewHomesteadR05Misc.IsRunning() ; #DEBUG_LINE_NO:31
    FFNewHomesteadR05Misc.SetStage(1000) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0300_Item_00()
  Game.GetPlayer().AddItem(Alias_SpecialSauce.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:43
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:45
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0999_Item_00()
  Game.GetPlayer().SetValue(FFNewHomesteadR05_Foreknowledge_AV, 1.0) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:62
  ffnewhomesteadr05questscript kmyQuest = __temp as ffnewhomesteadr05questscript ; #DEBUG_LINE_NO:63
  Game.GetPlayer().RemoveItem(Alias_SpecialSauce.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:66
  kmyQuest.SetCooldown() ; #DEBUG_LINE_NO:68
  FFNewHomesteadR05_NumTimesCompleted.Mod(1.0) ; #DEBUG_LINE_NO:70
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:71
  Self.Stop() ; #DEBUG_LINE_NO:72
EndFunction
