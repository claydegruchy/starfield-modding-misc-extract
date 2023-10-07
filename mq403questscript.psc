ScriptName MQ403QuestScript Extends Quest

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
LocationAlias Property TempleLocation08 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger01 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger02 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger03 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger04 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger05 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger06 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger07 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger08 Auto Const mandatory
Int Property StageAcquiredPower01 = 210 Auto Const
Int Property StageAcquiredPower02 = 220 Auto Const
Int Property StageAcquiredPower03 = 230 Auto Const
Int Property StageAcquiredPower04 = 240 Auto Const
Int Property StageAcquiredPower05 = 250 Auto Const
Int Property StageAcquiredPower06 = 260 Auto Const
Int Property StageAcquiredPower07 = 270 Auto Const
Int Property StageAcquiredPower08 = 280 Auto Const
Int Property ArtifactNumber01 = 0 Auto Const
Int Property ArtifactNumber02 = 4 Auto Const
Int Property ArtifactNumber03 = 5 Auto Const
Int Property ArtifactNumber04 = 6 Auto Const
Int Property ArtifactNumber05 = 8 Auto Const
Int Property ArtifactNumber06 = 9 Auto Const
Int Property ArtifactNumber07 = 11 Auto Const
Int Property ArtifactNumber08 = 12 Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber01, TempleLocation01.GetLocation()) ; #DEBUG_LINE_NO:42
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber02, TempleLocation02.GetLocation()) ; #DEBUG_LINE_NO:43
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber03, TempleLocation03.GetLocation()) ; #DEBUG_LINE_NO:44
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber04, TempleLocation04.GetLocation()) ; #DEBUG_LINE_NO:45
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber05, TempleLocation05.GetLocation()) ; #DEBUG_LINE_NO:46
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber06, TempleLocation06.GetLocation()) ; #DEBUG_LINE_NO:47
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber07, TempleLocation07.GetLocation()) ; #DEBUG_LINE_NO:48
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber08, TempleLocation08.GetLocation()) ; #DEBUG_LINE_NO:49
  Self.RegisterForCustomEvent((TemplePowerTrigger01.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:51
  Self.RegisterForCustomEvent((TemplePowerTrigger02.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:52
  Self.RegisterForCustomEvent((TemplePowerTrigger03.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:53
  Self.RegisterForCustomEvent((TemplePowerTrigger04.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:54
  Self.RegisterForCustomEvent((TemplePowerTrigger05.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:55
  Self.RegisterForCustomEvent((TemplePowerTrigger06.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:56
  Self.RegisterForCustomEvent((TemplePowerTrigger07.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:57
  Self.RegisterForCustomEvent((TemplePowerTrigger08.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:58
EndEvent

Event SBPowerCollectionActivatorScript.PowerAcquiredEvent(sbpowercollectionactivatorscript akSender, Var[] akArgs)
  If (akSender as ObjectReference == TemplePowerTrigger01.GetRef()) && Self.GetStageDone(StageAcquiredPower01) == False ; #DEBUG_LINE_NO:62
    Self.SetStage(StageAcquiredPower01) ; #DEBUG_LINE_NO:63
  ElseIf (akSender as ObjectReference == TemplePowerTrigger02.GetRef()) && Self.GetStageDone(StageAcquiredPower02) == False ; #DEBUG_LINE_NO:64
    Self.SetStage(StageAcquiredPower02) ; #DEBUG_LINE_NO:65
  ElseIf (akSender as ObjectReference == TemplePowerTrigger03.GetRef()) && Self.GetStageDone(StageAcquiredPower03) == False ; #DEBUG_LINE_NO:66
    Self.SetStage(StageAcquiredPower03) ; #DEBUG_LINE_NO:67
  ElseIf (akSender as ObjectReference == TemplePowerTrigger04.GetRef()) && Self.GetStageDone(StageAcquiredPower04) == False ; #DEBUG_LINE_NO:68
    Self.SetStage(StageAcquiredPower04) ; #DEBUG_LINE_NO:69
  ElseIf (akSender as ObjectReference == TemplePowerTrigger05.GetRef()) && Self.GetStageDone(StageAcquiredPower05) == False ; #DEBUG_LINE_NO:70
    Self.SetStage(StageAcquiredPower05) ; #DEBUG_LINE_NO:71
  ElseIf (akSender as ObjectReference == TemplePowerTrigger06.GetRef()) && Self.GetStageDone(StageAcquiredPower06) == False ; #DEBUG_LINE_NO:72
    Self.SetStage(StageAcquiredPower06) ; #DEBUG_LINE_NO:73
  ElseIf (akSender as ObjectReference == TemplePowerTrigger07.GetRef()) && Self.GetStageDone(StageAcquiredPower07) == False ; #DEBUG_LINE_NO:74
    Self.SetStage(StageAcquiredPower07) ; #DEBUG_LINE_NO:75
  ElseIf (akSender as ObjectReference == TemplePowerTrigger08.GetRef()) && Self.GetStageDone(StageAcquiredPower08) == False ; #DEBUG_LINE_NO:76
    Self.SetStage(StageAcquiredPower08) ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
EndEvent
