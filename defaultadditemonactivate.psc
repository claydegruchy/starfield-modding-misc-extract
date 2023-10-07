ScriptName DefaultAddItemOnActivate Extends ObjectReference
{ Give the player an item when they activate this reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Form Property ItemToGive Auto Const
{ The Item to give to the player when this references is activated. }
Int Property NumberToGiveMin = 1 Auto Const
{ How many of the item are given?  If always the same, Min and Max should be equal.  Otherwise it's a random value between min/max }
Int Property NumberToGiveMax = 1 Auto Const
{ If Greater than the Min, the number given will be randomized between that value and this one. }
Bool Property DisableWhenDone = False Auto Const
{ Should this object disable when clicked?  False by default. }

;-- State -------------------------------------------
State Done

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnActivate(ObjectReference akActionRef)
    Int iNumberToGive = 0 ; #DEBUG_LINE_NO:17
    If NumberToGiveMin >= NumberToGiveMax ; #DEBUG_LINE_NO:18
      iNumberToGive = NumberToGiveMin ; #DEBUG_LINE_NO:20
    Else ; #DEBUG_LINE_NO:
      iNumberToGive = Utility.randomInt(NumberToGiveMin, NumberToGiveMax) ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
    akActionRef.AddItem(ItemToGive, iNumberToGive, False) ; #DEBUG_LINE_NO:25
    If DisableWhenDone ; #DEBUG_LINE_NO:26
      Self.disable(False) ; #DEBUG_LINE_NO:28
    Else ; #DEBUG_LINE_NO:
      Self.GoToState("Done") ; #DEBUG_LINE_NO:31
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
