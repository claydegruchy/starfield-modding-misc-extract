ScriptName MQ204Script Extends Quest

;-- Variables ---------------------------------------
Int NumRescueAtEyeCount
Int NumRescueAtEyeTotal = 4
Int NumRescueAtLodgeCount
Int NumRescueAtLodgeTotal = 4

;-- Properties --------------------------------------
inputenablelayer Property MQ204EnableLayer Auto hidden
Faction Property CurrentCompanionFaction Auto Const mandatory
Message Property MQ204MedStimMSG Auto Const mandatory
ActorValue Property Health Auto Const mandatory
Int Property RescuedEyeStage = 390 Auto Const
Int Property RescuedLodgeStage = 470 Auto Const
Location Property StarStationTheEyeLocation Auto Const mandatory
Faction Property AvailableCompanionFaction Auto Const mandatory
RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const mandatory
Keyword Property AnimFaceArchetypeInPain Auto Const mandatory
ReferenceAlias Property TheHunter Auto Const mandatory
Scene Property MQ204A_013_HunterSceneRepeat Auto Const mandatory
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
ObjectReference Property EyeMarker Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
Spell Property AbStarbornTeleport Auto Const mandatory
ReferenceAlias Property MQ00_CompanionWhoDies Auto Const mandatory
ReferenceAlias Property Andreja Auto Const mandatory
ReferenceAlias Property Barrett Auto Const mandatory
ReferenceAlias Property SamCoe Auto Const mandatory
ReferenceAlias Property SarahMorgan Auto Const mandatory
Keyword Property AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToFemale Auto Const mandatory
Keyword Property AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToMale Auto Const mandatory
Keyword Property AnimArchetypeMQ204A_030_FemaleVictim_MaleReactsToFemale Auto Const mandatory
Keyword Property AnimArchetypeMQ204A_030_MaleVictim_FemaleReactsToMale Auto Const mandatory
Keyword Property AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToFemale Auto Const mandatory
Keyword Property AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToMale Auto Const mandatory
Keyword Property MQ204A_030_MaleVictim Auto Const mandatory
Keyword Property MQ204A_030_FemaleVictim Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.SetStage(10) ; #DEBUG_LINE_NO:39
EndEvent

Function SetDeathFurnitureKeywords(Actor akVictim, Actor akSurvivor, ObjectReference akFurniture)
  Actor AndrejaREF = Andreja.GetActorRef() ; #DEBUG_LINE_NO:43
  Actor BarrettREF = Barrett.GetActorRef() ; #DEBUG_LINE_NO:44
  Actor SamCoeREF = SamCoe.GetActorRef() ; #DEBUG_LINE_NO:45
  Actor SarahMorganREF = SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:46
  If akVictim == SarahMorganREF || akVictim == AndrejaREF ; #DEBUG_LINE_NO:49
    If akSurvivor == SarahMorganREF || akSurvivor == AndrejaREF ; #DEBUG_LINE_NO:51
      akVictim.AddKeyword(AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToFemale) ; #DEBUG_LINE_NO:52
      akSurvivor.AddKeyword(AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToFemale) ; #DEBUG_LINE_NO:53
    Else ; #DEBUG_LINE_NO:
      akVictim.AddKeyword(AnimArchetypeMQ204A_030_FemaleVictim_FemaleReactsToMale) ; #DEBUG_LINE_NO:56
      akSurvivor.AddKeyword(AnimArchetypeMQ204A_030_FemaleVictim_MaleReactsToFemale) ; #DEBUG_LINE_NO:57
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akSurvivor == SarahMorganREF || akSurvivor == AndrejaREF ; #DEBUG_LINE_NO:62
    akVictim.AddKeyword(AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToFemale) ; #DEBUG_LINE_NO:63
    akSurvivor.AddKeyword(AnimArchetypeMQ204A_030_MaleVictim_FemaleReactsToMale) ; #DEBUG_LINE_NO:64
  Else ; #DEBUG_LINE_NO:
    akVictim.AddKeyword(AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToMale) ; #DEBUG_LINE_NO:67
    akSurvivor.AddKeyword(AnimArchetypeMQ204A_030_MaleVictim_MaleReactsToMale) ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RescuedActor(Actor AkActorREF)
  If AkActorREF.IsInLocation(StarStationTheEyeLocation) ; #DEBUG_LINE_NO:75
    Self.CheckEyeActors() ; #DEBUG_LINE_NO:76
  Else ; #DEBUG_LINE_NO:
    Self.CheckLodgeActors() ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
  If AkActorREF != MQ00_CompanionWhoDies.GetActorRef() ; #DEBUG_LINE_NO:80
    AkActorREF.SetGhost(False) ; #DEBUG_LINE_NO:81
  EndIf ; #DEBUG_LINE_NO:
  AkActorREF.SetActivateTextOverride(None) ; #DEBUG_LINE_NO:83
