ScriptName UC01_DebugRockAliasScript Extends ReferenceAlias

;-- Structs -----------------------------------------
Struct SequenceDatum
  String Description
  { Quick editor-facing description of which sequence this is }
  Int ButtonInt
  { Message box button we're looking for. This should match the index in the UC01_ShipSim_DebugMenu message object }
  ActorValue ManagingValue
  { Actor value used to drive this sequence }
  Float ValueMax
  { Actor value level to express it's at its max }
  Float ValueMin
  { Actor value level to express it's at its min }
  Scene StartUpScene
  { Scene to play when this sequence starts }
  Scene PowerUpScene
  { Scene to play when this sequence goes from low to high }
  Scene PowerDownScene
  { Scene to play when this sequence goes from high to low }
  Scene WrapUpScene
  { Scene to play when the whole sequence is finished }
  Float MaxSwings
  { How many times we should swing between max and min }
  Float SwingTimeMin
  { The max amount of time a swing should last }
  Float SwingTimeMax
  { The min amount of time a swing should last }
EndStruct


;-- Variables ---------------------------------------
Int iSwingCount
Int iTimerID = 1 Const

;-- Properties --------------------------------------
Message Property UC01_ShipSim_DebugMenu Auto Const mandatory
{ Main debug menu }
uc01_debugrockaliasscript:sequencedatum[] Property SequenceData Auto Const mandatory
{ Collection of each sequence types data }
Quest Property UC01 Auto Const mandatory
{ UC01 base quest property }
Int Property PlayerUsedDebugSystemStage = 420 Auto Const
{ Stage to set on UC01 if the player uses this system }
Int Property ActiveSequence = -1 Auto
{ If there's a sequence active, store it here }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If ActiveSequence == -1 ; #DEBUG_LINE_NO:60
    Int ButtonReturn = UC01_ShipSim_DebugMenu.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:61
    Int iIndex = SequenceData.findstruct("ButtonInt", ButtonReturn, 0) ; #DEBUG_LINE_NO:63
    If iIndex >= 0 ; #DEBUG_LINE_NO:65
      ActiveSequence = iIndex ; #DEBUG_LINE_NO:66
      If UC01.IsRunning() ; #DEBUG_LINE_NO:68
        UC01.SetStage(PlayerUsedDebugSystemStage) ; #DEBUG_LINE_NO:69
      EndIf ; #DEBUG_LINE_NO:
      uc01_debugrockaliasscript:sequencedatum myDatum = SequenceData[ActiveSequence] ; #DEBUG_LINE_NO:72
      myDatum.StartUpScene.Start() ; #DEBUG_LINE_NO:73
      Float RandLength = Utility.RandomFloat(myDatum.SwingTimeMin, myDatum.SwingTimeMax) ; #DEBUG_LINE_NO:74
      Self.StartTimer(RandLength, iTimerID) ; #DEBUG_LINE_NO:76
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID ; #DEBUG_LINE_NO:82
    uc01_debugrockaliasscript:sequencedatum myDatum = SequenceData[ActiveSequence] ; #DEBUG_LINE_NO:83
    myDatum.WrapUpScene.Start() ; #DEBUG_LINE_NO:85
    ActiveSequence = -1 ; #DEBUG_LINE_NO:86
  EndIf ; #DEBUG_LINE_NO:
EndEvent
