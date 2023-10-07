ScriptName Fragments:Quests:QF_SE_Player_FAB01_00089858 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
MiscObject Property InorgCommonIron Auto Const mandatory
GlobalVariable Property SE_FAB01_PlayerReward Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0120_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:16
  se_fab04_mathcount kmyQuest = __temp as se_fab04_mathcount ; #DEBUG_LINE_NO:17
  kmyQuest.RemoveShipParts() ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0150_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, SE_FAB01_PlayerReward.GetValueInt(), False) ; #DEBUG_LINE_NO:29
  Utility.Wait(30.0) ; #DEBUG_LINE_NO:32
  Self.SetStage(300) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0170_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:41
  se_fab04_mathcount kmyQuest = __temp as se_fab04_mathcount ; #DEBUG_LINE_NO:42
  kmyQuest.CountShipParts() ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:55
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:56
EndFunction
