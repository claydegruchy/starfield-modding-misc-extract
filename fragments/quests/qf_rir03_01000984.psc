ScriptName Fragments:Quests:QF_RIR03_01000984 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
Actor Property RI_Imogene Auto Const mandatory
Actor Property RI_Masako Auto Const mandatory
Actor Property RI_Ularu Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
MiscObject Property RIR03_Keycard Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_Keycard Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Float fQuestGiver = RI_RadiantQuestGiver.GetValue() ; #DEBUG_LINE_NO:11
  If fQuestGiver == 0.0 ; #DEBUG_LINE_NO:14
    Alias_QuestGiver.ForceRefTo(Alias_Imogene.GetRef()) ; #DEBUG_LINE_NO:15
  ElseIf fQuestGiver == 1.0 ; #DEBUG_LINE_NO:16
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef()) ; #DEBUG_LINE_NO:17
  ElseIf fQuestGiver == 2.0 ; #DEBUG_LINE_NO:18
    Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef()) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:36
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0210_Item_00()
  Game.GetPlayer().AddItem(Alias_Keycard.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:53
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0350_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Keycard.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:70
  Self.Stop() ; #DEBUG_LINE_NO:71
EndFunction
