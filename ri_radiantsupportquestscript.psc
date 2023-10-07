ScriptName RI_RadiantSupportQuestScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI_MBQuestCount Auto Const mandatory
GlobalVariable Property RI_NPCRadiantAvailable Auto Const mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const mandatory
Quest Property RI_RadiantPointerQuest Auto Const mandatory
Int Property iStartStage = 10 Auto Const
Keyword Property RI_RadiantQuestStartKeyword Auto Const mandatory
Int Property iCurrentMBCount Auto conditional
RefCollectionAlias Property VentDoors Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.ResetMBCount() ; #DEBUG_LINE_NO:17
EndEvent

Function ResetMBCount()
  Int iMBCount = Utility.RandomInt(3, 5) ; #DEBUG_LINE_NO:22
  RI_MBQuestCount.SetValueInt(iMBCount) ; #DEBUG_LINE_NO:23
  RI_NPCRadiantAvailable.SetValue(0.0) ; #DEBUG_LINE_NO:24
EndFunction

Function MBCompleted()
  iCurrentMBCount += 1 ; #DEBUG_LINE_NO:31
  If iCurrentMBCount >= RI_MBQuestCount.GetValueInt() && RI_NPCRadiantAvailable.GetValue() == 0.0 ; #DEBUG_LINE_NO:35
    RI_NPCRadiantAvailable.SetValue(1.0) ; #DEBUG_LINE_NO:36
    RI_RadiantQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:38
    iCurrentMBCount = 0 ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function LockVentDoors()
  Int TotalVentDoors = VentDoors.GetCount() ; #DEBUG_LINE_NO:49
  Int Current = 0 ; #DEBUG_LINE_NO:50
  While Current < TotalVentDoors ; #DEBUG_LINE_NO:52
    ObjectReference ChosenRef = VentDoors.GetAt(Current) ; #DEBUG_LINE_NO:54
    ChosenRef.Lock(True, False, True) ; #DEBUG_LINE_NO:55
    ChosenRef.SetLockLevel(254) ; #DEBUG_LINE_NO:56
    Current += 1 ; #DEBUG_LINE_NO:57
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function UnlockVentDoors()
  Int TotalVentDoors = VentDoors.GetCount() ; #DEBUG_LINE_NO:65
  Int Current = 0 ; #DEBUG_LINE_NO:66
  While Current < TotalVentDoors ; #DEBUG_LINE_NO:68
    ObjectReference ChosenRef = VentDoors.GetAt(Current) ; #DEBUG_LINE_NO:70
    ChosenRef.Unlock(False) ; #DEBUG_LINE_NO:71
    Current += 1 ; #DEBUG_LINE_NO:72
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function BountyReceived(Quest myQuest)
  (myQuest as ri_crimetrackingquestscript).iBountiesGained = (myQuest as ri_crimetrackingquestscript).iBountiesGained + 1 ; #DEBUG_LINE_NO:82
EndFunction
