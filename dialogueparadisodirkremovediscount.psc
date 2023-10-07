ScriptName DialogueParadisoDirkRemoveDiscount Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PD_Hotel_RoomCost_Daily Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Daily_Default Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Weekly Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Weekly_Default Auto Const mandatory
GlobalVariable Property PD_PlayerHasHotelRoomDiscount Auto Const mandatory
Quest Property MS06 Auto Const mandatory
Int Property MS06EndingCRewardStage = 3120 Auto Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If PD_PlayerHasHotelRoomDiscount.GetValue() > 0.0 ; #DEBUG_LINE_NO:13
    PD_PlayerHasHotelRoomDiscount.SetValue(0.0) ; #DEBUG_LINE_NO:14
    If !MS06.GetStageDone(MS06EndingCRewardStage) ; #DEBUG_LINE_NO:15
      PD_Hotel_RoomCost_Daily.SetValue(PD_Hotel_RoomCost_Daily_Default.GetValue()) ; #DEBUG_LINE_NO:16
      PD_Hotel_RoomCost_Weekly.SetValue(PD_Hotel_RoomCost_Weekly_Default.GetValue()) ; #DEBUG_LINE_NO:17
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
