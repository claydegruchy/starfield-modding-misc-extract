ScriptName TestSESpaceCell01CrystalScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property InorgUncommonBeryllium Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDestroyed(ObjectReference akDestroyer)
  Int MineralCount = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:6
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().AddItem(InorgUncommonBeryllium as Form, MineralCount, False) ; #DEBUG_LINE_NO:8
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Self.DisableNoWait(False) ; #DEBUG_LINE_NO:13
EndEvent
