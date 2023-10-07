ScriptName LegendaryAliasQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property ForceLegendaryAlias Auto Const mandatory
Keyword Property LegendaryActorAliasApplied Auto Const mandatory

;-- Functions ---------------------------------------

Function MakeLegendary(Actor ActorToMakeLegendary)
  If ActorToMakeLegendary.HasKeyword(LegendaryActorAliasApplied) == False ; #DEBUG_LINE_NO:8
    ForceLegendaryAlias.ApplyToRef(ActorToMakeLegendary as ObjectReference) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RemoveLegendary(Actor ActorToRemoveLegendary)
  ForceLegendaryAlias.RemoveFromRef(ActorToRemoveLegendary as ObjectReference) ; #DEBUG_LINE_NO:15
EndFunction
