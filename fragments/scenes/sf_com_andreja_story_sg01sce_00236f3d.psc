ScriptName Fragments:Scenes:SF_COM_Andreja_Story_SG01Sce_00236F3D Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_19_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.StoryGateSceneCompleted(True) ; #DEBUG_LINE_NO:10
EndFunction
