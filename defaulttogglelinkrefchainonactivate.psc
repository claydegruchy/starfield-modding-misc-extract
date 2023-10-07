ScriptName DefaultToggleLinkRefChainOnActivate Extends ObjectReference default
{ When this reference is activated, all LinkedRefs will toggle between OPEN or CLOSED. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property DoOnce = False Auto Const
  { If you only want this to be activate once set to TRUE.  DEFAULT = FALSE }
  Bool Property CloseOrOpenRef = True Auto Const
  { If you also want this to OPEN/CLOSE all linked refs, set to TRUE.  DEFAULT = TRUE }
  Keyword Property LinkedRefKeyword Auto Const
  { The Keyword of the LinkedRef you want to activate when this activated. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log. }
EndGroup


;-- Functions ---------------------------------------

Function ToggleLinkedRefChain(ObjectReference akActionRef, Keyword LinkedRefKeyword)
  Int count = 0 ; #DEBUG_LINE_NO:37
  Int countmax = 0 ; #DEBUG_LINE_NO:38
  If LinkedRefKeyword != None ; #DEBUG_LINE_NO:39
    countmax = Self.CountLinkedRefChain(LinkedRefKeyword, 100) ; #DEBUG_LINE_NO:40
  Else ; #DEBUG_LINE_NO:
    countmax = Self.CountLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
  While count <= countmax ; #DEBUG_LINE_NO:44
    If LinkedRefKeyword != None ; #DEBUG_LINE_NO:45
      count += 1 ; #DEBUG_LINE_NO:46
      Self.CloseOrOpen(count, akActionRef, LinkedRefKeyword) ; #DEBUG_LINE_NO:47
    Else ; #DEBUG_LINE_NO:
      count += 1 ; #DEBUG_LINE_NO:49
      Self.CloseOrOpen(count, akActionRef, None) ; #DEBUG_LINE_NO:50
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function CloseOrOpen(Int count, ObjectReference akActionRef, Keyword LinkedRefKeyword)
  If CloseOrOpenRef ; #DEBUG_LINE_NO:57
    Int openstate = Self.GetNthLinkedRef(count, None).GetOpenState() ; #DEBUG_LINE_NO:58
    If openstate == 1 || openstate == 2 ; #DEBUG_LINE_NO:60
      If LinkedRefKeyword != None ; #DEBUG_LINE_NO:62
        Self.GetNthLinkedRef(count, LinkedRefKeyword).SetOpen(False) ; #DEBUG_LINE_NO:63
      Else ; #DEBUG_LINE_NO:
        Self.GetNthLinkedRef(count, None).SetOpen(False) ; #DEBUG_LINE_NO:65
      EndIf ; #DEBUG_LINE_NO:
    ElseIf openstate == 3 || openstate == 4 ; #DEBUG_LINE_NO:67
      If LinkedRefKeyword != None ; #DEBUG_LINE_NO:69
        Self.GetNthLinkedRef(count, LinkedRefKeyword).SetOpen(True) ; #DEBUG_LINE_NO:70
      Else ; #DEBUG_LINE_NO:
        Self.GetNthLinkedRef(count, None).SetOpen(True) ; #DEBUG_LINE_NO:72
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State PostActivation
EndState

;-- State -------------------------------------------
Auto State PreActivation

  Event OnActivate(ObjectReference akActionRef)
    If LinkedRefKeyword != None ; #DEBUG_LINE_NO:24
      Self.ToggleLinkedRefChain(akActionRef, LinkedRefKeyword) ; #DEBUG_LINE_NO:25
    Else ; #DEBUG_LINE_NO:
      Self.ToggleLinkedRefChain(akActionRef, None) ; #DEBUG_LINE_NO:27
    EndIf ; #DEBUG_LINE_NO:
    If DoOnce ; #DEBUG_LINE_NO:29
      Self.gotoState("PostActivation") ; #DEBUG_LINE_NO:30
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
