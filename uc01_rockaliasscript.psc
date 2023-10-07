ScriptName UC01_RockAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Bool bSimStarted

;-- Properties --------------------------------------
Int Property ExitStageToSet = 1000 Auto Const
{ Stage to set if the player has chosen to bail }
Message Property UC01_ShipSim_LeaveSequence Auto Const mandatory
{ Message to display to allow the player to leave the sequence if they haven't passed the exam }
Message Property UC01_ShipSim_LeaveSequence_Success Auto Const mandatory
{ Message to display to allow the player to leave the sequence if they HAVE passed }
Message Property UC01_ShipSim_LeaveSequence_Complete Auto Const mandatory
{ Message to display if the player has completed all enemy tiers }
GlobalVariable Property UC01_ShipSim_MinKillsRequired Auto Const mandatory
{ Min number of kills required to pass this exam }
GlobalVariable Property UC01_ShipSim_PlayerKillCount Auto Const mandatory
{ How many kills the player got on this playerthrough }
GlobalVariable Property UC01_ShipSim_TotalEnemyCount Auto Const mandatory
{ Variable used to keep track of the total number of possible enemy ships }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Message MessageToShow = None ; #DEBUG_LINE_NO:28
  Float fKillCount = UC01_ShipSim_PlayerKillCount.GetValue() ; #DEBUG_LINE_NO:29
  Float fTotalEnemies = UC01_ShipSim_TotalEnemyCount.GetValue() ; #DEBUG_LINE_NO:30
  If fKillCount >= fTotalEnemies ; #DEBUG_LINE_NO:32
    MessageToShow = UC01_ShipSim_LeaveSequence_Complete ; #DEBUG_LINE_NO:33
  ElseIf fKillCount >= UC01_ShipSim_MinKillsRequired.GetValue() ; #DEBUG_LINE_NO:34
    MessageToShow = UC01_ShipSim_LeaveSequence_Success ; #DEBUG_LINE_NO:35
  Else ; #DEBUG_LINE_NO:
    MessageToShow = UC01_ShipSim_LeaveSequence ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  If bSimStarted ; #DEBUG_LINE_NO:40
    Int iButtonResponse = MessageToShow.Show(fKillCount, fTotalEnemies, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:41
    If iButtonResponse == 1 ; #DEBUG_LINE_NO:42
      Self.TriggerSimShutdown() ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.TriggerSimShutdown() ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartSequence()
  bSimStarted = True ; #DEBUG_LINE_NO:51
EndFunction

Function TriggerSimShutdown()
  bSimStarted = False ; #DEBUG_LINE_NO:55
  uc01_shipsimulationquestscript myInst = Self.GetOwningQuest() as uc01_shipsimulationquestscript ; #DEBUG_LINE_NO:56
  myInst.ShutdownSimulation() ; #DEBUG_LINE_NO:57
  myInst.SetStage(ExitStageToSet) ; #DEBUG_LINE_NO:58
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:65
EndFunction
