ScriptName TESTMoveNPCOnUnload Extends ReferenceAlias
{ Test script to jump an NPC between various interior/exterior locations that aren't finished yet }

;-- Structs -----------------------------------------
Struct MoveData
  Int StageToCheck
  ObjectReference TeleportMarker
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
testmovenpconunload:movedata[] Property MoveDataArray Auto
{ Array for the set stages and the locations to jump the NPC to }

;-- Functions ---------------------------------------

Event OnUnload()
  Int I = 0 ; #DEBUG_LINE_NO:13
  Int iLength = MoveDataArray.Length ; #DEBUG_LINE_NO:14
  Quest myInst = Self.GetOwningQuest() ; #DEBUG_LINE_NO:15
  While I < iLength ; #DEBUG_LINE_NO:17
    testmovenpconunload:movedata currData = MoveDataArray[I] ; #DEBUG_LINE_NO:18
    Int currStage = currData.StageToCheck ; #DEBUG_LINE_NO:19
    If myInst.GetStageDone(currStage) ; #DEBUG_LINE_NO:21
      Self.GetRef().MoveTo(currData.TeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:22
      MoveDataArray.remove(I, 1) ; #DEBUG_LINE_NO:23
      Return  ; #DEBUG_LINE_NO:24
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:27
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
