ScriptName TempRandomEnableScript Extends ObjectReference Const
{ until we have this hooked up in code on LChars }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property MinToEnable = 0 Auto Const
{ always enable at least this many }

;-- Functions ---------------------------------------

Event OnInit()
  ObjectReference[] myChildren = Self.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:8
  Int roll = Math.Max(MinToEnable as Float, Utility.RandomInt(0, myChildren.Length) as Float) as Int ; #DEBUG_LINE_NO:9
  Int I = 0 ; #DEBUG_LINE_NO:10
  While I < roll ; #DEBUG_LINE_NO:12
    ObjectReference theChild = myChildren[I] ; #DEBUG_LINE_NO:13
    theChild.Enable(False) ; #DEBUG_LINE_NO:15
    I += 1 ; #DEBUG_LINE_NO:16
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
