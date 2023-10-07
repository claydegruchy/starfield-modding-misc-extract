ScriptName DefaultCollectionAliasAddPerkOnLoad Extends RefCollectionAlias Const default

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property PerkToAdd Auto Const
{ The perk that should be added to actors in the collection upon load. }

;-- Functions ---------------------------------------

Event OnLoad(ObjectReference akSenderRef)
  If akSenderRef as Actor != None ; #DEBUG_LINE_NO:7
    (akSenderRef as Actor).AddPerk(PerkToAdd, False) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
