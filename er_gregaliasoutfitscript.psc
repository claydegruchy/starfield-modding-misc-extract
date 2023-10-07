ScriptName ER_GregAliasOutfitScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property ER_QuestlineComplete Auto Const mandatory
{ Used to check if the ER questline is completed }
Outfit Property Outfit_Clothes_Security_Guard_01_NoHelmet Auto Const mandatory
{ Outfit for Greg to wear post-questline }

;-- Functions ---------------------------------------

Event OnLoad()
  If ER_QuestlineComplete.GetValue() >= 1.0 ; #DEBUG_LINE_NO:10
    Self.GetActorRef().SetOutfit(Outfit_Clothes_Security_Guard_01_NoHelmet, False) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndEvent
