ScriptName Fragments:Quests:QF_RAD06_03_00137042 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
Book Property RAD06_Trident_Dataslate Auto Const mandatory
ReferenceAlias Property Alias_ContractSlate Auto Const mandatory
MiscObject Property InorgExoticPlutonium Auto Const mandatory
GlobalVariable Property RAD06_CurrentResource Auto Const mandatory
GlobalVariable Property RAD06_KA_Job Auto Const mandatory
GlobalVariable Property RAD06_CurrentReward Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rad06script kmyQuest = __temp as rad06script ; #DEBUG_LINE_NO:8
  kmyQuest.InitResource() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0050_Item_00()
  If !Self.GetStageDone(100) ; #DEBUG_LINE_NO:20
    Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
  If RAD06_KA_Job.GetValue() == 0.0 ; #DEBUG_LINE_NO:26
    RAD06_KA_Job.SetValue(1.0) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:36
  rad06script kmyQuest = __temp as rad06script ; #DEBUG_LINE_NO:37
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:41
  Actor pPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:44
  ObjectReference oItem = pPlayer.PlaceAtMe(RAD06_Trident_Dataslate as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:45
  Alias_ContractSlate.ForceRefTo(oItem) ; #DEBUG_LINE_NO:46
  pPlayer.AddItem(oItem as Form, 1, False) ; #DEBUG_LINE_NO:47
  RAD06_KA_Job.SetValue(2.0) ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor pPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:58
  pPlayer.RemoveItem(RAD06_Trident_Dataslate as Form, 1, True, None) ; #DEBUG_LINE_NO:61
  Self.SetStage(9000) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_8800_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_8900_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:80
  Self.Stop() ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:89
EndFunction
