ScriptName FFNewHomesteadR04QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct IceSetupDatum
  ReferenceAlias IceAlias
  { The Ice Alias }
  ReferenceAlias TurbineAlias
  { The Turbine Alias }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
LocationAlias Property NewHomestead Auto Const mandatory
ReferenceAlias[] Property AllIceRefs Auto Const mandatory
ActorValue Property ProduceUses Auto Const mandatory
Int Property ReturnStage = 300 Auto Const
Int Property CooldownTimerFinishedStage = 9999 Auto Const
Int Property ShutdownQuestStage = 10000 Auto Const
Int Property ObjectiveToUpdate = 200 Auto Const
Int Property IceCleared = 0 Auto
Int Property IceTotal Auto
Float Property CooldownTimerDays = 3.0 Auto Const
GlobalVariable Property FFNewHomesteadR04_CooldownTime Auto Const mandatory
GlobalVariable Property FFNewHomesteadR04_IceCleared Auto Const mandatory
Quest Property FFNewHomesteadR04Misc Auto Const mandatory
ffnewhomesteadr04questscript:icesetupdatum[] Property IceSetupData Auto Const
{ array of data for ice/turbines }

;-- Functions ---------------------------------------

Function RegisterIce()
  FFNewHomesteadR04_IceCleared.SetValue(0.0) ; #DEBUG_LINE_NO:34
  Self.ModObjectiveGlobal(0.0, FFNewHomesteadR04_IceCleared, ObjectiveToUpdate, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:35
  Int I = 0 ; #DEBUG_LINE_NO:37
  Int iCount = IceSetupData.Length ; #DEBUG_LINE_NO:38
  IceTotal = iCount ; #DEBUG_LINE_NO:39
  While I < iCount ; #DEBUG_LINE_NO:41
    ObjectReference myIce = IceSetupData[I].IceAlias.GetRef() ; #DEBUG_LINE_NO:42
    ObjectReference myTurbine = IceSetupData[I].TurbineAlias.GetRef() ; #DEBUG_LINE_NO:43
    If myTurbine != None ; #DEBUG_LINE_NO:44
      myIce.SetLinkedRef(myTurbine, LinkCustom01, True) ; #DEBUG_LINE_NO:45
    EndIf ; #DEBUG_LINE_NO:
    Self.RegisterForActorValueLessThanEvent(myIce, ProduceUses, 1.0) ; #DEBUG_LINE_NO:49
    If myIce.GetValue(ProduceUses) < 1.0 ; #DEBUG_LINE_NO:50
      Self.IceIsCleared(myIce, ProduceUses) ; #DEBUG_LINE_NO:51
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:55
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetCooldown()
  Float CooldownTimerLengthHours = 24.0 * CooldownTimerDays ; #DEBUG_LINE_NO:63
  Self.StartTimerGameTime(CooldownTimerLengthHours, 0) ; #DEBUG_LINE_NO:64
EndFunction

Function IceIsCleared(ObjectReference akObjRef, ActorValue akActorValue)
  ObjectReference myLinkedTurbine = akObjRef.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:72
  If myLinkedTurbine != None ; #DEBUG_LINE_NO:73
    myLinkedTurbine.PlayAnimation("Play01") ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
  akObjRef.Disable(False) ; #DEBUG_LINE_NO:76
  IceCleared += 1 ; #DEBUG_LINE_NO:77
  Self.ModObjectiveGlobal(1.0, FFNewHomesteadR04_IceCleared, ObjectiveToUpdate, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:78
  If IceCleared >= IceTotal ; #DEBUG_LINE_NO:79
    Self.SetStage(ReturnStage) ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  (FFNewHomesteadR04Misc as ffnewhomesteadr04miscquestscript).ChangeMiscBool() ; #DEBUG_LINE_NO:87
  Self.RegisterIce() ; #DEBUG_LINE_NO:88
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.IceIsCleared(akObjRef, akActorValue) ; #DEBUG_LINE_NO:93
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  Self.SetStage(CooldownTimerFinishedStage) ; #DEBUG_LINE_NO:98
  If Game.GetPlayer().IsInLocation(NewHomestead.GetLocation()) ; #DEBUG_LINE_NO:101
    Self.SetStage(ShutdownQuestStage) ; #DEBUG_LINE_NO:102
  EndIf ; #DEBUG_LINE_NO:
EndEvent
