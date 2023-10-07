ScriptName RMDisplayLeaderboardScript Extends ObjectReference Const
{ Show the selected message when this REFERENCE is activated. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Message_Properties
  Message Property RM_Display_LeaderboardOver5thMSG Auto Const mandatory
  { The message to show when activated if the player hasn't placed on the board. }
  Message Property RM_Display_Leaderboard5thMSG Auto Const mandatory
  { The message to show when activated if the player is in 5th place. }
  Message Property RM_Display_Leaderboard4thMSG Auto Const mandatory
  { The message to show when activated if the player is in 4th place. }
  Message Property RM_Display_Leaderboard3rdMSG Auto Const mandatory
  { The message to show when activated if the player is in 3rd place. }
  Message Property RM_Display_Leaderboard2ndMSG Auto Const mandatory
  { The message to show when activated if the player is in 2nd place. }
  Message Property RM_Display_Leaderboard1stMSG Auto Const mandatory
  { The message to show when activated if the player is in 1st place. }
EndGroup

Group Other_Properties
  GlobalVariable Property PlayerCompletedRedMile Auto Const mandatory
  { Global for the number of times the player has completed the Red Mile }
  GlobalVariable Property RM_Record_5thPlace Auto Const mandatory
  GlobalVariable Property RM_Record_4thPlace Auto Const mandatory
  GlobalVariable Property RM_Record_3rdPlace Auto Const mandatory
  GlobalVariable Property RM_Record_2ndPlace Auto Const mandatory
  GlobalVariable Property RM_DonovanRecord Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Float fCompletedValue = PlayerCompletedRedMile.GetValue() ; #DEBUG_LINE_NO:30
  Float f5Value = RM_Record_5thPlace.GetValue() ; #DEBUG_LINE_NO:31
  Float f4Value = RM_Record_4thPlace.GetValue() ; #DEBUG_LINE_NO:32
  Float f3Value = RM_Record_3rdPlace.GetValue() ; #DEBUG_LINE_NO:33
  Float f2Value = RM_Record_2ndPlace.GetValue() ; #DEBUG_LINE_NO:34
  Float f1Value = RM_DonovanRecord.GetValue() ; #DEBUG_LINE_NO:35
  If fCompletedValue <= f5Value ; #DEBUG_LINE_NO:36
    RM_Display_LeaderboardOver5thMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:37
  ElseIf fCompletedValue > f5Value && fCompletedValue <= f4Value ; #DEBUG_LINE_NO:38
    RM_Display_Leaderboard5thMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:39
  ElseIf fCompletedValue > f4Value && fCompletedValue <= f3Value ; #DEBUG_LINE_NO:40
    RM_Display_Leaderboard4thMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:41
  ElseIf fCompletedValue > f3Value && fCompletedValue <= f2Value ; #DEBUG_LINE_NO:42
    RM_Display_Leaderboard3rdMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:43
  ElseIf fCompletedValue > f2Value && fCompletedValue <= f1Value ; #DEBUG_LINE_NO:44
    RM_Display_Leaderboard2ndMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:45
  Else ; #DEBUG_LINE_NO:
    RM_Display_Leaderboard1stMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
EndEvent
