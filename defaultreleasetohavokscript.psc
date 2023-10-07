ScriptName DefaultReleaseToHavokScript Extends ObjectReference default
{ Releases an object to Havok OnHit or OnActivate. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Properties
  Bool Property HavokOnHit = True Auto Const
  { Default: TRUE. Should we release the object to Havok when it's hit? }
  Bool Property HavokOnActivate = True Auto Const
  { Default: TRUE. Should we release the object to Havok when it's activated? }
  Bool Property ReleaseAllLinkedHavokPartners = True Auto Const
  { Default: TRUE.
	 If True, release all objects linked to or from this object with LinkHavokPartner to Havok. Assumes this object is part of a simple chain; branching is NOT supported.
	 If False, release only objects linked from this object with LinkHavokPartner to Havok. }
  Keyword Property LinkHavokPartner Auto Const
  { The chain of objects linked with this keyword will be released to Havok when this object is released. }
EndGroup


;-- Functions ---------------------------------------

Function ReleaseToHavok()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State Released
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference triggerRef)
    If HavokOnActivate ; #DEBUG_LINE_NO:
      Self.ReleaseToHavok() ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
    If HavokOnHit ; #DEBUG_LINE_NO:
      Self.ReleaseToHavok() ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Function ReleaseToHavok()
    Self.GoToState("Released") ; #DEBUG_LINE_NO:
    ObjectReference current = Self as ObjectReference ; #DEBUG_LINE_NO:
    If ReleaseAllLinkedHavokPartners ; #DEBUG_LINE_NO:
      ObjectReference[] currentLinkChain = new ObjectReference[1] ; #DEBUG_LINE_NO:
      currentLinkChain[0] = current ; #DEBUG_LINE_NO:
      ObjectReference[] currentParents = Self.GetRefsLinkedToMe(LinkHavokPartner, None) ; #DEBUG_LINE_NO:
      While currentParents.Length > 0 && currentLinkChain.find(currentParents[0], 0) < 0 ; #DEBUG_LINE_NO:
        current = currentParents[0] ; #DEBUG_LINE_NO:
        currentLinkChain.add(current, 1) ; #DEBUG_LINE_NO:
        currentParents = current.GetRefsLinkedToMe(LinkHavokPartner, None) ; #DEBUG_LINE_NO:
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    current.SetMotionType(Self.Motion_Dynamic, True) ; #DEBUG_LINE_NO:
    ObjectReference[] myLinkChain = current.GetLinkedRefChain(LinkHavokPartner, 100) ; #DEBUG_LINE_NO:
    Int I = 0 ; #DEBUG_LINE_NO:
    While I < myLinkChain.Length ; #DEBUG_LINE_NO:
      current = (myLinkChain[I] as DefaultReleaseToHavokScript) as ObjectReference ; #DEBUG_LINE_NO:
      If current != None ; #DEBUG_LINE_NO:
        current.SetMotionType(Self.Motion_Dynamic, True) ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
  EndFunction

  Event OnLoad()
    If HavokOnHit ; #DEBUG_LINE_NO:23
      Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:24
    ElseIf !HavokOnActivate ; #DEBUG_LINE_NO:25
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
