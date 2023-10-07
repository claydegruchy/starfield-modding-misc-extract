ScriptName Fragments:Scenes:SF_COM_Andreja_Story_SG03Sce_00230D81 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_13_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.StoryGateSceneCompleted(True) ; #DEBUG_LINE_NO:10
EndFunction
