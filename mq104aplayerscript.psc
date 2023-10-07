ScriptName MQ104APlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PlayerPowerPrereqStage = 710 Auto Const
Int Property PlayerPowerSetStage = 720 Auto Const
Spell Property PlayerFirstPower Auto Const mandatory
Location Property CityNewAtlantisLodgeLocation Auto Const

;-- Functions ---------------------------------------

Event OnSpellCast(Form akSpell)
  If (akSpell == PlayerFirstPower as Form) && Game.GetPlayer().IsInLocation(CityNewAtlantisLodgeLocation) ; #DEBUG_LINE_NO:10
    Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:11
    If MyQuest.GetStageDone(PlayerPowerPrereqStage) && MyQuest.GetStageDone(PlayerPowerSetStage) == False ; #DEBUG_LINE_NO:12
      MyQuest.SetStage(PlayerPowerSetStage) ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
