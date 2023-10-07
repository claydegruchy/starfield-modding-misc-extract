ScriptName CityNAMASTElevatorActivatorScript Extends ObjectReference conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MASTElevatorMessage Auto Const mandatory
GlobalVariable Property MASTDestinationGlobal Auto
ObjectReference Property LobbyMarker Auto Const
ObjectReference Property SubsectionMarker Auto Const
ObjectReference Property VanguardMarker Auto Const
ObjectReference Property MilitaryMarker Auto Const
ObjectReference Property ScienceMarker Auto Const
ObjectReference Property CabinetMarker Auto Const
ObjectReference Property NATMarker Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Int iButton = 0 ; #DEBUG_LINE_NO:13
  iButton = MASTElevatorMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:15
  If iButton == 0 ; #DEBUG_LINE_NO:17
    MASTDestinationGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:18
    Game.FastTravel(CabinetMarker) ; #DEBUG_LINE_NO:19
  ElseIf iButton == 1 ; #DEBUG_LINE_NO:20
    MASTDestinationGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:21
    Game.FastTravel(ScienceMarker) ; #DEBUG_LINE_NO:22
  ElseIf iButton == 2 ; #DEBUG_LINE_NO:23
    MASTDestinationGlobal.SetValue(2.0) ; #DEBUG_LINE_NO:24
    Game.FastTravel(MilitaryMarker) ; #DEBUG_LINE_NO:25
  ElseIf iButton == 3 ; #DEBUG_LINE_NO:26
    MASTDestinationGlobal.SetValue(3.0) ; #DEBUG_LINE_NO:27
    Game.FastTravel(LobbyMarker) ; #DEBUG_LINE_NO:28
  ElseIf iButton == 4 ; #DEBUG_LINE_NO:29
    Game.FastTravel(NATMarker) ; #DEBUG_LINE_NO:30
  ElseIf iButton == 5 ; #DEBUG_LINE_NO:31
    Game.FastTravel(VanguardMarker) ; #DEBUG_LINE_NO:32
  ElseIf iButton == 6 ; #DEBUG_LINE_NO:33
    Game.FastTravel(SubsectionMarker) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
EndEvent
