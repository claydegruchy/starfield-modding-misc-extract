ScriptName Fragments:Scenes:SF_COM_Barrett_System_GiveIt_001C6E22 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.GiveItemSceneEnded() ; #DEBUG_LINE_NO:10
EndFunction
