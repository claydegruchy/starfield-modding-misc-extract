ScriptName Fragments:Scenes:SF_TestSnapInteractionQuestS_001862C2 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CharGenFurniture Auto Const
ReferenceAlias Property CharacterGenFurniture Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  ObjectReference MedBenchREF = CharGenFurniture.GetRef() ; #DEBUG_LINE_NO:8
  PlayerREF.Waitfor3dLoad() ; #DEBUG_LINE_NO:9
  MedBenchREF.Waitfor3dLoad() ; #DEBUG_LINE_NO:10
  MedBenchREF.Activate(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:11
EndFunction
