ScriptName Fragments:Quests:QF_City_NA_Aquilus01_0007BDBF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_NA_Aquilus01Misc Auto Const mandatory
ReferenceAlias Property Alias_Target_Book Auto Const mandatory
GlobalVariable Property Settlement_Convo_NPC_Distance Auto Const mandatory
ReferenceAlias Property Alias_Aquilus Auto Const mandatory
Quest Property MQ206B Auto Const mandatory
ReferenceAlias Property Alias_Marcus Auto Const mandatory
ReferenceAlias Property Alias_Terrance Auto Const mandatory
ReferenceAlias Property Alias_Catherine Auto Const mandatory
ReferenceAlias Property Alias_Andreas Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  If Alias_Aquilus.GetReference().GetDistance(Game.GetPlayer() as ObjectReference) < Settlement_Convo_NPC_Distance.GetValue() ; #DEBUG_LINE_NO:8
    If MQ206B.IsRunning() == False ; #DEBUG_LINE_NO:9
      City_NA_Aquilus01Misc.Start() ; #DEBUG_LINE_NO:10
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:20
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_Terrance.GetReference().Disable(False) ; #DEBUG_LINE_NO:37
  Alias_Andreas.GetReference().Disable(False) ; #DEBUG_LINE_NO:38
  Self.Stop() ; #DEBUG_LINE_NO:39
EndFunction
