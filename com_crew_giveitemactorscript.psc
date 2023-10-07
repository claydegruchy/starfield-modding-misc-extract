ScriptName COM_CREW_GiveItemActorScript Extends Actor
{ Used for Companions and Crew, if you find another use for this. Let jduvall know. :) }

;-- Variables ---------------------------------------
Bool InitialCooldownPassed = False

;-- Properties --------------------------------------
Group autofill
  sq_com_crew_giveitemquestscript Property SQ_Crew Auto Const mandatory
  { autofill }
  ActorValue Property COM_CREW_GiveItem_HasItems Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_CREW_GiveItemAvailableCooldownDays Auto Const mandatory
  { autofill; the number of days that need to pass for new items to be offered to player after they accept previous offer }
  ActorValue Property COM_CREW_GiveItemAvailableDay Auto Const mandatory
  { autofill; the day (in gamedayspassed terms) that the next item is available }
  Keyword Property COM_CREW_GiveItemReminder Auto Const mandatory
  { dialogue subtype for line to say to remind player they have something to give }
  conditionform Property COM_CREW_CND_GiveItemAvailable Auto Const mandatory
  { the condition form that means they have something to give player - rolls up the above }
EndGroup

Group Properties
  LeveledItem Property GiveItemList Auto Const mandatory
  { holds items to give the player.
	Filter for: GiveItemList }
EndGroup


;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If InitialCooldownPassed == True ; #DEBUG_LINE_NO:37
    Bool hasItems = Self.GetValue(COM_CREW_GiveItem_HasItems) as Bool ; #DEBUG_LINE_NO:39
    If hasItems == False ; #DEBUG_LINE_NO:41
      Bool expiryDayCheckPassed = Utility.HasExpiryDayPassed(Self.GetValue(COM_CREW_GiveItemAvailableDay)) ; #DEBUG_LINE_NO:43
      If expiryDayCheckPassed ; #DEBUG_LINE_NO:47
        Bool giveItemsCheckPassed = SQ_Crew.CheckGiveItemConditions(Self as Actor) ; #DEBUG_LINE_NO:49
        If giveItemsCheckPassed ; #DEBUG_LINE_NO:53
          Self.SetValue(COM_CREW_GiveItem_HasItems, 1.0) ; #DEBUG_LINE_NO:54
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.StartTimerGameTime(Math.DaysAsHours(COM_CREW_GiveItemAvailableCooldownDays.GetValue()), 0) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
  If COM_CREW_CND_GiveItemAvailable.IsTrue(Self as ObjectReference, None) ; #DEBUG_LINE_NO:65
    Self.SayCustom(COM_CREW_GiveItemReminder, None, False, None) ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  InitialCooldownPassed = True ; #DEBUG_LINE_NO:74
EndEvent

Function GiveItems()
  Float ExpiryDay = Utility.ExpiryDay(COM_CREW_GiveItemAvailableCooldownDays.GetValue(), None, -1.0, -1.0) ; #DEBUG_LINE_NO:81
  Self.SetValue(COM_CREW_GiveItemAvailableDay, ExpiryDay) ; #DEBUG_LINE_NO:84
  Self.SetValue(COM_CREW_GiveItem_HasItems, 0.0) ; #DEBUG_LINE_NO:85
  Game.GetPlayer().AddItem(GiveItemList as Form, 1, False) ; #DEBUG_LINE_NO:87
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:96
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:100
EndFunction
