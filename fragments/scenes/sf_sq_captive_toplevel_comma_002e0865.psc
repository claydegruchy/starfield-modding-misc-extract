ScriptName Fragments:Scenes:SF_SQ_Captive_TopLevel_Comma_002E0865 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  sq_captivescript kmyQuest = Self.GetOwningQuest() as sq_captivescript ; #DEBUG_LINE_NO:7
  kmyQuest.CaptiveFollowerWaitSceneEnded() ; #DEBUG_LINE_NO:10
EndFunction
