ScriptName UC02_FuelTankTriggerCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------
Bool bInCooldown
Int iCooldownTimerID = 1 Const

;-- Properties --------------------------------------
ReferenceAlias Property Terrormorph Auto Const mandatory
{ Ref alias for the Terrormorph }
GlobalVariable Property UC02_PlayerTankDetonationDistance Auto Const mandatory
{ How close the player needs to be to count as "triggering" the tank }
Scene Property UC02_602_DetonatingFuelTank Auto Const mandatory
{ Scene to play when detonating a fuel tank }
Float Property SceneCooldownTimerLength = 3.0 Auto Const
{ How long to wait between scene triggerings }
Int Property ShutdownStage = 700 Auto Const
{ If this stage is set, Terrormorph is dead, so we don't need to }
Int Property BlewAtLeastOneTankStage = 660 Auto Const
{ Stage to set if the player detonated at least one tank }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
  Actor TerrorACT = Terrormorph.GetActorRef() ; #DEBUG_LINE_NO:25
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:26
  If (akActionRef == TerrorACT as ObjectReference) && !TerrorACT.IsDead() && !myQuest.GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:28
    If Game.GetPlayer().GetDistance(akSenderRef) <= UC02_PlayerTankDetonationDistance.GetValue() ; #DEBUG_LINE_NO:31
      ObjectReference LinkedTank = akSenderRef.GetLinkedRef(None) ; #DEBUG_LINE_NO:32
      If LinkedTank ; #DEBUG_LINE_NO:35
        Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:37
        myQuest.SetStage(BlewAtLeastOneTankStage) ; #DEBUG_LINE_NO:38
        If !bInCooldown ; #DEBUG_LINE_NO:40
          bInCooldown = True ; #DEBUG_LINE_NO:42
          UC02_602_DetonatingFuelTank.Start() ; #DEBUG_LINE_NO:43
          Self.StartTimer(SceneCooldownTimerLength, iCooldownTimerID) ; #DEBUG_LINE_NO:44
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iCooldownTimerID ; #DEBUG_LINE_NO:53
    bInCooldown = False ; #DEBUG_LINE_NO:54
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:62
EndFunction
