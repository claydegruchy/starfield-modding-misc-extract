ScriptName DefaultDisableHavokOnLoad Extends ObjectReference default
{ Disable havok on a ref OnLoad(), then optionally enable havok OnHit(), OnActivate(), or OnGrab() }

;-- Variables ---------------------------------------
Bool bHasChangedContainers

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property HavokOnHit = False Auto Const
  { Start Havok Sim when hit? DEFAULT: False }
  Bool Property HavokOnActivate = False Auto Const
  { Start Havok Sim when activated? DEFAULT: False }
  Bool Property HavokOnZKey = False Auto Const
  { Start Havok Sim when grabbed by player? DEFAULT: False }
  Keyword Property LinkHavokPartner Auto Const
  { Link with this keyword and that ref will also sim with myself }
  Bool Property BeenSimmed = False Auto hidden
  { Prevent an object that has been havok'd in-game from going static }
  Float Property HavokImpulseMagnitude = 0.07 Auto Const
  { havok impulse to apply when released to havok sim }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = False, Set to True if you want the traces in this script to show up in the log. }
EndGroup


;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  bHasChangedContainers = True ; #DEBUG_LINE_NO:26
  BeenSimmed = True ; #DEBUG_LINE_NO:27
EndEvent

Event onLoad()
  If !HavokOnHit && !HavokOnActivate && !HavokOnZKey && !LinkHavokPartner ; #DEBUG_LINE_NO:31
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If BeenSimmed == False && Self.Is3DLoaded() ; #DEBUG_LINE_NO:36
    Self.setMotionType(Self.Motion_Keyframed, True) ; #DEBUG_LINE_NO:37
    If !bHasChangedContainers ; #DEBUG_LINE_NO:38
      Self.MoveToMyEditorLocation() ; #DEBUG_LINE_NO:39
    EndIf ; #DEBUG_LINE_NO:
    If HavokOnHit ; #DEBUG_LINE_NO:41
      Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:42
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event onUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:48
EndEvent

Event onActivate(ObjectReference triggerRef)
  If HavokOnActivate == True && BeenSimmed == False ; #DEBUG_LINE_NO:53
    Self.ReleaseToHavok() ; #DEBUG_LINE_NO:54
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event onHit(ObjectReference akTarget, ObjectReference var1, Form var2, Projectile var3, Bool var4, Bool var5, Bool var6, Bool var7, String asMaterialName)
  If HavokOnHit == True && BeenSimmed == False ; #DEBUG_LINE_NO:60
    Self.ReleaseToHavok() ; #DEBUG_LINE_NO:61
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event onGrab()
  If HavokOnZKey == True && BeenSimmed == False ; #DEBUG_LINE_NO:67
    Self.ReleaseToHavok() ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ReleaseToHavok()
  BeenSimmed = True ; #DEBUG_LINE_NO:74
  ObjectReference myLink = Self.getLinkedRef(LinkHavokPartner) ; #DEBUG_LINE_NO:75
  If myLink != None ; #DEBUG_LINE_NO:76
    DefaultDisableHavokOnLoad linkScript = myLink as DefaultDisableHavokOnLoad ; #DEBUG_LINE_NO:77
    If linkScript as Bool && linkScript.BeenSimmed == False ; #DEBUG_LINE_NO:78
      linkScript.ReleaseToHavok() ; #DEBUG_LINE_NO:79
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.setMotionType(Self.Motion_Dynamic, True) ; #DEBUG_LINE_NO:82
  Self.ApplyHavokImpulse(0.0, 0.0, 1.0, HavokImpulseMagnitude) ; #DEBUG_LINE_NO:83
EndFunction
