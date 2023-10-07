ScriptName StarterHomeDoorScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Bool bDoorOpen = True
Float fPaymentTimestamp = -7.0

;-- Properties --------------------------------------
Message Property TraitStarterHome_DoorMortgageMessage Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If !bDoorOpen ; #DEBUG_LINE_NO:8
    Int messageIndex = TraitStarterHome_DoorMortgageMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:9
    If messageIndex > -1 ; #DEBUG_LINE_NO:10
      If messageIndex == 0 ; #DEBUG_LINE_NO:11
        Game.GetPlayer().RemoveItem(Credits as Form, 500, False, None) ; #DEBUG_LINE_NO:12
        fPaymentTimestamp = Utility.GetCurrentGameTime() + 7.0 ; #DEBUG_LINE_NO:13
        bDoorOpen = True ; #DEBUG_LINE_NO:14
        Self.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:15
      ElseIf messageIndex == 1 ; #DEBUG_LINE_NO:16
        Self.GetOwningQuest().SetStage(200) ; #DEBUG_LINE_NO:17
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  If !Self.GetOwningQuest().GetStageDone(400) ; #DEBUG_LINE_NO:28
    Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:29
    If currentGameTime >= fPaymentTimestamp ; #DEBUG_LINE_NO:30
      bDoorOpen = False ; #DEBUG_LINE_NO:31
      Self.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:32
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    bDoorOpen = True ; #DEBUG_LINE_NO:36
    Self.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:37
    Self.GetOwningQuest().SetStage(9000) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetOwningQuest().GetStageDone(500) ; #DEBUG_LINE_NO:42
    Self.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndEvent
