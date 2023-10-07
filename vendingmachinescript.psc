ScriptName VendingMachineScript Extends ObjectReference
{ Handles Vending Machine activation behavior. }

;-- Variables ---------------------------------------
Int allowedActivations
Int usedActivations

;-- Properties --------------------------------------
Group DefaultProperties
  Int Property minActivations = 4 Auto Const
  { The minimum number of times this vending machine can be activated. }
  Int Property maxActivations = 7 Auto Const
  { The maximum number of times this vending machine can be activated. }
  Float Property doubleVendChance = 1.0 Auto Const
  { The chance (0.0 - 100.0) of the machine giving you an extra item. }
EndGroup

Group RequiredProperties
  LeveledItem Property itemsToVend Auto Const mandatory
  { The list of items to vend. }
  GlobalVariable Property cost Auto Const mandatory
  { The cost to despense an item. The cost is displayed in the Activator's activation display text. }
  wwiseevent Property WwiseEvent_VendingMachineActivate Auto Const mandatory
  { The sound to player when the vending machine successfully dispenses an item. }
  wwiseevent Property WwiseEvent_VendingMachineActivateError Auto Const mandatory
  { The sound to play if the player attempts to activate it after all of its items have been dispensed. }
  Message Property notEnoughCreditsMessage Auto Const mandatory
  { The message notification to display if the player doesn't have enough credits. }
  ActorValue Property VendingMachineResetGameTimeAV Auto Const mandatory
EndGroup

Group OptionalProperties
  LeveledItem Property rareItemsToVend Auto Const
  { An optional set of very rare items to vend. }
  Float Property rareItemChance = 0.0 Auto Const
  { The chance (0.0 - 100.0) of spawning a rare item, if rareItemsToVend is set. }
  Int Property daysUntilReset = 0 Auto Const
  { Optionally specify the days until this machine can begin vending again. By default, it stops vending until the cell is reset. }
EndGroup


;-- Functions ---------------------------------------

Function ResetVendingMachine()
  usedActivations = 0 ; #DEBUG_LINE_NO:52
  allowedActivations = Utility.RandomInt(minActivations, maxActivations) ; #DEBUG_LINE_NO:53
EndFunction

Function TryToVendItem()
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:57
  MiscObject credits = Game.GetCredits() ; #DEBUG_LINE_NO:58
  Int costValue = cost.GetValueInt() ; #DEBUG_LINE_NO:59
  If playerRef.GetItemCount(credits as Form) < costValue ; #DEBUG_LINE_NO:62
    Self.PlayErrorSound() ; #DEBUG_LINE_NO:63
    notEnoughCreditsMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:64
    Return  ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
  playerRef.RemoveItem(credits as Form, costValue, False, None) ; #DEBUG_LINE_NO:69
  usedActivations += 1 ; #DEBUG_LINE_NO:70
  Self.HandleVendingItem() ; #DEBUG_LINE_NO:72
EndFunction

Function HandleVendingItem()
  Self.DispenseItem() ; #DEBUG_LINE_NO:76
  Bool doubleSuccess = Utility.RandomFloat(0.0, 100.0) <= doubleVendChance ; #DEBUG_LINE_NO:79
  If doubleSuccess ; #DEBUG_LINE_NO:80
    Self.DispenseItem() ; #DEBUG_LINE_NO:81
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DispenseItem()
  Self.PlayDispenseSound() ; #DEBUG_LINE_NO:86
  Game.GetPlayer().AddItem(Self.GetItemToVend() as Form, 1, False) ; #DEBUG_LINE_NO:87
EndFunction

LeveledItem Function GetItemToVend()
  If rareItemsToVend as Bool && rareItemChance > 0.0 ; #DEBUG_LINE_NO:91
    Bool rareSuccess = Utility.RandomFloat(0.0, 100.0) <= rareItemChance ; #DEBUG_LINE_NO:94
    If rareSuccess ; #DEBUG_LINE_NO:95
      Return rareItemsToVend ; #DEBUG_LINE_NO:97
    Else ; #DEBUG_LINE_NO:
      Return itemsToVend ; #DEBUG_LINE_NO:100
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Return itemsToVend ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PlayErrorSound()
  Int S = WwiseEvent_VendingMachineActivateError.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:109
EndFunction

Function PlayDispenseSound()
  Bool S = WwiseEvent_VendingMachineActivate.PlayAndWait(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:113
EndFunction

;-- State -------------------------------------------
State Done

  Event OnActivate(ObjectReference akActivator)
    Self.PlayErrorSound() ; #DEBUG_LINE_NO:172
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnLoad()
    Self.ResetVendingMachine() ; #DEBUG_LINE_NO:121
    Self.GoToState("Ready") ; #DEBUG_LINE_NO:122
  EndEvent
EndState

;-- State -------------------------------------------
State Ready

  Event OnActivate(ObjectReference akActivator)
    Self.GoToState("Working") ; #DEBUG_LINE_NO:128
    If akActivator == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:129
      Self.TryToVendItem() ; #DEBUG_LINE_NO:130
    EndIf ; #DEBUG_LINE_NO:
    If usedActivations >= allowedActivations ; #DEBUG_LINE_NO:135
      Self.GoToState("SoldOut") ; #DEBUG_LINE_NO:136
    Else ; #DEBUG_LINE_NO:
      Self.GoToState("Ready") ; #DEBUG_LINE_NO:138
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State SoldOut

  Event OnActivate(ObjectReference akActivator)
    Self.PlayErrorSound() ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    If Utility.GetCurrentGameTime() >= Self.GetValue(VendingMachineResetGameTimeAV) ; #DEBUG_LINE_NO:
      Self.ResetVendingMachine() ; #DEBUG_LINE_NO:
      Self.GoToState("Ready") ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnBeginState(String asOldState)
    If daysUntilReset > 0 ; #DEBUG_LINE_NO:151
      Self.SetValue(VendingMachineResetGameTimeAV, Utility.GetCurrentGameTime() + daysUntilReset as Float) ; #DEBUG_LINE_NO:152
    Else ; #DEBUG_LINE_NO:
      Self.GoToState("Done") ; #DEBUG_LINE_NO:154
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State Working

  Event OnActivate(ObjectReference akActivator)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState
