ScriptName Fragments:Scenes:SF_SE_FAB01_100b_HailingAnsw_0008981E Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  se_fab04_mathcount kmyQuest = Self.GetOwningQuest() as se_fab04_mathcount ; #DEBUG_LINE_NO:7
  kmyQuest.CountShipParts() ; #DEBUG_LINE_NO:10
EndFunction
