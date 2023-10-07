ScriptName defaultQuestRespawnScriptA Extends defaultQuestRespawnScript default
{ Simple script to respawn Aliases that have the DefaultAliasRespawnScriptA on them. }

;-- Functions ---------------------------------------

Function TryToRespawn(ReferenceAlias aliasToRespawn)
  If (StartStage == 0 || StartStage > 0 && Self.GetStageDone(StartStage)) && (DoneStage == 0 || DoneStage > 0 && !Self.GetStageDone(DoneStage)) && (RespawnPool == 0 || RespawnPool > 0 && respawnCount < RespawnPool) ; #DEBUG_LINE_NO:11
    respawnCount += 1 ; #DEBUG_LINE_NO:12
    Utility.Wait(Utility.RandomInt(RespawnTimeMin, RespawnTimeMax) as Float) ; #DEBUG_LINE_NO:15
    If (aliasToRespawn as defaultaliasrespawnscripta).RespawningOn ; #DEBUG_LINE_NO:17
      Self.Respawn(aliasToRespawn) ; #DEBUG_LINE_NO:18
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