EndFunction

Function CheckEyeActors()
  NumRescueAtEyeCount += 1 ; #DEBUG_LINE_NO:88
  If NumRescueAtEyeCount == NumRescueAtEyeTotal ; #DEBUG_LINE_NO:89
    Self.SetStage(RescuedEyeStage) ; #DEBUG_LINE_NO:90
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckLodgeActors()
  NumRescueAtLodgeCount += 1 ; #DEBUG_LINE_NO:96
  If NumRescueAtLodgeCount == NumRescueAtLodgeTotal ; #DEBUG_LINE_NO:97
    Self.SetStage(RescuedLodgeStage) ; #DEBUG_LINE_NO:98
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetActorHunterAttacked(Actor AkActorREF, Bool bMoveToEye)
  AkActorREF.SetActivateTextOverride(MQ204MedStimMSG) ; #DEBUG_LINE_NO:104
  AkActorREF.SetGhost(True) ; #DEBUG_LINE_NO:105
  AkActorREF.ChangeAnimFaceArchetype(AnimFaceArchetypeInPain) ; #DEBUG_LINE_NO:106
EndFunction

Function MQ204MoveActor(Actor AkActorREF, ObjectReference akMoveMarker)
  If AkActorREF.IsInLocation(akMoveMarker.GetCurrentLocation()) ; #DEBUG_LINE_NO:110
     ; #DEBUG_LINE_NO:
  ElseIf AkActorREF.IsDead() ; #DEBUG_LINE_NO:112
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    AkActorREF.Disable(False) ; #DEBUG_LINE_NO:115
    AkActorREF.Moveto(akMoveMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:116
    AkActorREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:117
    AkActorREF.Enable(False) ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetActorInBleedOut(Actor AkActorREF)
  AkActorREF.SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:123
  AkActorREF.AllowBleedoutDialogue(True) ; #DEBUG_LINE_NO:124
  AkActorREF.DamageValue(Health, 9999.0) ; #DEBUG_LINE_NO:125
EndFunction

Function SetActorRecovered(Actor AkActorREF)
  AkActorREF.SetNoBleedoutRecovery(False) ; #DEBUG_LINE_NO:129
  AkActorREF.AllowBleedoutDialogue(False) ; #DEBUG_LINE_NO:130
  AkActorREF.RestoreValue(Health, 9999.0) ; #DEBUG_LINE_NO:131
EndFunction

Function PlayerReceivesArtifacts()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:137
  Int currentElement = 0 ; #DEBUG_LINE_NO:138
  While currentElement < MQ00_ArtifactsHolder.GetCount() ; #DEBUG_LINE_NO:139
    PlayerREF.additem(MQ00_ArtifactsHolder.GetAt(currentElement) as Form, 1, False) ; #DEBUG_LINE_NO:140
    currentElement += 1 ; #DEBUG_LINE_NO:141
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function HunterWarps(ObjectReference akMarkerREF)
  Actor HunterREF = TheHunter.GetActorRef() ; #DEBUG_LINE_NO:148
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:149
  If HunterREF.GetDistance(PlayerREF as ObjectReference) > 5.0 ; #DEBUG_LINE_NO:150
    akMarkerREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:151
    HunterREF.Moveto(akMarkerREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:152
    AbStarbornTeleport.Cast(HunterREF as ObjectReference, HunterREF as ObjectReference) ; #DEBUG_LINE_NO:153
    MQ204A_013_HunterSceneRepeat.Start() ; #DEBUG_LINE_NO:154
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HunterWarpEnds()
  Actor HunterREF = TheHunter.GetActorRef() ; #DEBUG_LINE_NO:159
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:160
  HunterREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:161
  HunterREF.StartCombat(PlayerREF as ObjectReference, True) ; #DEBUG_LINE_NO:162
EndFunction
