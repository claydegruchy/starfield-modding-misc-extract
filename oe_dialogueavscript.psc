ScriptName OE_DialogueAVScript Extends Quest
{ script to handle setting actorvalues that will be used as conditions for dialogue }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  ActorValue Property OE_Civilians_DIAL_CanIHelp Auto Const mandatory
  ActorValue Property OE_Civilians_DIAL_WhatsGoingOn Auto Const mandatory
  ActorValue Property OE_Civilians_DIAL_HowsLife Auto Const mandatory
  ActorValue Property OE_Civilians_DIAL_Topic04 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function SetCanIHelp(ObjectReference SpeakerRef, Int InfoNumber)
  SpeakerRef.SetValue(OE_Civilians_DIAL_CanIHelp, InfoNumber as Float) ; #DEBUG_LINE_NO:13
EndFunction

Function SetWhatsGoingOn(ObjectReference SpeakerRef, Int InfoNumber)
  SpeakerRef.SetValue(OE_Civilians_DIAL_WhatsGoingOn, InfoNumber as Float) ; #DEBUG_LINE_NO:18
EndFunction

Function SetHowsLife(ObjectReference SpeakerRef, Int InfoNumber)
  SpeakerRef.SetValue(OE_Civilians_DIAL_HowsLife, InfoNumber as Float) ; #DEBUG_LINE_NO:23
EndFunction

Function SetTopic04(ObjectReference SpeakerRef, Int InfoNumber)
  SpeakerRef.SetValue(OE_Civilians_DIAL_Topic04, InfoNumber as Float) ; #DEBUG_LINE_NO:28
EndFunction

Function ShowMissionTerminalObjective(ObjectReference SpeakerRef)
  ((Self as Quest) as oe_missionterminalquestscript).PlayerToldAboutMissionTerminal(SpeakerRef) ; #DEBUG_LINE_NO:33
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:40
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:44
EndFunction
