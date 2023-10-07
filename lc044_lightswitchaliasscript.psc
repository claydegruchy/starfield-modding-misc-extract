ScriptName LC044_LightSwitchAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property LightsToEnable Auto Const mandatory
ReferenceAlias Property LightsToDisable Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference LightsEnableRef = LightsToEnable.GetRef() ; #DEBUG_LINE_NO:8
  If LightsEnableRef.IsEnabled() ; #DEBUG_LINE_NO:10
    LightsEnableRef.Disable(False) ; #DEBUG_LINE_NO:11
    If LightsToDisable.GetRef() != None ; #DEBUG_LINE_NO:12
      LightsToDisable.GetRef().Enable(False) ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    LightsEnableRef.Enable(False) ; #DEBUG_LINE_NO:16
    If LightsToDisable.GetRef() != None ; #DEBUG_LINE_NO:17
      LightsToDisable.GetRef().Disable(False) ; #DEBUG_LINE_NO:18
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
