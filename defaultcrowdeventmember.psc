ScriptName DefaultCrowdEventMember Extends Actor default
{ Data for how this actor should respond to events sent by a DefaultCrowdEventManager }

;-- Structs -----------------------------------------
Struct EventDatum
  Keyword EventKeyword
  { Keyword representing the event to respond to }
  Keyword EventTopicSubType
  { Topic SubType keyword to say when responding to the event }
  Int EventChanceToRespond = 75
  { 0-100, chance to respond to this event }
  Float MinResponseDelay = 0.0
  { In seconds, minimum amount of time to wait before responding to event }
  Float MaxResponseDelay = 3.0
  { In seconds, maximum amount of time to wait before responding to event }
  Float CoolDown = 3.0
  { In seconds, the time to wait before responding to any event after this event has been responded to }
  Bool RequireToFaceEitherEventRef = True
  { Does the actor need to be facing one of the EventRefs to respond?
	Note: this does NOT cause the actor to face the EventRefs, just ignores the event if not facing }
EndStruct


;-- Variables ---------------------------------------
Bool coolingDown = False

;-- Properties --------------------------------------
Group Data
  defaultcrowdeventmanager[] Property CrowdEventManagers Auto Const
  { Pointer to quests whose CrowdEvent you are going to listen to. Quest must have a DefaultCrowdEventManager script attached. }
  defaultcrowdeventmember:eventdatum[] Property EventData Auto Const
  { Add keywords and correspond topics to say.
Note: You can define multiple responses to the same event, but they will stop processing after responding to the first event the pass for, until the cool down. }
EndGroup

Group Quest_Properties
  Quest Property ControllingQuest Auto Const
  Int Property DisableOnStage Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  Int I = 0 ; #DEBUG_LINE_NO:63
  While I < CrowdEventManagers.Length ; #DEBUG_LINE_NO:64
    Self.RegisterForCustomEvent(CrowdEventManagers[I] as ScriptObject, "defaultcrowdeventmanager_CrowdEvent") ; #DEBUG_LINE_NO:65
    I += 1 ; #DEBUG_LINE_NO:66
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event DefaultCrowdEventManager.CrowdEvent(defaultcrowdeventmanager akSender, Var[] akArgs)
  If !ControllingQuest.GetStageDone(DisableOnStage) ; #DEBUG_LINE_NO:76
    If coolingDown ; #DEBUG_LINE_NO:78
      Return  ; #DEBUG_LINE_NO:80
    EndIf ; #DEBUG_LINE_NO:
    coolingDown = True ; #DEBUG_LINE_NO:84
    Float CoolDown = 0.0 ; #DEBUG_LINE_NO:86
    defaultcrowdeventmanager:crowdeventdata myCrowdEventData = akArgs[0] as defaultcrowdeventmanager:crowdeventdata ; #DEBUG_LINE_NO:88
    Keyword EventKeyword = myCrowdEventData.EventKeyword ; #DEBUG_LINE_NO:90
    ObjectReference EventRef1 = myCrowdEventData.EventRef1 ; #DEBUG_LINE_NO:91
    ObjectReference EventRef2 = myCrowdEventData.EventRef2 ; #DEBUG_LINE_NO:92
    Float HeadingAngleToRef1 = 0.0 ; #DEBUG_LINE_NO:98
    Float HeadingAngleToRef2 = 0.0 ; #DEBUG_LINE_NO:99
    If EventRef1 ; #DEBUG_LINE_NO:101
      HeadingAngleToRef1 = Math.abs(Self.GetHeadingAngle(EventRef1)) ; #DEBUG_LINE_NO:102
    EndIf ; #DEBUG_LINE_NO:
    If EventRef2 ; #DEBUG_LINE_NO:105
      HeadingAngleToRef2 = Math.abs(Self.GetHeadingAngle(EventRef2)) ; #DEBUG_LINE_NO:106
    EndIf ; #DEBUG_LINE_NO:
    Float FacingAngle = 45.0 ; #DEBUG_LINE_NO:113
    Float delay = 0.0 ; #DEBUG_LINE_NO:115
    Int chanceRoll = 0 ; #DEBUG_LINE_NO:116
    Int I = 0 ; #DEBUG_LINE_NO:119
    While I < EventData.Length && CoolDown == 0.0 ; #DEBUG_LINE_NO:120
      If EventData[I].RequireToFaceEitherEventRef && HeadingAngleToRef1 > FacingAngle && HeadingAngleToRef2 > FacingAngle ; #DEBUG_LINE_NO:122
         ; #DEBUG_LINE_NO:
      ElseIf EventData[I].EventKeyword == EventKeyword ; #DEBUG_LINE_NO:127
        chanceRoll = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:128
        If chanceRoll < EventData[I].EventChanceToRespond ; #DEBUG_LINE_NO:131
          delay = Utility.RandomFloat(EventData[I].MinResponseDelay, EventData[I].MaxResponseDelay) ; #DEBUG_LINE_NO:132
          Utility.wait(delay) ; #DEBUG_LINE_NO:135
          Self.SayCustom(EventData[I].EventTopicSubType, None, False, None) ; #DEBUG_LINE_NO:138
          CoolDown = EventData[I].CoolDown ; #DEBUG_LINE_NO:140
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:147
    EndWhile ; #DEBUG_LINE_NO:
    If CoolDown > 0.0 ; #DEBUG_LINE_NO:150
      Utility.wait(CoolDown) ; #DEBUG_LINE_NO:152
    EndIf ; #DEBUG_LINE_NO:
    coolingDown = False ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
EndEvent
