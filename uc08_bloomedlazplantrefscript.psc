ScriptName UC08_BloomedLazPlantRefScript Extends ObjectReference Const
{ Fail safe script to keep the Lazarus Plants turned off if the cell resets before they're disabled }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC08 Auto Const mandatory
{ Quest used to manage anim stage of this object }
Int Property AnimStage = 413 Auto Const
{ Once this stage is set on UC08, the plant stays off }
String Property JumpToOff = "Stage2NoTransition" Auto Const
{ The "jump to off" anim call for this object }

;-- Functions ---------------------------------------

Event OnLoad()
  If !Self.IsDisabled() && UC08.GetStageDone(AnimStage) ; #DEBUG_LINE_NO:14
    Self.PlayAnimation(JumpToOff) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent
