ScriptName SQ_HoteliersActorScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group autofill
  Quest Property SQ_Hoteliers Auto Const mandatory
  { autofill }
  Keyword Property SQ_Hoteliers_Trigger_Link Auto Const mandatory
  { autofill; keyword that links Hotlier NPC to the room trigger. }
  Keyword Property SQ_Hoteliers_Door_Link Auto Const mandatory
  { autofill; keyword that links room trigger to the room door(s). }
  Keyword Property SQ_Hoteliers_Bed_Link Auto Const mandatory
  { autofill; keyword that links the room trigger to the bed(s). }
  GlobalVariable Property SQ_Hoteliers_RoomCost_Daily_TextReplacementValue Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Hoteliers_RoomCost_Weekly_TextReplacementValue Auto Const mandatory
  { autofill }
  ActorValue Property SQ_Hoteliers_RoomExpiry Auto Const mandatory
  { autofill }
EndGroup

Group AutofillOrSetSpecifically
  GlobalVariable Property SQ_Hoteliers_RoomCost_Daily Auto Const mandatory
  { autofill for default, otherwise you can replace with your own global if you want a different cost - this is for a single day rental }
  GlobalVariable Property SQ_Hoteliers_RoomCost_Weekly Auto Const mandatory
  { autofill for default, otherwise you can replace with your own global if you want a different cost - this is for a weekly rental }
EndGroup


;-- Functions ---------------------------------------

Function SetPrices()
  SQ_Hoteliers_RoomCost_Daily_TextReplacementValue.SetValue(SQ_Hoteliers_RoomCost_Daily.GetValue()) ; #DEBUG_LINE_NO:37
  SQ_Hoteliers.UpdateCurrentInstanceGlobal(SQ_Hoteliers_RoomCost_Daily_TextReplacementValue) ; #DEBUG_LINE_NO:38
  SQ_Hoteliers_RoomCost_Weekly_TextReplacementValue.SetValue(SQ_Hoteliers_RoomCost_Weekly.GetValue()) ; #DEBUG_LINE_NO:40
  SQ_Hoteliers.UpdateCurrentInstanceGlobal(SQ_Hoteliers_RoomCost_Weekly_TextReplacementValue) ; #DEBUG_LINE_NO:41
EndFunction

Function RentRoomDaily()
  Self.RentRoom(SQ_Hoteliers_RoomCost_Daily, 1) ; #DEBUG_LINE_NO:46
EndFunction

Function RentRoomWeekly()
  Self.RentRoom(SQ_Hoteliers_RoomCost_Weekly, 7) ; #DEBUG_LINE_NO:51
EndFunction

Function RentRoom(GlobalVariable Cost, Int Days)
  sq_hoteliertriggerscript triggerRef = Self.GetLinkedRef(SQ_Hoteliers_Trigger_Link) as sq_hoteliertriggerscript ; #DEBUG_LINE_NO:55
  Game.GetPlayer().RemoveItem(Game.GetCredits() as Form, Cost.GetValueInt(), False, None) ; #DEBUG_LINE_NO:58
  Float expiryDay = Utility.expiryDay(Days as Float, None, -1.0, Self.GetValue(SQ_Hoteliers_RoomExpiry)) ; #DEBUG_LINE_NO:61
  Self.SetValue(SQ_Hoteliers_RoomExpiry, expiryDay) ; #DEBUG_LINE_NO:63
  triggerRef.Update() ; #DEBUG_LINE_NO:67
  ObjectReference[] myDoorRefs = Self.GetLinkedRef(SQ_Hoteliers_Trigger_Link).GetLinkedRefChain(SQ_Hoteliers_Door_Link, 100) ; #DEBUG_LINE_NO:70
  If myDoorRefs.Length > 1 ; #DEBUG_LINE_NO:71
    Self.CancelTimerGameTime(0) ; #DEBUG_LINE_NO:72
    Float CurrentTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:73
    Float TimeRemaining = expiryDay - CurrentTime ; #DEBUG_LINE_NO:74
    Self.StartTimerGameTime(Math.DaysAsHours(TimeRemaining), 0) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
  If triggerRef != None ; #DEBUG_LINE_NO:79
    ObjectReference myHotelierRef = Self as ObjectReference ; #DEBUG_LINE_NO:80
    If triggerRef.GetParentCell() != myHotelierRef.GetParentCell() ; #DEBUG_LINE_NO:81
      ObjectReference[] BedRefs = triggerRef.GetLinkedRefChain(SQ_Hoteliers_Bed_Link, 100) ; #DEBUG_LINE_NO:82
      (SQ_Hoteliers as sq_hoteliersquestscript).UpdateBedsAliasAndObjective(BedRefs[0], myHotelierRef as SQ_HoteliersActorScript) ; #DEBUG_LINE_NO:83
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsRoomRented()
  Float AV = Self.GetValue(SQ_Hoteliers_RoomExpiry) ; #DEBUG_LINE_NO:90
  Return AV > 0.0 && Utility.HasExpiryDayPassed(AV) == False ; #DEBUG_LINE_NO:92
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If Self.IsRoomRented() == False ; #DEBUG_LINE_NO:98
    sq_hoteliertriggerscript triggerRef = Self.GetLinkedRef(SQ_Hoteliers_Trigger_Link) as sq_hoteliertriggerscript ; #DEBUG_LINE_NO:99
    triggerRef.Update() ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:111
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:115
EndFunction
