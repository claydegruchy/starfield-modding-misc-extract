ScriptName DefaultAliasDisableHavokOnLoad Extends ReferenceAlias default
{ Disable havok on a ref OnLoad(), then optionally enable havok OnHit(), OnActivate(), or OnGrab() }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property HavokOnHit Auto Const
  { Start Havok Sim when hit? DEFAULT: FALSE }
  Bool Property HavokOnActivate Auto Const
  { Start Havok Sim when activated? DEFAULT: FALSE }
  Bool Property HavokOnZKey Auto Const
  { Start Havok Sim when grabbed by player? DEFAULT: FALSE }
  Keyword Property LinkHavokPartner Auto Const
  { Link with this keyword and that ref will also sim with myself }
EndGroup

Bool Property BeenSimmed Auto hidden
{ Prevent an object that has been havok'd in-game from going static }

;-- Functions ---------------------------------------

Event onLoad()
  ObjectReference ref = Self.GetReference() ; #DEBUG_LINE_NO:18
  If BeenSimmed == False && ref.Is3DLoaded() ; #DEBUG_LINE_NO:19
    ref.SetMotionType(ref.Motion_Keyframed, True) ; #DEBUG_LINE_NO:20
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event onUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:26
EndEvent

Event onActivate(ObjectReference triggerRef)
  If HavokOnActivate == True && BeenSimmed == False ; #DEBUG_LINE_NO:30
    Self.ReleaseToHavok() ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event onHit(ObjectReference akTarget, ObjectReference var1, Form var2, Projectile var3, Bool var4, Bool var5, Bool var6, Bool var7, String asMaterialName)
  If HavokOnHit == True && BeenSimmed == False ; #DEBUG_LINE_NO:36
    Self.ReleaseToHavok() ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event onGrab()
  If HavokOnZKey == True && BeenSimmed == False ; #DEBUG_LINE_NO:42
    Self.ReleaseToHavok() ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ReleaseToHavok()
  BeenSimmed = True ; #DEBUG_LINE_NO:48
  ObjectReference ref = Self.GetReference() ; #DEBUG_LINE_NO:49
  ObjectReference myLink = ref.getLinkedRef(LinkHavokPartner) ; #DEBUG_LINE_NO:50
  If myLink != None ; #DEBUG_LINE_NO:51
    defaultdisablehavokonload linkScript = myLink as defaultdisablehavokonload ; #DEBUG_LINE_NO:52
    If linkScript as Bool && linkScript.BeenSimmed == False ; #DEBUG_LINE_NO:53
      linkScript.ReleaseToHavok() ; #DEBUG_LINE_NO:54
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  ref.SetMotionType(ref.Motion_Dynamic, True) ; #DEBUG_LINE_NO:57
  ref.ApplyHavokImpulse(0.0, 0.0, 1.0, 5.0) ; #DEBUG_LINE_NO:58
EndFunction
