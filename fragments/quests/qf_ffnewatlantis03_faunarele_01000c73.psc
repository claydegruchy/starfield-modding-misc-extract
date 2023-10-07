ScriptName Fragments:Quests:QF_FFNewAtlantis03_FaunaRele_01000C73 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Fauna Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
RefCollectionAlias Property Alias_FaunaCollection Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_FaunaCollection.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:15
EndFunction
