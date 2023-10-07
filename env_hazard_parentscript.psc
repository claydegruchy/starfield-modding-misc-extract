ScriptName ENV_Hazard_ParentScript Extends ObjectReference Const
{ Attach this script to the Packin's PrefabPackinPivotDummy reference.
And make sure all the refs in the packin are LinkedRef'd with keyword ENV_Link_PackinMember to the PrefabPackinPivotDummy (that this script is on) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill_Properties
  Form Property PrefabPackinPivotDummy Auto Const mandatory
  { a default object that is in every instanced packin. 
	It inherits the scripts and linked refs and linked children from the packin ref placed in the render window, or otherwise spawned. }
  Keyword Property ENV_Link_PackinMember Auto Const mandatory
  { Things inside ENV Hazard packins link to the PrefabPackinPivotDummy using this keyword.
	It's how we identify refs that came from the same packin. }
  Keyword Property ENV_FXType_Ambient Auto Const mandatory
  { Things with this keyword are "ambient" fx that are okay to clip through lanscape and other objects.
	We may want to turn these on/off depending on circumstances. }
EndGroup


;-- Functions ---------------------------------------

ObjectReference[] Function GetPackinChildren()
  Return Self.GetRefsLinkedToMe(ENV_Link_PackinMember, None) ; #DEBUG_LINE_NO:23
EndFunction

ObjectReference[] Function GetExternalLinkedChildren()
  Return Self.GetRefsLinkedToMe(None, ENV_Link_PackinMember) ; #DEBUG_LINE_NO:29
EndFunction

Function DisableChildren()
  ObjectReference[] packinChildren = Self.GetPackinChildren() ; #DEBUG_LINE_NO:36
  Int I = 0 ; #DEBUG_LINE_NO:38
  While I < packinChildren.Length ; #DEBUG_LINE_NO:39
    packinChildren[I].DisableNoWait(False) ; #DEBUG_LINE_NO:40
    I += 1 ; #DEBUG_LINE_NO:41
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function EnableChildren()
  ObjectReference[] packinChildren = Self.GetPackinChildren() ; #DEBUG_LINE_NO:49
  Int I = 0 ; #DEBUG_LINE_NO:51
  While I < packinChildren.Length ; #DEBUG_LINE_NO:52
    packinChildren[I].EnableNoWait(False) ; #DEBUG_LINE_NO:53
    I += 1 ; #DEBUG_LINE_NO:54
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

ENV_Hazard_ParentScript Function GetPackinParent(ObjectReference RefToCheck, Keyword ENV_Link_PackinMember) Global
  ENV_Hazard_ParentScript parentRef = RefToCheck as ENV_Hazard_ParentScript ; #DEBUG_LINE_NO:67
  If parentRef ; #DEBUG_LINE_NO:69
    Return parentRef ; #DEBUG_LINE_NO:70
  Else ; #DEBUG_LINE_NO:
    parentRef = RefToCheck.GetLinkedRef(ENV_Link_PackinMember) as ENV_Hazard_ParentScript ; #DEBUG_LINE_NO:73
    If parentRef ; #DEBUG_LINE_NO:75
      Return parentRef ; #DEBUG_LINE_NO:76
    Else ; #DEBUG_LINE_NO:
      Return None ; #DEBUG_LINE_NO:79
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Keyword Function BetaOnly_Get_ENV_Link_PackinMember() Global
  Return Game.GetFormFromFile(1444913, "Starfield.esm") as Keyword ; #DEBUG_LINE_NO:91
EndFunction

Function LogPackinMembers(ObjectReference PackinMember) Global
  ENV_Hazard_ParentScript parentRef = ENV_Hazard_ParentScript.GetPackinParent(PackinMember, ENV_Hazard_ParentScript.BetaOnly_Get_ENV_Link_PackinMember()) ; #DEBUG_LINE_NO:100
  If parentRef == None ; #DEBUG_LINE_NO:104
    parentRef.warning(None, "LogPackinMembers() could not find a parent for PackinMember: " + PackinMember as String, 2, "EnvironmentalGameplay", "ENV_Hazard_ParentScript", False, True, True) ; #DEBUG_LINE_NO:105
    Return  ; #DEBUG_LINE_NO:106
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] packinChildren = parentRef.GetPackinChildren() ; #DEBUG_LINE_NO:111
  Int I = 0 ; #DEBUG_LINE_NO:113
  While I < packinChildren.Length ; #DEBUG_LINE_NO:114
    I += 1 ; #DEBUG_LINE_NO:117
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function LogExternalObjects(ObjectReference PackinMember) Global
  ENV_Hazard_ParentScript parentRef = ENV_Hazard_ParentScript.GetPackinParent(PackinMember, ENV_Hazard_ParentScript.BetaOnly_Get_ENV_Link_PackinMember()) ; #DEBUG_LINE_NO:124
  If parentRef == None ; #DEBUG_LINE_NO:128
    parentRef.warning(parentRef as ScriptObject, "LogExternalObjects() could not find a parent for PackinMember: " + PackinMember as String, 2, "EnvironmentalGameplay", "ENV_Hazard_ParentScript", False, True, True) ; #DEBUG_LINE_NO:129
    Return  ; #DEBUG_LINE_NO:130
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] externalChildren = parentRef.GetExternalLinkedChildren() ; #DEBUG_LINE_NO:135
  Int I = 0 ; #DEBUG_LINE_NO:137
  While I < externalChildren.Length ; #DEBUG_LINE_NO:138
    I += 1 ; #DEBUG_LINE_NO:141
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function LogAllObjects(ObjectReference PackinMember) Global
  ENV_Hazard_ParentScript.LogPackinMembers(PackinMember) ; #DEBUG_LINE_NO:146
  ENV_Hazard_ParentScript.LogExternalObjects(PackinMember) ; #DEBUG_LINE_NO:147
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:154
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:158
EndFunction

; Fixup hacks for debug-only function: GlobalWarning
Bool Function GlobalWarning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames) Global
  Return false ; #DEBUG_LINE_NO:162
EndFunction
