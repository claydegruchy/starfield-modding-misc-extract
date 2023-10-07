ScriptName Fragments:Quests:QF_FC_EncryptedSlateQuest_010017ED Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property FC_EncryptedSlatesCollectedAV Auto Const mandatory
Quest Property FC05 Auto Const mandatory
Quest Property FC06 Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
Book Property FC05_MarcoDataslate Auto Const mandatory
Book Property FC06_MayaDataslate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0400_Item_00()
  ObjectReference Player = Alias_Player.GetReference() ; #DEBUG_LINE_NO:7
  If Player.GetValue(FC_EncryptedSlatesCollectedAV) == 2.0 ; #DEBUG_LINE_NO:9
    FC05.SetStage(2100) ; #DEBUG_LINE_NO:10
    FC06.SetStage(2000) ; #DEBUG_LINE_NO:11
    Player.RemoveItem(FC05_MarcoDataslate as Form, 1, False, None) ; #DEBUG_LINE_NO:13
    Player.RemoveItem(FC06_MayaDataslate as Form, 1, False, None) ; #DEBUG_LINE_NO:15
    Self.SetStage(1000) ; #DEBUG_LINE_NO:16
  ElseIf FC05.GetStageDone(2000) ; #DEBUG_LINE_NO:18
    FC05.SetStage(2100) ; #DEBUG_LINE_NO:19
    Player.RemoveItem(FC05_MarcoDataslate as Form, 1, False, None) ; #DEBUG_LINE_NO:21
  Else ; #DEBUG_LINE_NO:
    FC06.SetStage(2000) ; #DEBUG_LINE_NO:23
    Player.RemoveItem(FC06_MayaDataslate as Form, 1, False, None) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  ObjectReference Player = Alias_Player.GetReference() ; #DEBUG_LINE_NO:35
  If FC05.GetStageDone(2000) ; #DEBUG_LINE_NO:37
    FC05.SetStage(2100) ; #DEBUG_LINE_NO:38
    Player.RemoveItem(FC05_MarcoDataslate as Form, 1, False, None) ; #DEBUG_LINE_NO:40
  Else ; #DEBUG_LINE_NO:
    FC06.SetStage(2000) ; #DEBUG_LINE_NO:42
    Player.RemoveItem(FC06_MayaDataslate as Form, 1, False, None) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(1000) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:58
EndFunction
