ScriptName Fragments:Scenes:SF_COM_Barrett_Story_SG02_001C6E1B Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_18_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.StoryGateSceneCompleted(True) ; #DEBUG_LINE_NO:10
EndFunction
