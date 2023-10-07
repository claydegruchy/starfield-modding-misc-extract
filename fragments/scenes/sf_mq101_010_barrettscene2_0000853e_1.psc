ScriptName Fragments:Scenes:SF_MQ101_010_BarrettScene2_0000853E_1 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  mq101script kmyQuest = Self.GetOwningQuest() as mq101script ; #DEBUG_LINE_NO:7
  kmyQuest.VSEnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_End()
  mq101script kmyQuest = Self.GetOwningQuest() as mq101script ; #DEBUG_LINE_NO:18
  kmyQuest.VSEnableLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Phase_02_Begin()
  Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:29
  Game.ForceFirstPerson() ; #DEBUG_LINE_NO:30
EndFunction
