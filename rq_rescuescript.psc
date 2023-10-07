ScriptName RQ_RescueScript Extends RQ_TransportPersonScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Rescue_Aliases
  ReferenceAlias Property Alias_Door Auto Const mandatory
  { autofill }
  ReferenceAlias Property Alias_Victim Auto Const mandatory
  { autofill }
  RefCollectionAlias Property Alias_Actors Auto Const mandatory
  { autofill }
  RefCollectionAlias Property Alias_Passengers Auto Const mandatory
  { autofill }
  ReferenceAlias Property Alias_CaptiveTarget Auto Const mandatory
  { autofill }
  ReferenceAlias Property Alias_CaptiveMarker Auto Const mandatory
  { autofill }
  ReferenceAlias Property Alias_BossContainer Auto Const mandatory
  { autofill }
  ReferenceAlias Property Alias_BonusContainer Auto Const mandatory
  { autofill }
  ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const mandatory
  Int Property AllPassengersDisembarkStage = 500 Auto Const
  { this stage is set by passenger script when all passengers disembark OR unload }
EndGroup

Group Rescue_Scenes
  Scene Property CaptiveRescuedScene Auto Const mandatory
  { Scene to start when captive is rescued }
EndGroup

Group Rescue_PassengerHandling
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  { autofill }
EndGroup


;-- Functions ---------------------------------------

Function InitializeNPCs()
  ObjectReference CaptiveMarker = Alias_CaptiveMarker.GetRef() ; #DEBUG_LINE_NO:52
  ObjectReference DungeonMarker = Alias_BossContainer.GetRef() ; #DEBUG_LINE_NO:53
  Actor CaptiveNPC = Alias_CaptiveTarget.GetActorRef() ; #DEBUG_LINE_NO:54
  If CaptiveMarker ; #DEBUG_LINE_NO:56
    CaptiveNPC.MoveTo(CaptiveMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:57
  ElseIf DungeonMarker ; #DEBUG_LINE_NO:
    CaptiveNPC.MoveTo(DungeonMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
  CaptiveNPC.Enable(False) ; #DEBUG_LINE_NO:62
  CaptiveNPC.EvaluatePackage(False) ; #DEBUG_LINE_NO:63
  CaptiveNPC.SetValue(SQ_CaptiveStateNoBlockingHellos, 1.0) ; #DEBUG_LINE_NO:66
  Alias_BonusContainer.TryToEnable() ; #DEBUG_LINE_NO:68
  Parent.InitializeNPCs() ; #DEBUG_LINE_NO:70
EndFunction

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == AllPassengersDisembarkStage ; #DEBUG_LINE_NO:74
    Int I = 0 ; #DEBUG_LINE_NO:76
    While I < Alias_Actors.GetCount() ; #DEBUG_LINE_NO:77
      ObjectReference theActor = Alias_Actors.GetAt(I) ; #DEBUG_LINE_NO:78
      If theActor.Is3DLoaded() == False ; #DEBUG_LINE_NO:79
        theActor.DisableNoWait(False) ; #DEBUG_LINE_NO:80
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:82
    EndWhile ; #DEBUG_LINE_NO:
    ObjectReference victimRef = Alias_Victim.GetRef() ; #DEBUG_LINE_NO:84
    If victimRef.Is3DLoaded() == False ; #DEBUG_LINE_NO:85
      victimRef.DisableNoWait(False) ; #DEBUG_LINE_NO:86
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
