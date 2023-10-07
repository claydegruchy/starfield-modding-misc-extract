ScriptName MQ401QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct PlayerKnowledgeStruct
  GlobalVariable PlayerKnowledgeGlobal
  ActorValue PlayerKnowledgeAV
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group QuestVariantsGroup
  Quest[] Property MQ401VariantsArray Auto Const
EndGroup

Int Property PostCharGenStage = 120 Auto Const
Message Property MQ401SkipCharGenMSG Auto Const
Scene Property MQ401_001_LodgeIntro Auto Const mandatory
inputenablelayer Property MQ401EnableLayer Auto hidden
ActorValue Property PlayerUnityTimesEntered Auto Const mandatory
GlobalVariable Property MQ401_VariantCurrent Auto Const mandatory
GlobalVariable Property MQ401_VariantChance Auto Const mandatory
GlobalVariable Property MQ401_ForceVariant Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ReferenceAlias Property Vasco Auto Const mandatory
ReferenceAlias Property Heller Auto Const mandatory
ReferenceAlias Property Lin Auto Const mandatory
ReferenceAlias Property OroraSabine Auto Const mandatory
ReferenceAlias Property SarahMorgan Auto Const mandatory
ReferenceAlias Property WalterStroud Auto Const mandatory
ReferenceAlias Property MatteoKhatri Auto Const mandatory
ReferenceAlias Property Noel Auto Const mandatory
ReferenceAlias Property VladimirSall Auto Const mandatory
ReferenceAlias Property SamCoe Auto Const mandatory
ReferenceAlias Property CoraCoe Auto Const mandatory
ReferenceAlias Property Andreja Auto Const mandatory
ReferenceAlias Property Barrett Auto Const mandatory
ReferenceAlias Property Armillary Auto Const mandatory
ObjectReference Property MQ101_VascoMarker01 Auto Const mandatory
ObjectReference Property VecteraExteriorNPCEnableMarker Auto Const mandatory
ObjectReference Property VecteraInteriorNPCEnableMarker Auto Const mandatory
Quest Property MQ401_AlwaysOn Auto Const mandatory
Quest Property MQ402 Auto Const mandatory
Quest Property SQ_GravitationalTraits Auto Const mandatory
mq401questscript:playerknowledgestruct[] Property PlayerKnowledgeArray Auto Const

;-- Functions ---------------------------------------

Function LoadPlayerKnowledge()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:46
  Int currentElement = 0 ; #DEBUG_LINE_NO:48
  While currentElement < PlayerKnowledgeArray.Length ; #DEBUG_LINE_NO:49
    Float CurrentPlayerKnowledgeAVFloat = PlayerREF.GetValue(PlayerKnowledgeArray[currentElement].PlayerKnowledgeAV) ; #DEBUG_LINE_NO:50
    GlobalVariable CurrentPlayerKnowledgeGlobal = PlayerKnowledgeArray[currentElement].PlayerKnowledgeGlobal ; #DEBUG_LINE_NO:51
    CurrentPlayerKnowledgeGlobal.SetValue(CurrentPlayerKnowledgeAVFloat) ; #DEBUG_LINE_NO:53
    currentElement += 1 ; #DEBUG_LINE_NO:55
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  MQ401_AlwaysOn.Start() ; #DEBUG_LINE_NO:61
  Self.LoadPlayerKnowledge() ; #DEBUG_LINE_NO:64
  SQ_GravitationalTraits.Stop() ; #DEBUG_LINE_NO:67
  SQ_GravitationalTraits.Start() ; #DEBUG_LINE_NO:68
  Int iVariantPercentChance = MQ401_VariantChance.GetValueInt() ; #DEBUG_LINE_NO:72
  Int iVariantChanceRoll = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:73
  If Game.GetPlayer().GetValue(PlayerUnityTimesEntered) >= 2.0 && iVariantChanceRoll <= iVariantPercentChance ; #DEBUG_LINE_NO:74
    Int iTotalVariants = MQ401VariantsArray.Length - 1 ; #DEBUG_LINE_NO:75
    Int iVariantNumberRoll = MQ401_ForceVariant.GetValueInt() ; #DEBUG_LINE_NO:76
    If iVariantNumberRoll == -1 ; #DEBUG_LINE_NO:77
      iVariantNumberRoll = Utility.RandomInt(0, iTotalVariants) ; #DEBUG_LINE_NO:78
    EndIf ; #DEBUG_LINE_NO:
    MQ401_VariantCurrent.SetValueInt(iVariantNumberRoll) ; #DEBUG_LINE_NO:80
    MQ401VariantsArray[iVariantNumberRoll].Start() ; #DEBUG_LINE_NO:81
  Else ; #DEBUG_LINE_NO:
    Self.NormalStart() ; #DEBUG_LINE_NO:83
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CleanUpNormalMainQuest()
  MQ101.Stop() ; #DEBUG_LINE_NO:90
  VecteraExteriorNPCEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:93
  VecteraInteriorNPCEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:94
  Heller.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:95
  Lin.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:96
  OroraSabine.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:97
  Vasco.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:100
  SarahMorgan.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:101
  WalterStroud.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:102
  MatteoKhatri.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:103
  Noel.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:104
  VladimirSall.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:105
  SamCoe.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:106
  CoraCoe.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:107
  Andreja.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:108
  Barrett.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:109
  MQ402.Start() ; #DEBUG_LINE_NO:111
  Self.Stop() ; #DEBUG_LINE_NO:113
EndFunction

Function NormalStart()
  MQ101.SetStage(280) ; #DEBUG_LINE_NO:118
  MQ101.SetStage(310) ; #DEBUG_LINE_NO:119
  MQ101.SetStage(1310) ; #DEBUG_LINE_NO:120
  MQ101.SetStage(1635) ; #DEBUG_LINE_NO:121
  MQ402.Start() ; #DEBUG_LINE_NO:122
  Actor VascoREF = Vasco.GetActorRef() ; #DEBUG_LINE_NO:125
  VascoREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:126
  VascoREF.moveto(MQ101_VascoMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:127
  Armillary.GetRef().Enable(False) ; #DEBUG_LINE_NO:130
EndFunction

Function MQ401DisablePlayerControls()
  MQ401EnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:134
  MQ401EnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:135
EndFunction

Function MQ401EnablePlayerControls()
  MQ401EnableLayer = None ; #DEBUG_LINE_NO:139
EndFunction
