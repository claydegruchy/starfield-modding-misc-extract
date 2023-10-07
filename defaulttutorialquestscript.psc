ScriptName DefaultTutorialQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct TutorialMessageDatum
  String asEvent
  { Note: if you want multiple messages showing "together" you will need to make each have a different asEvent string. As per the ShowAsHelpMessage() param }
  String asUserEventToEnd = "None"
  { The User Event (button press) we are listening for in order to end the tutorial early. }
  Bool AlwaysShow = False
  { If True, then always show this Tutorial, even if the player has seen it before. }
  Float DelayTime = -1.0
  { If set, it will delay this amount of time before showing the message }
  Bool DelayFinished hidden
  { will be set when the timer has delayed this, and we are ready to show it }
  Bool TutorialSeen hidden
  { tracks if the player has seen this tutorial already }
  String asEventNext
  { This is the next event to send immediately after this one (for multiple part messages), make sure there is a struct defined for it in this array as well AND make sure there is a DelayTime set so they don't bash. }
  Message TutorialMessage
  { the message to display along with the objective which tells the player how to complete the objective }
  Message TutorialMessageMouseAndKeyboardSpecific
  { the message to display along with the objective which tells the player how to complete the objective... if NONE (default), show TutorialMessage for both, othewise show this if PC }
  Int AfDuration = 30
  { As per the ShowAsHelpMessage() param - how long to display }
  Int AfInterval = 30
  { As per the ShowAsHelpMessage() param - how much time between intervals }
  Int aiMaxTimes = 1
  { As per the ShowAsHelpMessage() param - how many times this message repeats. Defaults to only display once. }
  String asContext = ""
  { As per the ShowAsHelpMessage() param }
  Int aiPriority = 0
  { As per the ShowAsHelpMessage() param }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TutorialProperty
  defaulttutorialquestscript:tutorialmessagedatum[] Property TutorialMessageData Auto Const mandatory
  GlobalVariable Property TutorialAllowedGlobal Auto Const
  { if set, this global must be >= 1 to }
EndGroup


;-- Functions ---------------------------------------

Event OnTimer(Int aiTimerID)
  TutorialMessageData[aiTimerID].DelayFinished = True ; #DEBUG_LINE_NO:51
  Self.ShowHelpMessage(TutorialMessageData[aiTimerID].asEvent) ; #DEBUG_LINE_NO:52
EndEvent

Function ShowHelpMessage(String EventName)
  If TutorialAllowedGlobal as Bool && TutorialAllowedGlobal.GetValue() < 1.0 ; #DEBUG_LINE_NO:56
    Return  ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
  Int iFound = TutorialMessageData.findstruct("asEvent", EventName, 0) ; #DEBUG_LINE_NO:66
  If iFound > -1 ; #DEBUG_LINE_NO:68
    If TutorialMessageData[iFound].AlwaysShow == True ; #DEBUG_LINE_NO:69
      Self.ResetTutorial(EventName) ; #DEBUG_LINE_NO:71
    EndIf ; #DEBUG_LINE_NO:
    If TutorialMessageData[iFound].TutorialSeen == True ; #DEBUG_LINE_NO:74
       ; #DEBUG_LINE_NO:
    ElseIf TutorialMessageData[iFound].DelayTime > 0.0 && TutorialMessageData[iFound].DelayFinished == False ; #DEBUG_LINE_NO:76
      Self.StartTimer(TutorialMessageData[iFound].DelayTime, iFound) ; #DEBUG_LINE_NO:78
    Else ; #DEBUG_LINE_NO:
      Self.DoShowMessage(iFound) ; #DEBUG_LINE_NO:80
      TutorialMessageData[iFound].TutorialSeen = True ; #DEBUG_LINE_NO:81
      TutorialMessageData[iFound].DelayFinished = False ; #DEBUG_LINE_NO:82
      If TutorialMessageData[iFound].asEventNext ; #DEBUG_LINE_NO:84
        Self.ShowHelpMessage(TutorialMessageData[iFound].asEventNext) ; #DEBUG_LINE_NO:85
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UnshowHelpMessage(String EventName)
  Int iFound = TutorialMessageData.findstruct("asEvent", EventName, 0) ; #DEBUG_LINE_NO:94
  If iFound > -1 ; #DEBUG_LINE_NO:96
    If TutorialMessageData[iFound].TutorialMessage ; #DEBUG_LINE_NO:97
      TutorialMessageData[iFound].TutorialMessage.UnshowAsHelpMessage() ; #DEBUG_LINE_NO:98
    EndIf ; #DEBUG_LINE_NO:
    If TutorialMessageData[iFound].TutorialMessageMouseAndKeyboardSpecific ; #DEBUG_LINE_NO:100
      TutorialMessageData[iFound].TutorialMessageMouseAndKeyboardSpecific.UnshowAsHelpMessage() ; #DEBUG_LINE_NO:101
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DoShowMessage(Int iFound)
  String asUserEventToEnd = TutorialMessageData[iFound].asUserEventToEnd ; #DEBUG_LINE_NO:108
  Message TutorialMessage = TutorialMessageData[iFound].TutorialMessage ; #DEBUG_LINE_NO:109
  Message TutorialMessageMouseAndKeyboardSpecific = TutorialMessageData[iFound].TutorialMessageMouseAndKeyboardSpecific ; #DEBUG_LINE_NO:110
  Int AfDuration = TutorialMessageData[iFound].AfDuration ; #DEBUG_LINE_NO:111
  Int AfInterval = TutorialMessageData[iFound].AfInterval ; #DEBUG_LINE_NO:112
  Int aiMaxTimes = TutorialMessageData[iFound].aiMaxTimes ; #DEBUG_LINE_NO:113
  String asContext = TutorialMessageData[iFound].asContext ; #DEBUG_LINE_NO:114
  Int aiPriority = TutorialMessageData[iFound].aiPriority ; #DEBUG_LINE_NO:115
  Message.ClearHelpMessages() ; #DEBUG_LINE_NO:118
  If TutorialMessageMouseAndKeyboardSpecific == None ; #DEBUG_LINE_NO:121
    TutorialMessage.ShowAsHelpMessage(asUserEventToEnd, AfDuration as Float, AfInterval as Float, aiMaxTimes, asContext, aiPriority, None) ; #DEBUG_LINE_NO:122
  Else ; #DEBUG_LINE_NO:
    TutorialMessageMouseAndKeyboardSpecific.ShowAsHelpMessage(asUserEventToEnd, AfDuration as Float, AfInterval as Float, aiMaxTimes, asContext, aiPriority, TutorialMessage) ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ResetTutorial(String EventName)
  Int iFound = TutorialMessageData.findstruct("asEvent", EventName, 0) ; #DEBUG_LINE_NO:130
  TutorialMessageData[iFound].TutorialSeen = False ; #DEBUG_LINE_NO:131
  Message.ResetHelpMessage(TutorialMessageData[iFound].asUserEventToEnd) ; #DEBUG_LINE_NO:132
EndFunction

Function ResetAll()
  Int I = 0 ; #DEBUG_LINE_NO:136
  While I < TutorialMessageData.Length ; #DEBUG_LINE_NO:137
    Self.ResetTutorial(TutorialMessageData[I].asEvent) ; #DEBUG_LINE_NO:138
    I += 1 ; #DEBUG_LINE_NO:139
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
