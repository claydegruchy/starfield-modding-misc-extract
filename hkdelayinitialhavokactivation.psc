ScriptName HKDelayInitialHavokActivation Extends ObjectReference Const
{ Disables havok and then enables again after a delay.  Used for constrained attach refs linked to elevators. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property fHavokDelayTime = 0.5 Auto Const
{ Seconds to wait before starting havok. }

;-- Functions ---------------------------------------

Event onLoad()
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:8
    Self.setMotionType(Self.Motion_Keyframed, True) ; #DEBUG_LINE_NO:9
    Utility.wait(fHavokDelayTime) ; #DEBUG_LINE_NO:10
    Self.setMotionType(Self.Motion_Dynamic, True) ; #DEBUG_LINE_NO:11
    Self.SetPosition(Self.GetPositionX(), Self.GetPositionY(), Self.GetPositionZ()) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndEvent
