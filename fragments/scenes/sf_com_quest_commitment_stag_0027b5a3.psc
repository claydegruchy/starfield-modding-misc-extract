ScriptName Fragments:Scenes:SF_COM_Quest_Commitment_Stag_0027B5A3 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_16_End()
  com_commitmentquestscript kmyQuest = Self.GetOwningQuest() as com_commitmentquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.GiveCommitmentGift() ; #DEBUG_LINE_NO:10
EndFunction
