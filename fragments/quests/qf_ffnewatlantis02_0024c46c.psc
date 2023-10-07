ScriptName Fragments:Quests:QF_FFNewAtlantis02_0024C46C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFNewAtlantis02_Credits_Medium Auto Const mandatory
GlobalVariable Property FFNewAtlantis02_Credits_Small Auto Const mandatory
ReferenceAlias Property Alias_PackageActivator Auto Const mandatory
ReferenceAlias Property Alias_Package Auto Const mandatory
MiscObject Property FFNewAtlantis02_Package Auto Const mandatory
Quest Property FFNewAtlantis04 Auto Const mandatory
Quest Property City_NA_GuardPointer_NA02 Auto Const mandatory
Quest Property FFNewAtlantis02 Auto Const mandatory
Quest Property FFNewAtlantis02TopLevels Auto Const mandatory
Quest Property FFNewAtlantis02Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  FFNewAtlantis02.Start() ; #DEBUG_LINE_NO:7
  FFNewAtlantis02TopLevels.Start() ; #DEBUG_LINE_NO:8
  FFNewAtlantis02Misc.Start() ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0010_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:17
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:19
  If Self.GetStageDone(15) == True ; #DEBUG_LINE_NO:21
    PlayerREF.AddItem(Credits as Form, FFNewAtlantis02_Credits_Medium.GetValueInt(), False) ; #DEBUG_LINE_NO:22
  Else ; #DEBUG_LINE_NO:
    PlayerREF.AddItem(Credits as Form, FFNewAtlantis02_Credits_Small.GetValueInt(), False) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
  City_NA_GuardPointer_NA02.SetStage(200) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_PackageActivator.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:36
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:37
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_PackageActivator.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:46
  Game.GetPlayer().AddAliasedItem(FFNewAtlantis02_Package as Form, Alias_Package as Alias, 1, True) ; #DEBUG_LINE_NO:48
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:50
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0100_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Package.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:59
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:60
  FFNewAtlantis04.Start() ; #DEBUG_LINE_NO:61
  Self.Stop() ; #DEBUG_LINE_NO:62
EndFunction
