ScriptName Fragments:Quests:QF_Trait_RaisedEnlightenedBo_000664E3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference[] Property EnlightenedLootboxes Auto Const
Perk Property TRAIT_RaisedEnlightened Auto Const mandatory
ObjectReference Property RaisedEnlightenedLootboxEnabler Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0500_Item_00()
  If Game.GetPlayer().HasPerk(TRAIT_RaisedEnlightened) ; #DEBUG_LINE_NO:8
    RaisedEnlightenedLootboxEnabler.Enable(False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  RaisedEnlightenedLootboxEnabler.Disable(False) ; #DEBUG_LINE_NO:19
  Self.SetStage(1000) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.STOP() ; #DEBUG_LINE_NO:28
EndFunction
