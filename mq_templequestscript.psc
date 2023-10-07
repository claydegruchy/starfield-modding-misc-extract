ScriptName MQ_TempleQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property StarbornTempleQuest Auto Const mandatory
LocationAlias Property TempleLocation01 Auto Const mandatory
LocationAlias Property TempleLocation02 Auto Const mandatory
LocationAlias Property TempleLocation03 Auto Const mandatory
LocationAlias Property TempleLocation04 Auto Const mandatory
LocationAlias Property TempleLocation05 Auto Const mandatory
LocationAlias Property TempleLocation06 Auto Const mandatory
LocationAlias Property TempleLocation07 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger01 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger02 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger03 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger04 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger05 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger06 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger07 Auto Const mandatory
Int Property StageAcquiredPower01 = 110 Auto Const
Int Property StageAcquiredPower02 = 120 Auto Const
Int Property StageAcquiredPower03 = 130 Auto Const
Int Property StageAcquiredPower04 = 140 Auto Const
Int Property StageAcquiredPower05 = 150 Auto Const
Int Property StageAcquiredPower06 = 160 Auto Const
Int Property StageAcquiredPower07 = 170 Auto Const
Int Property ArtifactNumber01 = 4 Auto Const
Int Property ArtifactNumber02 = 5 Auto Const
Int Property ArtifactNumber03 = 6 Auto Const
Int Property ArtifactNumber04 = 8 Auto Const
Int Property ArtifactNumber05 = 9 Auto Const
Int Property ArtifactNumber06 = 11 Auto Const
Int Property ArtifactNumber07 = 12 Auto Const
Int Property Artifact04Obj = 40 Auto Const
Int Property Artifact05Obj = 50 Auto Const
Int Property Artifact06Obj = 60 Auto Const
Int Property Artifact07Obj = 70 Auto Const
Int Property WaitForVladObj = 200 Auto Const
Int Property CheckOnVladObj = 210 Auto Const
Location Property StarstationTheEyeLocation Auto Const mandatory
Location Property CityNewAtlantisLodgeLocation Auto Const mandatory
GlobalVariable Property MQTempleQuest_HaveTempleObj Auto Const mandatory

;-- Functions ---------------------------------------

Function CheckForTemples()
  Int PlayerHasNeededArtifact = 0 ; #DEBUG_LINE_NO:52
  PlayerHasNeededArtifact = (StarbornTempleQuest as starborntemplequestscript).CheckPlayerArtifactForPower() ; #DEBUG_LINE_NO:53
  If PlayerHasNeededArtifact > -1 ; #DEBUG_LINE_NO:55
    Self.SetObjectiveDisplayed(WaitForVladObj, False, False) ; #DEBUG_LINE_NO:56
    Self.SetObjectiveDisplayed(CheckOnVladObj, True, True) ; #DEBUG_LINE_NO:57
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(WaitForVladObj, True, True) ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function VladimirGivesObjective()
  Self.SetObjectiveDisplayed(CheckOnVladObj, False, False) ; #DEBUG_LINE_NO:64
  Int myArtifactNumber = 0 ; #DEBUG_LINE_NO:65
  myArtifactNumber = (StarbornTempleQuest as starborntemplequestscript).CheckPlayerArtifactForPower() ; #DEBUG_LINE_NO:66
  If myArtifactNumber == ArtifactNumber04 ; #DEBUG_LINE_NO:67
    Self.SetObjectiveDisplayed(Artifact04Obj, True, False) ; #DEBUG_LINE_NO:68
  ElseIf myArtifactNumber == ArtifactNumber05 ; #DEBUG_LINE_NO:69
    Self.SetObjectiveDisplayed(Artifact05Obj, True, False) ; #DEBUG_LINE_NO:70
  ElseIf myArtifactNumber == ArtifactNumber06 ; #DEBUG_LINE_NO:71
    Self.SetObjectiveDisplayed(Artifact06Obj, True, False) ; #DEBUG_LINE_NO:72
  ElseIf myArtifactNumber == ArtifactNumber07 ; #DEBUG_LINE_NO:73
    Self.SetObjectiveDisplayed(Artifact07Obj, True, False) ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
  MQTempleQuest_HaveTempleObj.SetValueInt(1) ; #DEBUG_LINE_NO:78
