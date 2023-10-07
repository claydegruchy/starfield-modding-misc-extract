ScriptName Fragments:Scenes:SF_MQ101_005_FaceGenScene_00005743_2 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property MedBench Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  mq101script kmyQuest = Self.GetOwningQuest() as mq101script ; #DEBUG_LINE_NO:7
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:10
  ObjectReference MedBenchREF = MedBench.GetRef() ; #DEBUG_LINE_NO:11
  PlayerREF.Waitfor3dLoad() ; #DEBUG_LINE_NO:12
  MedBenchREF.Waitfor3dLoad() ; #DEBUG_LINE_NO:13
  PlayerREF.SnapIntoInteraction(MedBenchREF) ; #DEBUG_LINE_NO:15
  kmyQuest.StartCharGen() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Phase_05_End()
  Game.SetInCharGen(False, False, False) ; #DEBUG_LINE_NO:25
  Game.RequestSave() ; #DEBUG_LINE_NO:26
  Game.SetInCharGen(True, True, False) ; #DEBUG_LINE_NO:27
EndFunction
