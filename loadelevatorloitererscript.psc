ScriptName LoadElevatorLoitererScript Extends ObjectReference

;-- Structs -----------------------------------------
Struct ActorEntryData
  Actor actorRef
  Float entryTime
EndStruct


;-- Variables ---------------------------------------
loadelevatorloitererscript:actorentrydata[] actorsInManagerRoom

;-- Properties --------------------------------------
GlobalVariable Property LoadElevatorLoiteringLimitSeconds Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  actorsInManagerRoom = new loadelevatorloitererscript:actorentrydata[0] ; #DEBUG_LINE_NO:13
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef is Actor ; #DEBUG_LINE_NO:17
    loadelevatorloitererscript:actorentrydata data = new loadelevatorloitererscript:actorentrydata ; #DEBUG_LINE_NO:18
    data.actorRef = akActionRef as Actor ; #DEBUG_LINE_NO:19
    data.entryTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:20
    actorsInManagerRoom.add(data, 1) ; #DEBUG_LINE_NO:22
    Self.StartTimer(LoadElevatorLoiteringLimitSeconds.value, 0) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  ObjectReference loadEelevatorManagerRef = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:29
  If loadEelevatorManagerRef != None && loadEelevatorManagerRef is loadelevatormanagerscript ; #DEBUG_LINE_NO:30
    loadelevatormanagerscript loadElevatorManager = loadEelevatorManagerRef as loadelevatormanagerscript ; #DEBUG_LINE_NO:31
    Float currentTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:32
    Int I = actorsInManagerRoom.Length - 1 ; #DEBUG_LINE_NO:34
    While I >= 0 ; #DEBUG_LINE_NO:35
      loadelevatorloitererscript:actorentrydata data = actorsInManagerRoom[I] ; #DEBUG_LINE_NO:36
      Bool inTrigger = Self.IsInTrigger(data.actorRef as ObjectReference) ; #DEBUG_LINE_NO:38
      Float durationInTrigger = currentTime - data.entryTime ; #DEBUG_LINE_NO:39
      If inTrigger ; #DEBUG_LINE_NO:41
        If durationInTrigger >= LoadElevatorLoiteringLimitSeconds.value ; #DEBUG_LINE_NO:42
          loadElevatorManager.TravelToRandomFloor(data.actorRef as ObjectReference) ; #DEBUG_LINE_NO:43
          actorsInManagerRoom.remove(I, 1) ; #DEBUG_LINE_NO:44
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        actorsInManagerRoom.remove(I, 1) ; #DEBUG_LINE_NO:47
      EndIf ; #DEBUG_LINE_NO:
      I = -1 ; #DEBUG_LINE_NO:50
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
