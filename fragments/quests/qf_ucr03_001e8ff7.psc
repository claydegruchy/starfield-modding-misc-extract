ScriptName Fragments:Quests:QF_UCR03_001E8FF7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property TestGoToSpaceQuest Auto Const mandatory
RefCollectionAlias Property Alias_SpaceCell Auto Const mandatory
RefCollectionAlias Property Alias_spawnPointObj Auto Const mandatory
Quest Property DialogueUCNewAtlantisUCFaction Auto Const mandatory
GlobalVariable Property UCR03_TimesCompleted Auto Const mandatory
RefCollectionAlias Property Alias_Enemies Auto Const mandatory
Quest Property UCR03_SpaceEncounter Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  TestGoToSpaceQuest.SetStage(10) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0003_Item_00()
  Cell ParentCell = Alias_spawnPointObj.GetAt(0).GetParentCell() ; #DEBUG_LINE_NO:15
  String cellHexFormID = Utility.IntToHex(ParentCell.GetFormID()) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0004_Item_00()
  Alias_Enemies.KillAll(None) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:33
  ucr03questscript kmyQuest = __temp as ucr03questscript ; #DEBUG_LINE_NO:34
  kmyQuest.SelectEnemySeed() ; #DEBUG_LINE_NO:38
  If DialogueUCNewAtlantisUCFaction.GetStageDone(3) ; #DEBUG_LINE_NO:41
    Self.SetActive(True) ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:45
  If !DialogueUCNewAtlantisUCFaction.GetStageDone(550) ; #DEBUG_LINE_NO:48
    DialogueUCNewAtlantisUCFaction.SetStage(550) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  UCR03_SpaceEncounter.Start() ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0210_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:66
  ucr03questscript kmyQuest = __temp as ucr03questscript ; #DEBUG_LINE_NO:67
  kmyQuest.SpawnEnemies(False) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_1000_Item_00()
  UCR03_TimesCompleted.SetValue(UCR03_TimesCompleted.GetValue() + 1.0) ; #DEBUG_LINE_NO:78
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:79
  UCR03_SpaceEncounter.Stop() ; #DEBUG_LINE_NO:80
  UCR03_SpaceEncounter.Reset() ; #DEBUG_LINE_NO:81
  Self.Stop() ; #DEBUG_LINE_NO:82
  Self.Reset() ; #DEBUG_LINE_NO:83
EndFunction
