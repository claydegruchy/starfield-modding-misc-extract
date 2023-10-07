ScriptName DefaultCounter Extends objectReference default
{ A simple counter. Place on an object, then increment with another script (such as defaultCounterIncrementOnDeath). When the target value is reached (or, optionally, exceeded), the counter:
 - Activates itself.
 - Optionally, sets a quest stage.
 - Optionally, performs a specified action on a specified linkedref. }

;-- Variables ---------------------------------------
Int count
Bool hasHitThreshold

;-- Properties --------------------------------------
Group Required_Properties
  Int Property TargetValue Auto Const mandatory
  { The first value at which the counter will trigger. }
EndGroup

Group Optional_Properties
  Quest Property QuestToSet Auto Const
  { Quest containing the Stage to set }
  Int Property StageToSet = -1 Auto Const
  { Stage to Set }
  Keyword Property LinkedRefKeyword Auto Const
  { The keyword for the LinkedRef to perform the action on. Defaults to the unnamed linkedref. }
  Int Property LinkedRefAction Auto Const
  { Determines what action to perform on the object's linkedref.
	0: Activate (default)
	1: Toggle Enable/Disable
	2: Enable Only
	3: Disable Only }
  Bool Property AllowDecrementing Auto Const
  { (Default: false) If true, we Decrementing via calls to "Decrement()", undoing the specified action (where possible) if the value falls below the target. }
EndGroup


;-- Functions ---------------------------------------

Function Increment()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Decrement()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
Auto State AllowCounting

  Function Decrement()
    If AllowDecrementing ; #DEBUG_LINE_NO:
      count -= 1 ; #DEBUG_LINE_NO:
      If count <= 0 ; #DEBUG_LINE_NO:
        count = 0 ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If count < TargetValue && hasHitThreshold ; #DEBUG_LINE_NO:
        hasHitThreshold = False ; #DEBUG_LINE_NO:
        Self.Activate(Self as ObjectReference, False) ; #DEBUG_LINE_NO:
        If LinkedRefAction == 0 ; #DEBUG_LINE_NO:
          Self.GetLinkedRef(LinkedRefKeyword).Activate(Self as ObjectReference, False) ; #DEBUG_LINE_NO:
        ElseIf LinkedRefAction == 1 ; #DEBUG_LINE_NO:
          If Self.GetLinkedRef(LinkedRefKeyword).IsDisabled() ; #DEBUG_LINE_NO:
            Self.GetLinkedRef(LinkedRefKeyword).Enable(False) ; #DEBUG_LINE_NO:
          Else ; #DEBUG_LINE_NO:
            Self.GetLinkedRef(LinkedRefKeyword).Disable(False) ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
        ElseIf LinkedRefAction == 2 ; #DEBUG_LINE_NO:
          Self.GetLinkedRef(LinkedRefKeyword).Disable(False) ; #DEBUG_LINE_NO:
        ElseIf LinkedRefAction == 3 ; #DEBUG_LINE_NO:
          Self.GetLinkedRef(LinkedRefKeyword).Enable(False) ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndFunction

  Function Increment()
    count += 1 ; #DEBUG_LINE_NO:40
    If count >= TargetValue ; #DEBUG_LINE_NO:43
      hasHitThreshold = True ; #DEBUG_LINE_NO:44
      If !AllowDecrementing ; #DEBUG_LINE_NO:45
        Self.GoToState("StopCounting") ; #DEBUG_LINE_NO:46
      EndIf ; #DEBUG_LINE_NO:
      Self.Activate(Self as ObjectReference, False) ; #DEBUG_LINE_NO:50
      If QuestToSet != None ; #DEBUG_LINE_NO:51
        QuestToSet.SetStage(StageToSet) ; #DEBUG_LINE_NO:52
      EndIf ; #DEBUG_LINE_NO:
      If LinkedRefAction == 0 ; #DEBUG_LINE_NO:54
        Self.GetLinkedRef(LinkedRefKeyword).Activate(Self as ObjectReference, False) ; #DEBUG_LINE_NO:56
      ElseIf LinkedRefAction == 1 ; #DEBUG_LINE_NO:57
        If Self.GetLinkedRef(LinkedRefKeyword).IsDisabled() ; #DEBUG_LINE_NO:59
          Self.GetLinkedRef(LinkedRefKeyword).Enable(False) ; #DEBUG_LINE_NO:60
        Else ; #DEBUG_LINE_NO:
          Self.GetLinkedRef(LinkedRefKeyword).Disable(False) ; #DEBUG_LINE_NO:62
        EndIf ; #DEBUG_LINE_NO:
      ElseIf LinkedRefAction == 2 ; #DEBUG_LINE_NO:64
        Self.GetLinkedRef(LinkedRefKeyword).Enable(False) ; #DEBUG_LINE_NO:66
      ElseIf LinkedRefAction == 3 ; #DEBUG_LINE_NO:67
        Self.GetLinkedRef(LinkedRefKeyword).Disable(False) ; #DEBUG_LINE_NO:69
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndFunction
EndState

;-- State -------------------------------------------
State StopCounting
EndState
