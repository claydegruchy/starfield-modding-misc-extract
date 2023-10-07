ScriptName TraitStarterHomeDoorsScript Extends RefCollectionAlias
{ handle player access to the Starter Home }

;-- Variables ---------------------------------------
Bool bDoorOpen = True
Float fPaymentTimestamp = -7.0

;-- Properties --------------------------------------
Message Property TraitStarterHome_DoorMortgageMessage Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Int Property MortgageObjectiveStage = 200 Auto Const
Int Property PaidOffMortgageStage = 400 Auto Const
Int Property EndQuestStage = 9000 Auto Const
Int Property ForeclosedStage = 500 Auto Const
Int Property MortgageDueDays = 7 Auto Const
{ how often (in days) is the mortgage due? }
GlobalVariable Property Trait_StarterHome_Interest Auto Const
{ how much does the mortage cost }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSource, ObjectReference akActionRef)
  If !bDoorOpen ; #DEBUG_LINE_NO:27
    Int messageIndex = TraitStarterHome_DoorMortgageMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:28
    If messageIndex > -1 ; #DEBUG_LINE_NO:29
      If messageIndex == 0 ; #DEBUG_LINE_NO:30
        Game.GetPlayer().RemoveItem(Credits as Form, Trait_StarterHome_Interest.GetValueInt(), False, None) ; #DEBUG_LINE_NO:31
        fPaymentTimestamp = Utility.GetCurrentGameTime() + MortgageDueDays as Float ; #DEBUG_LINE_NO:32
        bDoorOpen = True ; #DEBUG_LINE_NO:33
        Self.Lock(False, False, True) ; #DEBUG_LINE_NO:35
        Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:36
      ElseIf messageIndex == 1 ; #DEBUG_LINE_NO:37
        Self.GetOwningQuest().SetStage(MortgageObjectiveStage) ; #DEBUG_LINE_NO:38
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad(ObjectReference akSource)
  If akSource == Self.GetAt(0) ; #DEBUG_LINE_NO:46
    If Self.GetOwningQuest().GetStageDone(ForeclosedStage) ; #DEBUG_LINE_NO:50
      Self.Lock(True, False, True) ; #DEBUG_LINE_NO:51
      Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:52
    ElseIf !Self.GetOwningQuest().GetStageDone(PaidOffMortgageStage) ; #DEBUG_LINE_NO:55
      Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:56
      If currentGameTime >= fPaymentTimestamp ; #DEBUG_LINE_NO:57
        bDoorOpen = False ; #DEBUG_LINE_NO:58
        Self.Lock(True, False, True) ; #DEBUG_LINE_NO:59
        Self.BlockActivation(True, False) ; #DEBUG_LINE_NO:60
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      bDoorOpen = True ; #DEBUG_LINE_NO:64
      Self.Lock(False, False, True) ; #DEBUG_LINE_NO:65
      Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:66
      Self.GetOwningQuest().SetStage(EndQuestStage) ; #DEBUG_LINE_NO:67
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
