ScriptName Fragments:Scenes:SF_COM_Barrett_TopLevel_Flir_0014A9F3 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_06_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.FlirtSceneEnded() ; #DEBUG_LINE_NO:10
EndFunction
