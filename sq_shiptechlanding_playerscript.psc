ScriptName SQ_ShipTechLanding_PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property ShipTechnicians Auto Const
Scene Property SQ_ShipTechniciansLandingScene Auto Const
Quest Property SQ_ShipTechniciansLanding Auto Const mandatory

;-- Functions ---------------------------------------

Event OnHomeShipSet(spaceshipreference akShip, spaceshipreference akPrevious)
  SQ_ShipTechniciansLanding.SetStage(200) ; #DEBUG_LINE_NO:11
  Int I = 0 ; #DEBUG_LINE_NO:14
  Int iLength = ShipTechnicians.GetCount() ; #DEBUG_LINE_NO:15
  While I < iLength ; #DEBUG_LINE_NO:17
    Actor CurrentShipTech = ShipTechnicians.GetAt(I) as Actor ; #DEBUG_LINE_NO:18
    If CurrentShipTech.IsDead() == False && CurrentShipTech.IsDisabled() == False ; #DEBUG_LINE_NO:19
      CurrentShipTech.MoveToMyEditorLocation() ; #DEBUG_LINE_NO:21
      CurrentShipTech.Reset(None) ; #DEBUG_LINE_NO:22
      CurrentShipTech.EvaluatePackage(False) ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:25
  EndWhile ; #DEBUG_LINE_NO:
  SQ_ShipTechniciansLandingScene.Stop() ; #DEBUG_LINE_NO:29
  SQ_ShipTechniciansLanding.Stop() ; #DEBUG_LINE_NO:30
EndEvent
