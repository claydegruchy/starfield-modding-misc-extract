ScriptName TestKurtCreatureRigSwitchScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property TestKurtCreatureRigMessage Auto Const mandatory
{ message box for player choices }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Int messageIndex = TestKurtCreatureRigMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:7
  If messageIndex > -1 ; #DEBUG_LINE_NO:8
    testkurtcreaturebehaviorsswitchscript myBehaviorSwitch = Self.GetLinkedRef(None) as testkurtcreaturebehaviorsswitchscript ; #DEBUG_LINE_NO:9
    If myBehaviorSwitch ; #DEBUG_LINE_NO:10
      myBehaviorSwitch.ChangeRig(messageIndex) ; #DEBUG_LINE_NO:11
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