EndFunction

Event OnQuestInit()
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber01, TempleLocation01.GetLocation()) ; #DEBUG_LINE_NO:84
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber02, TempleLocation02.GetLocation()) ; #DEBUG_LINE_NO:85
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber03, TempleLocation03.GetLocation()) ; #DEBUG_LINE_NO:86
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber04, TempleLocation04.GetLocation()) ; #DEBUG_LINE_NO:87
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber05, TempleLocation05.GetLocation()) ; #DEBUG_LINE_NO:88
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber06, TempleLocation06.GetLocation()) ; #DEBUG_LINE_NO:89
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber07, TempleLocation07.GetLocation()) ; #DEBUG_LINE_NO:90
  Self.RegisterForCustomEvent((TemplePowerTrigger01.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:92
  Self.RegisterForCustomEvent((TemplePowerTrigger02.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:93
  Self.RegisterForCustomEvent((TemplePowerTrigger03.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:94
  Self.RegisterForCustomEvent((TemplePowerTrigger04.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:95
  Self.RegisterForCustomEvent((TemplePowerTrigger05.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:96
  Self.RegisterForCustomEvent((TemplePowerTrigger06.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:97
  Self.RegisterForCustomEvent((TemplePowerTrigger07.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:98
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:101
EndEvent

Event SBPowerCollectionActivatorScript.PowerAcquiredEvent(sbpowercollectionactivatorscript akSender, Var[] akArgs)
  If (akSender as ObjectReference == TemplePowerTrigger01.GetRef()) && Self.GetStageDone(StageAcquiredPower01) == False ; #DEBUG_LINE_NO:105
    Self.SetStage(StageAcquiredPower01) ; #DEBUG_LINE_NO:106
  ElseIf (akSender as ObjectReference == TemplePowerTrigger02.GetRef()) && Self.GetStageDone(StageAcquiredPower02) == False ; #DEBUG_LINE_NO:107
    Self.SetStage(StageAcquiredPower02) ; #DEBUG_LINE_NO:108
  ElseIf (akSender as ObjectReference == TemplePowerTrigger03.GetRef()) && Self.GetStageDone(StageAcquiredPower03) == False ; #DEBUG_LINE_NO:109
    Self.SetStage(StageAcquiredPower03) ; #DEBUG_LINE_NO:110
  ElseIf (akSender as ObjectReference == TemplePowerTrigger04.GetRef()) && Self.GetStageDone(StageAcquiredPower04) == False ; #DEBUG_LINE_NO:111
    Self.SetStage(StageAcquiredPower04) ; #DEBUG_LINE_NO:112
  ElseIf (akSender as ObjectReference == TemplePowerTrigger05.GetRef()) && Self.GetStageDone(StageAcquiredPower05) == False ; #DEBUG_LINE_NO:113
    Self.SetStage(StageAcquiredPower05) ; #DEBUG_LINE_NO:114
  ElseIf (akSender as ObjectReference == TemplePowerTrigger06.GetRef()) && Self.GetStageDone(StageAcquiredPower06) == False ; #DEBUG_LINE_NO:115
    Self.SetStage(StageAcquiredPower06) ; #DEBUG_LINE_NO:116
  ElseIf (akSender as ObjectReference == TemplePowerTrigger07.GetRef()) && Self.GetStageDone(StageAcquiredPower07) == False ; #DEBUG_LINE_NO:117
    Self.SetStage(StageAcquiredPower07) ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer() ; #DEBUG_LINE_NO:124
    If akNewLoc == StarstationTheEyeLocation || akNewLoc == CityNewAtlantisLodgeLocation ; #DEBUG_LINE_NO:125
      Self.CheckForTemples() ; #DEBUG_LINE_NO:126
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
