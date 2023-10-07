ScriptName Fragments:Scenes:SF_COM_Barrett_TopLevel_Give_0100156C Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.FlirtSceneEnded() ; #DEBUG_LINE_NO:10
EndFunction
