ScriptName Fragments:Quests:QF_FC_EncryptedSlateQuest_001D5AAF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property FC_EncryptedSlatesCollectedAV Auto Const mandatory
Quest Property FC05 Auto Const mandatory
Quest Property FC06 Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
Book Property FC05_MarcoDataslate Auto Const mandatory
Book Property FC06_MayaDataslate Auto Const mandatory
Quest Property FC08 Auto Const mandatory
ReferenceAlias Property Alias_MarcoSlate Auto Const mandatory
ReferenceAlias Property Alias_MayaSlate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0400_Item_00()
  ObjectReference Player = Alias_Player.GetReference() ; #DEBUG_LINE_NO:7
  If Player.GetValue(FC_EncryptedSlatesCollectedAV) == 2.0 ; #DEBUG_LINE_NO:9
    FC05.SetStage(2100) ; #DEBUG_LINE_NO:10
    FC06.SetStage(2000) ; #DEBUG_LINE_NO:11
    Self.SetStage(1000) ; #DEBUG_LINE_NO:12
  ElseIf FC05.GetStageDone(2000) ; #DEBUG_LINE_NO:14
    FC05.SetStage(2100) ; #DEBUG_LINE_NO:15
  Else ; #DEBUG_LINE_NO:
    FC06.SetStage(2000) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  ObjectReference Player = Alias_Player.GetReference() ; #DEBUG_LINE_NO:27
  If FC05.IsRunning() ; #DEBUG_LINE_NO:30
    FC05.SetStage(2100) ; #DEBUG_LINE_NO:31
  ElseIf FC06.IsRunning() ; #DEBUG_LINE_NO:32
    FC06.SetStage(2000) ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(1000) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_1000_Item_00()
  FC08.Start() ; #DEBUG_LINE_NO:45
  Self.Stop() ; #DEBUG_LINE_NO:47
EndFunction
