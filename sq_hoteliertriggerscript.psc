ScriptName SQ_HotelierTriggerScript Extends ObjectReference Const

;-- Variables ---------------------------------------
Float TimerDur = 3.0 Const

;-- Properties --------------------------------------
sq_hoteliersquestscript Property SQ_Hoteliers Auto Const mandatory
{ autofill }
Keyword Property SQ_Hoteliers_Bed_Link Auto Const mandatory
{ autofill; linkref type that links this room trigger volume to the bed. }
Keyword Property SQ_Hoteliers_Door_Link Auto Const mandatory
{ autofill; linkref type that links this room trigger volume to the door. }
Keyword Property SQ_Hoteliers_Trigger_Link Auto Const mandatory
{ autofill; keyword that links Hotelier NPC to the room trigger. }

;-- Functions ---------------------------------------

Event OnTimer(Int aiTimerID)
  Self._SetDoorState() ; #DEBUG_LINE_NO:18
EndEvent

Event OnLoad()
  Self.Update() ; #DEBUG_LINE_NO:23
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  Self.Update() ; #DEBUG_LINE_NO:28
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  Self.Update() ; #DEBUG_LINE_NO:33
EndEvent

Function Update()
  Self.StartTimer(TimerDur, 0) ; #DEBUG_LINE_NO:38
EndFunction

sq_hoteliersactorscript Function GetHotelierNPC()
  Return Self.GetRefsLinkedToMe(SQ_Hoteliers_Trigger_Link, None)[0] as sq_hoteliersactorscript ; #DEBUG_LINE_NO:42
EndFunction

Function _SetDoorState()
  sq_hoteliersactorscript hotelierRef = Self.GetHotelierNPC() ; #DEBUG_LINE_NO:46
  ObjectReference[] doorRefs = Self.GetLinkedRefChain(SQ_Hoteliers_Door_Link, 100) ; #DEBUG_LINE_NO:48
  If hotelierRef == None ; #DEBUG_LINE_NO:50
    Return  ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
  If doorRefs == None ; #DEBUG_LINE_NO:55
    Return  ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
  Bool isRoomRented = hotelierRef.isRoomRented() ; #DEBUG_LINE_NO:60
  Int countInTrigger = Self.GetTriggerObjectCount() ; #DEBUG_LINE_NO:62
  Int I = 0 ; #DEBUG_LINE_NO:64
  Int iLength = doorRefs.Length ; #DEBUG_LINE_NO:65
  If isRoomRented == True || countInTrigger > 0 ; #DEBUG_LINE_NO:66
    While I < iLength ; #DEBUG_LINE_NO:68
      doorRefs[I].Unlock(False) ; #DEBUG_LINE_NO:69
      I += 1 ; #DEBUG_LINE_NO:70
    EndWhile ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    While I < iLength ; #DEBUG_LINE_NO:76
      doorRefs[I].SetOpen(False) ; #DEBUG_LINE_NO:77
      doorRefs[I].SetLockLevel(255) ; #DEBUG_LINE_NO:78
      doorRefs[I].Lock(True, False, True) ; #DEBUG_LINE_NO:79
      I += 1 ; #DEBUG_LINE_NO:80
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference bedRef = Self.GetLinkedRef(SQ_Hoteliers_Bed_Link) ; #DEBUG_LINE_NO:84
  SQ_Hoteliers.UpdateBedsAliasAndObjective(bedRef, hotelierRef) ; #DEBUG_LINE_NO:85
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:95
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:99
EndFunction
