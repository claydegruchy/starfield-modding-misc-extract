ScriptName SQ_HoteliersQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PrimaryAliasHotelier Auto Const mandatory
RefCollectionAlias Property RentedBeds Auto Const mandatory
Int Property VisitRoomObjective = 1 Auto Const

;-- Functions ---------------------------------------

Function SetRoomPrices()
  sq_hoteliersactorscript hotelierActor = PrimaryAliasHotelier.GetActorReference() as sq_hoteliersactorscript ; #DEBUG_LINE_NO:9
  hotelierActor.SetPrices() ; #DEBUG_LINE_NO:11
EndFunction

Function RentedRoomDaily()
  sq_hoteliersactorscript hotelierActor = PrimaryAliasHotelier.GetActorReference() as sq_hoteliersactorscript ; #DEBUG_LINE_NO:16
  hotelierActor.RentRoomDaily() ; #DEBUG_LINE_NO:18
EndFunction

Function RentedRoomWeekly()
  sq_hoteliersactorscript hotelierActor = PrimaryAliasHotelier.GetActorReference() as sq_hoteliersactorscript ; #DEBUG_LINE_NO:23
  hotelierActor.RentRoomWeekly() ; #DEBUG_LINE_NO:25
EndFunction

Function UpdateBedsAliasAndObjective(ObjectReference BedRef, sq_hoteliersactorscript HotelierRef)
  If BedRef == None ; #DEBUG_LINE_NO:30
    Return  ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
  If HotelierRef.IsRoomRented() ; #DEBUG_LINE_NO:35
    RentedBeds.AddRef(BedRef) ; #DEBUG_LINE_NO:37
    BedRef.SetActorOwner(Game.GetPlayer().GetBaseObject() as ActorBase, False) ; #DEBUG_LINE_NO:38
    Self.SetObjectiveDisplayed(VisitRoomObjective, True, False) ; #DEBUG_LINE_NO:39
  Else ; #DEBUG_LINE_NO:
    BedRef.SetActorOwner(HotelierRef.GetBaseObject() as ActorBase, False) ; #DEBUG_LINE_NO:42
    RentedBeds.RemoveRef(BedRef) ; #DEBUG_LINE_NO:43
    If RentedBeds.GetCount() == 0 ; #DEBUG_LINE_NO:44
      Self.SetObjectiveDisplayed(VisitRoomObjective, False, False) ; #DEBUG_LINE_NO:45
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:56
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:60
EndFunction
