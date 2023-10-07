ScriptName COM_Quest_Andreja_Q01_PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Int PlayerInShipStage = 210
Int ReadyForShipStage = 175

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEnterShipInterior(ObjectReference akShip)
  Quest myCOM_Andreja_Quest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:9
  spaceshipreference PlayerShipREF = PlayerShip.GetShipReference() ; #DEBUG_LINE_NO:10
  If akShip == PlayerShipREF as ObjectReference ; #DEBUG_LINE_NO:11
    If myCOM_Andreja_Quest.GetStageDone(ReadyForShipStage) ; #DEBUG_LINE_NO:12
      myCOM_Andreja_Quest.SetStage(PlayerInShipStage) ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
