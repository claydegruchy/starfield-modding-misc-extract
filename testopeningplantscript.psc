ScriptName TestOpeningPlantScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory
Keyword Property LinkCustom03 Auto Const mandatory
Keyword Property LinkCustom04 Auto Const mandatory
Explosion Property PlantOpenExplosion Auto Const mandatory
Explosion Property PlantClosedExplosion Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.GetLinkedRef(LinkCustom01).SetScale(2.0) ; #DEBUG_LINE_NO:13
  Self.GetLinkedRef(LinkCustom02).SetScale(2.0) ; #DEBUG_LINE_NO:14
  Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, Self.GetLinkedRef(LinkCustom01) as ScriptObject, 4.0, 0) ; #DEBUG_LINE_NO:15
  Self.RegisterForHitEvent(Self.GetLinkedRef(LinkCustom04) as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:16
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.PlantOpen() ; #DEBUG_LINE_NO:20
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If akTarget == Self.GetLinkedRef(LinkCustom04) ; #DEBUG_LINE_NO:24
    If Self.GetLinkedRef(LinkCustom01).GetScale() < 1.0 ; #DEBUG_LINE_NO:25
      Self.GetLinkedRef(LinkCustom01).PlaceAtMe(PlantOpenExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:27
    ElseIf Self.GetLinkedRef(LinkCustom01).GetScale() > 1.0 ; #DEBUG_LINE_NO:28
      Self.GetLinkedRef(LinkCustom01).PlaceAtMe(PlantClosedExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:30
    EndIf ; #DEBUG_LINE_NO:
    Self.GetLinkedRef(LinkCustom01).Disable(False) ; #DEBUG_LINE_NO:32
    Self.GetLinkedRef(LinkCustom02).Disable(False) ; #DEBUG_LINE_NO:33
    Self.GetLinkedRef(LinkCustom03).Disable(False) ; #DEBUG_LINE_NO:34
    Self.GetLinkedRef(LinkCustom04).Disable(False) ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function PlantOpen()
  Self.GetLinkedRef(LinkCustom01).Disable(False) ; #DEBUG_LINE_NO:41
  Self.GetLinkedRef(LinkCustom02).Enable(False) ; #DEBUG_LINE_NO:42
  Self.GetLinkedRef(LinkCustom02).PlaceAtMe(PlantOpenExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:43
  Self.GetLinkedRef(LinkCustom03).Enable(False) ; #DEBUG_LINE_NO:44
  Self.GetLinkedRef(LinkCustom01).SetScale(0.300000012) ; #DEBUG_LINE_NO:45
  Utility.Wait(4.0) ; #DEBUG_LINE_NO:46
  Self.PlantShrink() ; #DEBUG_LINE_NO:47
EndFunction

Function PlantShrink()
  Self.GetLinkedRef(LinkCustom01).Enable(False) ; #DEBUG_LINE_NO:52
  Self.RegisterForHitEvent(Self.GetLinkedRef(LinkCustom01) as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:53
  ObjectReference myPlant = Self.GetLinkedRef(LinkCustom02) ; #DEBUG_LINE_NO:54
  Float fCurrentScale = myPlant.GetScale() ; #DEBUG_LINE_NO:55
  Int count = 0 ; #DEBUG_LINE_NO:56
  While fCurrentScale > 0.300000012 ; #DEBUG_LINE_NO:57
    myPlant.SetScale(fCurrentScale - 0.02) ; #DEBUG_LINE_NO:58
    fCurrentScale -= 0.02 ; #DEBUG_LINE_NO:59
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:60
    count += 1 ; #DEBUG_LINE_NO:61
  EndWhile ; #DEBUG_LINE_NO:
  Self.GetLinkedRef(LinkCustom02).Disable(False) ; #DEBUG_LINE_NO:63
  Self.GetLinkedRef(LinkCustom03).Disable(False) ; #DEBUG_LINE_NO:64
  Self.GetLinkedRef(LinkCustom02).SetScale(2.0) ; #DEBUG_LINE_NO:65
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:66
  Self.PlantGrow() ; #DEBUG_LINE_NO:67
EndFunction

Function PlantGrow()
  ObjectReference myPlant = Self.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:73
  Float fCurrentScale = myPlant.GetScale() ; #DEBUG_LINE_NO:74
  Int count = 0 ; #DEBUG_LINE_NO:75
  While fCurrentScale < 2.0 ; #DEBUG_LINE_NO:76
    myPlant.SetScale(fCurrentScale + 0.02) ; #DEBUG_LINE_NO:77
    fCurrentScale += 0.02 ; #DEBUG_LINE_NO:78
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:79
    count += 1 ; #DEBUG_LINE_NO:80
  EndWhile ; #DEBUG_LINE_NO:
  Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, Self.GetLinkedRef(LinkCustom01) as ScriptObject, 2.0, 0) ; #DEBUG_LINE_NO:82
EndFunction
