ScriptName Fragments:Quests:QF_MQ_TutorialQuest_00045640 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property Tutorial_ZeroG_MSGBox Auto Const mandatory
Message Property Tutorial_ShipLowHealthMSG Auto Const mandatory
Message Property Tutorial_ShipDamagedSystemMSG Auto Const mandatory
Message Property Tutorial_GravRange_MSGBox Auto Const mandatory
Message Property Tutorial_GravRange21_MSGBox Auto Const mandatory
Message Property Tutorial_NewHomeShip01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.ShowHelpMessage("ZeroG") ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:21
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:22
  kmyQuest.ShowHelpMessage("EMWeapons") ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:33
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:34
  Tutorial_ShipLowHealthMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:37
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:38
  kmyQuest.ShowHelpMessage("ShipRepair") ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:47
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:48
  Tutorial_ShipDamagedSystemMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:51
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:52
  kmyQuest.ShowHelpMessage("ShipSystemDamage") ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:61
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:62
  kmyQuest.ShowHelpMessage("ShipEMWeapon") ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:73
  mq_tutorialquestscript kmyQuest = __temp as mq_tutorialquestscript ; #DEBUG_LINE_NO:74
  kmyQuest.StartPowerTutorial() ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0200_Item_00()
  Tutorial_GravRange_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0210_Item_00()
  Tutorial_GravRange21_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0300_Item_00()
  Tutorial_NewHomeShip01.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:102
EndFunction
