ScriptName City_NA_Well01_Lever01Script Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Light01 Auto
ReferenceAlias Property Light02 Auto
ReferenceAlias Property Light03 Auto
ReferenceAlias Property Light04 Auto
ReferenceAlias Property ActiveLight Auto
ReferenceAlias Property Lever01 Auto
ReferenceAlias Property Lever02 Auto
ReferenceAlias Property Lever03 Auto
ReferenceAlias Property Lever04 Auto
ReferenceAlias Property LightIndicator Auto Const
Quest Property City_NA_Well01 Auto Const mandatory
ObjectReference Property MySelf Auto
GlobalVariable Property City_NA_Well01_Light01State Auto Const mandatory
GlobalVariable Property City_NA_Well01_Light02State Auto Const mandatory
GlobalVariable Property City_NA_Well01_Light03State Auto Const mandatory
GlobalVariable Property City_NA_Well01_Light04State Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akactionref)
  MySelf = Self.GetReference() ; #DEBUG_LINE_NO:29
  If MySelf == Lever01.GetReference() ; #DEBUG_LINE_NO:31
    (Light01 as city_na_well01_lightscript).SwapState() ; #DEBUG_LINE_NO:33
    (Light02 as city_na_well01_lightscript).SwapState() ; #DEBUG_LINE_NO:34
  ElseIf MySelf == Lever02.GetReference() ; #DEBUG_LINE_NO:36
    (Light01 as city_na_well01_lightscript).SwapState() ; #DEBUG_LINE_NO:38
    (Light03 as city_na_well01_lightscript).SwapState() ; #DEBUG_LINE_NO:39
  ElseIf MySelf == Lever03.GetReference() ; #DEBUG_LINE_NO:41
    (Light02 as city_na_well01_lightscript).SwapState() ; #DEBUG_LINE_NO:43
    (Light04 as city_na_well01_lightscript).SwapState() ; #DEBUG_LINE_NO:44
  ElseIf MySelf == Lever04.GetReference() ; #DEBUG_LINE_NO:46
    (Light01 as city_na_well01_lightscript).SwapState() ; #DEBUG_LINE_NO:48
    (Light04 as city_na_well01_lightscript).SwapState() ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
  If City_NA_Well01_Light01State.GetValueInt() == 1 && City_NA_Well01_Light02State.GetValueInt() == 1 && City_NA_Well01_Light03State.GetValueInt() == 1 && City_NA_Well01_Light04State.GetValueInt() == 1 ; #DEBUG_LINE_NO:53
    City_NA_Well01.SetStage(185) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
EndEvent
