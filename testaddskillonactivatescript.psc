ScriptName TestAddSkillOnActivateScript Extends ObjectReference Const
{ adds a skill on activate for testing }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property PerkToAdd Auto Const mandatory
conditionform Property AddPerkCondition Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:8
    If AddPerkCondition as Bool && AddPerkCondition.IsTrue(Game.GetPlayer() as ObjectReference, None) ; #DEBUG_LINE_NO:9
      Game.GetPlayer().AddPerk(PerkToAdd, False) ; #DEBUG_LINE_NO:10
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
