ScriptName KidStuffPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory
Location Property CityNewAtlantisKidStuffHomeLocation Auto Const mandatory
Location Property CityAkilaCityLocation Auto Const mandatory
Location Property CityNeonTradeTowerAstralLoungeLocation Auto Const mandatory
ReferenceAlias Property Dad Auto Const
ReferenceAlias Property Mom Auto Const
ReferenceAlias Property LodgeMarker Auto Const

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:17
  ObjectReference oDad = Dad.GetRef() ; #DEBUG_LINE_NO:18
  ObjectReference oMom = Mom.GetRef() ; #DEBUG_LINE_NO:19
  If !MyQuest.GetStageDone(300) && MyQuest.GetStageDone(30) && LodgeMarker.GetRef().IsDisabled() ; #DEBUG_LINE_NO:24
    MyQuest.SetStage(40) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
  If MyQuest.GetStageDone(300) ; #DEBUG_LINE_NO:29
    If akNewLoc == CityNewAtlantisKidStuffHomeLocation ; #DEBUG_LINE_NO:31
      oDad.MoveTo(oDad.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
      oMom.MoveTo(oDad.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:34
    EndIf ; #DEBUG_LINE_NO:
    If akNewLoc == CityNeonTradeTowerAstralLoungeLocation && !MyQuest.GetStageDone(2000) ; #DEBUG_LINE_NO:38
      oDad.MoveTo(oDad.GetLinkedRef(LinkCustom01), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:39
      (oDad as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:40
      oMom.MoveTo(oDad.GetLinkedRef(LinkCustom01), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:41
      (oMom as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:42
    EndIf ; #DEBUG_LINE_NO:
    If akNewLoc == CityAkilaCityLocation && !MyQuest.GetStageDone(2100) ; #DEBUG_LINE_NO:46
      oDad.MoveTo(oDad.GetLinkedRef(LinkCustom02), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:48
      (oDad as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:49
      oMom.MoveTo(oDad.GetLinkedRef(LinkCustom02), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:50
      (oMom as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:51
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
