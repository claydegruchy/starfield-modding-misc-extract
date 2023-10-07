ScriptName UCR05_PlayerAliasStartUpScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UCR05 Auto Const mandatory
Location Property POI063SubsectionSevenLocation Auto Const mandatory
{ Subsection seven location. Used to know if we should start up or shut down UCR05 }
GlobalVariable Property UCR05_Enabled Auto Const mandatory
{ Global used to manage if UCR05's been enabled by the end of UC09 }
Int Property QuietShutdownStage = 9000 Auto Const
{ Stage to set to shut down UCR05 quietly }
Int Property QuestActiveStage = 75 Auto Const
{ When this stage is set, the quest has been accepted and will stay available for the player }

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If UCR05_Enabled.GetValue() >= 1.0 ; #DEBUG_LINE_NO:18
    If akNewLoc == POI063SubsectionSevenLocation && !UCR05.IsRunning() && !UCR05.GetStageDone(QuietShutdownStage) ; #DEBUG_LINE_NO:19
      UCR05.Start() ; #DEBUG_LINE_NO:20
    ElseIf akOldLoc == POI063SubsectionSevenLocation && !UCR05.GetStageDone(QuestActiveStage) ; #DEBUG_LINE_NO:21
      UCR05.SetStage(QuietShutdownStage) ; #DEBUG_LINE_NO:22
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
