ScriptName Fragments:Quests:QF_FFNewHomesteadR02_0021A8B0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Giuliana Auto Const mandatory
GlobalVariable Property FFNewHomesteadR02_NumTimesCompleted Auto Const mandatory
Armor Property Clothes_Monster_Costume Auto Const mandatory
ReferenceAlias Property Alias_MonsterCostume Auto Const mandatory
Scene Property FFNewHomesteadR02_0400_TouristsScene Auto Const mandatory
Quest Property FFNewHomesteadR02Misc Auto Const mandatory
RefCollectionAlias Property Alias_AllOtherTourists Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Giuliana.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_AllOtherTourists.DisableAll(False) ; #DEBUG_LINE_NO:15
  If FFNewHomesteadR02Misc.IsRunning() ; #DEBUG_LINE_NO:17
    FFNewHomesteadR02Misc.SetStage(1000) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:21
  myPlayer.AddAliasedItem(Clothes_Monster_Costume as Form, Alias_MonsterCostume as Alias, 1, False) ; #DEBUG_LINE_NO:22
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:32
  ffnewhomesteadr02questscript kmyQuest = __temp as ffnewhomesteadr02questscript ; #DEBUG_LINE_NO:33
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:36
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:37
  kmyQuest.CheckDistanceForTourists() ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0400_Item_00()
  FFNewHomesteadR02_0400_TouristsScene.Start() ; #DEBUG_LINE_NO:47
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:48
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:57
  ffnewhomesteadr02questscript kmyQuest = __temp as ffnewhomesteadr02questscript ; #DEBUG_LINE_NO:58
  Alias_AllOtherTourists.EnableAll(False) ; #DEBUG_LINE_NO:61
  Game.GetPlayer().RemoveItem(Alias_MonsterCostume.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:62
  kmyQuest.SetCooldown() ; #DEBUG_LINE_NO:63
  FFNewHomesteadR02_NumTimesCompleted.Mod(1.0) ; #DEBUG_LINE_NO:64
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:66
  Self.Stop() ; #DEBUG_LINE_NO:68
EndFunction
