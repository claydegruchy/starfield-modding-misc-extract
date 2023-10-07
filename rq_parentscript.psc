ScriptName RQ_ParentScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  Quest Property SQ_PlayerShip Auto Const mandatory
  Quest Property TestGoToSpaceQuest Auto Const mandatory
  GlobalVariable Property RQ_Debug_SummonShipOnStart Auto Const mandatory
  GlobalVariable Property PCM_VerifiedOnly Auto Const mandatory
  GlobalVariable Property PCM_BlockCreation_DebugGlobal Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function ExecuteCommand(String aCommand)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function TestRQ(String QuestName, String TestPlanet, String Overlay1, String Overlay2, Int PCM_BlockCreation_DebugGlobal_Value, Int Overlay1X, Int Overlay1Y, Int Overlay2X, Int Overlay2Y, Int PlayerX, Int PlayerY)
  If Overlay1X == 0 ; #DEBUG_LINE_NO:28
    Overlay1X = 1 ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
  If Overlay1Y == 0 ; #DEBUG_LINE_NO:31
    Overlay1Y = 1 ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
  If Overlay2X == 0 ; #DEBUG_LINE_NO:34
    Overlay2X = 1 ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
  If Overlay2Y == 0 ; #DEBUG_LINE_NO:37
    Overlay2Y = 3 ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
  If PlayerX == 0 ; #DEBUG_LINE_NO:40
    PlayerX = 1 ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
  If PlayerY == 0 ; #DEBUG_LINE_NO:43
    PlayerY = 1 ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
  Self.TestRQFull(QuestName, TestPlanet, Overlay1, Overlay2, PCM_BlockCreation_DebugGlobal_Value, Overlay1X, Overlay1Y, Overlay2X, Overlay2Y, PlayerX, PlayerY) ; #DEBUG_LINE_NO:46
EndFunction

Function TestRQFull(String QuestName, String TestPlanet, String Overlay1, String Overlay2, Int PCM_BlockCreation_DebugGlobal_Value, Int Overlay1X, Int Overlay1Y, Int Overlay2X, Int Overlay2Y, Int PlayerX, Int PlayerY)
  TestGoToSpaceQuest.SetStage(20) ; #DEBUG_LINE_NO:62
  Float waitingFor = 0.0 ; #DEBUG_LINE_NO:65
  Float waitMax = 10.0 ; #DEBUG_LINE_NO:66
  Float waitTime = 0.100000001 ; #DEBUG_LINE_NO:67
  While SQ_PlayerShip.IsRunning() == False && waitingFor < waitMax ; #DEBUG_LINE_NO:68
    Utility.Wait(waitTime) ; #DEBUG_LINE_NO:69
    waitingFor += waitTime ; #DEBUG_LINE_NO:70
  EndWhile ; #DEBUG_LINE_NO:
  RQ_Debug_SummonShipOnStart.SetValue(1.0) ; #DEBUG_LINE_NO:74
  PCM_VerifiedOnly.SetValue(1.0) ; #DEBUG_LINE_NO:77
  PCM_BlockCreation_DebugGlobal.SetValue(PCM_BlockCreation_DebugGlobal_Value as Float) ; #DEBUG_LINE_NO:78
  Self.ExecuteCommand("SQAL " + QuestName + " 1") ; #DEBUG_LINE_NO:81
  Self.ExecuteCommand("SetDebugQuest " + QuestName + " 1 100") ; #DEBUG_LINE_NO:82
  Self.ExecuteCommand(("AddWorldspaceToPlanet " + Overlay1 + " " + TestPlanet + " " + Overlay1X as String) + " " + Overlay1Y as String) ; #DEBUG_LINE_NO:83
  If Overlay2 ; #DEBUG_LINE_NO:85
    If Overlay1X == Overlay2X && Overlay1Y == Overlay2Y ; #DEBUG_LINE_NO:86
      Overlay2Y += 3 ; #DEBUG_LINE_NO:88
    EndIf ; #DEBUG_LINE_NO:
    Self.ExecuteCommand(("AddWorldspaceToPlanet " + Overlay2 + " " + TestPlanet + " " + Overlay2X as String) + " " + Overlay2Y as String) ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
  Self.ExecuteCommand(("LOP " + TestPlanet + " " + PlayerX as String) + " " + PlayerY as String) ; #DEBUG_LINE_NO:93
EndFunction
