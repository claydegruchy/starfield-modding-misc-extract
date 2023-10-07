ScriptName City_NA_JunctionBox04Script Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Light_Indicator Auto Const
Quest Property City_NA_Well01 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference AkActionRef)
  If City_NA_Well01.GetStageDone(185) ; #DEBUG_LINE_NO:10
    City_NA_Well01.SetStage(190) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent
