ScriptName Fragments:Scenes:SF_COM_Barrett_Story_SG04_001C6E19 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_20_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.StoryGateSceneCompleted(True) ; #DEBUG_LINE_NO:10
EndFunction
