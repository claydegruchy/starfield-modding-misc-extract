ScriptName NeonSecurityScannerScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard scanGuard

;-- Properties --------------------------------------
wwiseevent Property AMB_Ext_CityNeon_AuroraScanner_Confirmation Auto Const mandatory
{ sound to play if no aurora detected }
wwiseevent Property AMB_Ext_CityNeon_AuroraScanner_Denial Auto Const mandatory
{ sound to play if aurora detected and guards alarmed }
Faction Property CurrentFollowerFaction Auto Const mandatory
Keyword Property GuardKeyword Auto Const mandatory
{ used to find nearby guards }
Potion Property Drug_Aurora Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Message Property Neon_AuroraSnifferMessage Auto Const mandatory
Float Property maxGuardDistance = 25.0 Auto Const
{ range to search for guards }

;-- Functions ---------------------------------------

Event OnLoad()
  Self.AddInventoryEventFilter(Drug_Aurora as Form) ; #DEBUG_LINE_NO:27
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef is Actor ; #DEBUG_LINE_NO:32
    Self.ScanActor(akActionRef as Actor, True) ; #DEBUG_LINE_NO:33
  ElseIf akActionRef.GetBaseObject() == Drug_Aurora as Form ; #DEBUG_LINE_NO:34
    akActionRef.SetFactionOwner(CrimeFactionNeon, False) ; #DEBUG_LINE_NO:36
    akActionRef.SendStealAlarm(Game.GetPlayer()) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  Guard scanGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:43
    Self.UnregisterForRemoteEvent(akActionRef as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:44
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Function ScanActor(Actor ScanActor, Bool playSound)
  Guard scanGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:52
    If (ScanActor as Bool && Self.IsValidActor(ScanActor)) && Self.IsInTrigger(ScanActor as ObjectReference) ; #DEBUG_LINE_NO:53
      Int auroraCount = ScanActor.GetItemCount(Drug_Aurora as Form) ; #DEBUG_LINE_NO:55
      If auroraCount > 0 ; #DEBUG_LINE_NO:57
        AMB_Ext_CityNeon_AuroraScanner_Denial.PlayandWait(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:58
        ObjectReference[] guards = Self.FindAllReferencesWithKeyword(GuardKeyword as Form, maxGuardDistance) ; #DEBUG_LINE_NO:61
        If guards.Length > 0 ; #DEBUG_LINE_NO:63
          Int I = 0 ; #DEBUG_LINE_NO:65
          Actor guardActor = None ; #DEBUG_LINE_NO:66
          Float currentDistance = maxGuardDistance + 1.0 ; #DEBUG_LINE_NO:67
          While I < guards.Length ; #DEBUG_LINE_NO:68
            Actor testGuard = guards[I] as Actor ; #DEBUG_LINE_NO:69
            Float testDistance = Self.GetDistance(testGuard as ObjectReference) ; #DEBUG_LINE_NO:70
            If (testGuard as Bool && testGuard.IsDead() == False) && testDistance < currentDistance ; #DEBUG_LINE_NO:72
              guardActor = testGuard ; #DEBUG_LINE_NO:73
              currentDistance = testDistance ; #DEBUG_LINE_NO:74
            EndIf ; #DEBUG_LINE_NO:
            I += 1 ; #DEBUG_LINE_NO:77
          EndWhile ; #DEBUG_LINE_NO:
          If guardActor ; #DEBUG_LINE_NO:81
            guardActor.SendSmugglingAlarm(ScanActor) ; #DEBUG_LINE_NO:82
            If Game.GetPlayer().IsInCombat() == False ; #DEBUG_LINE_NO:83
              Neon_AuroraSnifferMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:84
            EndIf ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Self.RegisterForRemoteEvent(ScanActor as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:90
        AMB_Ext_CityNeon_AuroraScanner_Confirmation.PlayandWait(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:92
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == Drug_Aurora as Form ; #DEBUG_LINE_NO:102
    Self.ScanActor(akSource as Actor, False) ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function IsValidActor(Actor ScanActor)
  Return ScanActor.IsInFaction(CurrentFollowerFaction) || ScanActor == Game.GetPlayer() ; #DEBUG_LINE_NO:109
EndFunction
