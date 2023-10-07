ScriptName TerraBrewKioskScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Actor Property Vendor1 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:5
    Vendor1.ShowBarterMenu() ; #DEBUG_LINE_NO:7
  EndIf ; #DEBUG_LINE_NO:
EndEvent
