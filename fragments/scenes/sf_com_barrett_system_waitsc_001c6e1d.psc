ScriptName Fragments:Scenes:SF_COM_Barrett_System_WaitSc_001C6E1D Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.WaitSceneEnded() ; #DEBUG_LINE_NO:10
EndFunction
