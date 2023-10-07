ScriptName Fragments:Scenes:SF_COM_SamCoe_TopLevel_GiveI_000DF497 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.GiveItemSceneEnded() ; #DEBUG_LINE_NO:10
EndFunction
