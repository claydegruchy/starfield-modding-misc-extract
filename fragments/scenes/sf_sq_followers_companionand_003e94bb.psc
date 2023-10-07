ScriptName Fragments:Scenes:SF_SQ_Followers_CompanionAnd_003E94BB Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PrimaryActorAlias Auto Const mandatory
Keyword Property Contraband Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_03_End()
  sq_followersscript kmyQuest = Self.GetOwningQuest() as sq_followersscript ; #DEBUG_LINE_NO:7
  PrimaryActorAlias.GetActorReference().OpenInventory(True, Contraband as Form, False) ; #DEBUG_LINE_NO:10
EndFunction
