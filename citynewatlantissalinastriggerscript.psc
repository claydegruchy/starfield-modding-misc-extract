ScriptName CityNewAtlantisSalinasTriggerScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC_NA_SalinasVendorActive Auto Const
GlobalVariable Property UC_NA_SalinasVendorTimer Auto Const
GlobalVariable Property GameDaysPassed Auto Const

;-- Functions ---------------------------------------

Event OnTriggerLeave(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:13
    If UC_NA_SalinasVendorActive.GetValue() == 1.0 ; #DEBUG_LINE_NO:14
      UC_NA_SalinasVendorActive.SetValue(0.0) ; #DEBUG_LINE_NO:15
      UC_NA_SalinasVendorTimer.SetValue(GameDaysPassed.GetValue() + 0.200000003) ; #DEBUG_LINE_NO:16
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
