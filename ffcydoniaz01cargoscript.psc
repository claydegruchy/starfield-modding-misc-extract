ScriptName FFCydoniaZ01CargoScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Cargo Auto Const mandatory
ReferenceAlias Property Cargo01 Auto Const mandatory
Int Property StageToSet Auto Const mandatory
Message Property FFCydoniaZ01_Cargo_Leech01_MSG Auto Const mandatory
Message Property FFCydoniaZ01_Cargo_Leech02_MSG Auto Const mandatory
Message Property FFCydoniaZ01_Cargo_NoLeech01_MSG Auto Const mandatory
Message Property FFCydoniaZ01_Cargo_NoLeech02_MSG Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory

;-- Functions ---------------------------------------

Function CheckCount()
  If Cargo.GetCount() <= 0 ; #DEBUG_LINE_NO:15
    Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  Int iRandom = Utility.RandomInt(1, 2) ; #DEBUG_LINE_NO:23
  ObjectReference myLinkedRef = akSenderRef.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:24
  If myLinkedRef ; #DEBUG_LINE_NO:25
    If iRandom == 1 ; #DEBUG_LINE_NO:26
      FFCydoniaZ01_Cargo_Leech01_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:27
    Else ; #DEBUG_LINE_NO:
      FFCydoniaZ01_Cargo_Leech02_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:29
    EndIf ; #DEBUG_LINE_NO:
    myLinkedRef.Enable(True) ; #DEBUG_LINE_NO:31
    (myLinkedRef as Actor).StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:32
  ElseIf iRandom == 1 ; #DEBUG_LINE_NO:34
    FFCydoniaZ01_Cargo_NoLeech01_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:35
  Else ; #DEBUG_LINE_NO:
    FFCydoniaZ01_Cargo_NoLeech02_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  If akSenderRef == Cargo01.GetRef() ; #DEBUG_LINE_NO:41
    Cargo01.Clear() ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
  Cargo.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:44
  akSenderRef.BlockActivation(True, True) ; #DEBUG_LINE_NO:45
  Self.CheckCount() ; #DEBUG_LINE_NO:46
EndEvent
