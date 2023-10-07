ScriptName UC04_ToggleHallScreens Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property MinisterHall_Screens Auto Const mandatory
{ Collection that contains all the screens in the Minister's Hall }

;-- Functions ---------------------------------------

Function UpdateHallScreens(Bool bTurnOn)
  Int I = 0 ; #DEBUG_LINE_NO:7
  Int iCount = MinisterHall_Screens.GetCount() ; #DEBUG_LINE_NO:8
  While I < iCount ; #DEBUG_LINE_NO:10
    ObjectReference currACT = MinisterHall_Screens.GetAt(I) ; #DEBUG_LINE_NO:11
    If bTurnOn ; #DEBUG_LINE_NO:13
      currACT.PlayAnimation("Stage01_Start") ; #DEBUG_LINE_NO:14
    Else ; #DEBUG_LINE_NO:
      currACT.PlayAnimation("Stage01_Stop") ; #DEBUG_LINE_NO:16
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:19
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
