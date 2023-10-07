ScriptName ForceLegendaryActorScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
legendaryaliasquestscript Property LegendaryAliasQuest Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.IsDead() == False ; #DEBUG_LINE_NO:6
    LegendaryAliasQuest.MakeLegendary(Self as Actor) ; #DEBUG_LINE_NO:7
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDeath(ObjectReference akKiller)
  LegendaryAliasQuest.RemoveLegendary(Self as Actor) ; #DEBUG_LINE_NO:12
EndEvent
