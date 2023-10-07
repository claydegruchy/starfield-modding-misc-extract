ScriptName Fragments:Scenes:SF_COM_SarahMorgan_Story_SG0_0027B5AA Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_06_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.StartCommitmentQuest() ; #DEBUG_LINE_NO:10
EndFunction
