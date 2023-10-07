ScriptName FFNewHomesteadR04MiscQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct IceSetupDatum
  ReferenceAlias IceMarkerAlias
  { The Ice Marker Alias }
  ReferenceAlias IceAlias
  { The Ice Alias }
  ReferenceAlias TurbineAlias
  { The Turbine Alias }
EndStruct


;-- Variables ---------------------------------------
Bool bQuestactive = False

;-- Properties --------------------------------------
ActorValue Property ProduceUses Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
ReferenceAlias[] Property AllIceRefs Auto Const mandatory
RefCollectionAlias Property LightEnableMarkers Auto Const mandatory
RefCollectionAlias Property AllTurbines Auto Const mandatory
ffnewhomesteadr04miscquestscript:icesetupdatum[] Property IceSetupData Auto Const
{ array of data for ice/Markers/turbines }

;-- Functions ---------------------------------------

Function RegisterIce()
  Self.ResetTurbines() ; #DEBUG_LINE_NO:30
  Self.SetupBrokenTurbines() ; #DEBUG_LINE_NO:32
  Int I = 0 ; #DEBUG_LINE_NO:34
  Int iCount = AllIceRefs.Length ; #DEBUG_LINE_NO:35
  While I < iCount ; #DEBUG_LINE_NO:37
    ObjectReference myIce = AllIceRefs[I].GetRef() ; #DEBUG_LINE_NO:38
    Self.RegisterForActorValueLessThanEvent(myIce, ProduceUses, 1.0) ; #DEBUG_LINE_NO:40
    If myIce.GetValue(ProduceUses) < 1.0 ; #DEBUG_LINE_NO:41
      Self.IceIsCleared(myIce, ProduceUses) ; #DEBUG_LINE_NO:42
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:44
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ResetTurbines()
  Int I = 0 ; #DEBUG_LINE_NO:50
  Int iCount = AllTurbines.GetCount() ; #DEBUG_LINE_NO:51
  While I < iCount ; #DEBUG_LINE_NO:52
    ObjectReference myTurbine = AllTurbines.GetAt(I) ; #DEBUG_LINE_NO:53
    myTurbine.PlayAnimation("StateB_Idle") ; #DEBUG_LINE_NO:54
    I += 1 ; #DEBUG_LINE_NO:55
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetupBrokenTurbines()
  Int I = 0 ; #DEBUG_LINE_NO:61
  Int iLength = IceSetupData.Length ; #DEBUG_LINE_NO:62
  While I < iLength ; #DEBUG_LINE_NO:63
    ObjectReference myMarker = IceSetupData[I].IceMarkerAlias.GetRef() ; #DEBUG_LINE_NO:64
    ObjectReference myLinkedTurbine = myMarker.GetLinkedRef(None) ; #DEBUG_LINE_NO:66
    If myLinkedTurbine != None ; #DEBUG_LINE_NO:67
      IceSetupData[I].TurbineAlias.ForceRefTo(myLinkedTurbine) ; #DEBUG_LINE_NO:68
      myLinkedTurbine.PlayAnimation("StateC_Play") ; #DEBUG_LINE_NO:69
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:72
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ChangeMiscBool()
  bQuestactive = True ; #DEBUG_LINE_NO:79
EndFunction

Function IceIsCleared(ObjectReference akObjRef, ActorValue akActorValue)
  If bQuestactive == False ; #DEBUG_LINE_NO:85
    ObjectReference myLinkedTurbine = akObjRef.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:87
    If myLinkedTurbine != None ; #DEBUG_LINE_NO:88
      myLinkedTurbine.PlayAnimation("Play01") ; #DEBUG_LINE_NO:89
    EndIf ; #DEBUG_LINE_NO:
    akObjRef.Disable(False) ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  LightEnableMarkers.EnableAll(False) ; #DEBUG_LINE_NO:98
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.IceIsCleared(akObjRef, akActorValue) ; #DEBUG_LINE_NO:103
EndEvent
