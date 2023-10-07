ScriptName TestBountyBoardScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest[] Property Missions Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Int currentElement = 0 ; #DEBUG_LINE_NO:7
  While currentElement < Missions.Length ; #DEBUG_LINE_NO:8
    If Missions[currentElement].IsRunning() == False ; #DEBUG_LINE_NO:9
      Missions[currentElement].Start() ; #DEBUG_LINE_NO:10
    EndIf ; #DEBUG_LINE_NO:
    currentElement += 1 ; #DEBUG_LINE_NO:12
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
