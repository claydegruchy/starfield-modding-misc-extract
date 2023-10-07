ScriptName TestJeffBScaredycatScript Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference[] LinkedRefs
Bool doOnce = False
ObjectReference myActor
ObjectReference player

;-- Properties --------------------------------------
wwiseevent Property mySoundEvent Auto Const
ImageSpaceModifier Property myImageSpace Auto Const
Keyword Property LinkCustom01 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  myActor = Self.getLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:15
  player = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:16
  LinkedRefs = Self.getLinkedRefChain(LinkCustom01, 100) ; #DEBUG_LINE_NO:17
  Self.RegisterForHitEvent(myActor as ScriptObject, player as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:18
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == player && doOnce == False ; #DEBUG_LINE_NO:24
    doOnce = True ; #DEBUG_LINE_NO:25
    Int instanceID = mySoundEvent.play(Self.getLinkedRef(None), None, None) ; #DEBUG_LINE_NO:26
    myImageSpace.Apply(1.0) ; #DEBUG_LINE_NO:27
    myActor.EnableNoWait(False) ; #DEBUG_LINE_NO:28
    Utility.wait(0.5) ; #DEBUG_LINE_NO:29
    myImageSpace.Remove() ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akTarget == myActor && akAggressor == player ; #DEBUG_LINE_NO:38
    myActor.Disable(False) ; #DEBUG_LINE_NO:39
    Int I = 1 ; #DEBUG_LINE_NO:40
    While I <= LinkedRefs.Length ; #DEBUG_LINE_NO:41
      (LinkedRefs[I] as Actor).SetGhost(True) ; #DEBUG_LINE_NO:42
      LinkedRefs[I].EnableNoWait(False) ; #DEBUG_LINE_NO:43
      I += 1 ; #DEBUG_LINE_NO:44
    EndWhile ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForHitEvent(myActor as ScriptObject, player as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
EndEvent
