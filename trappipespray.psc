ScriptName TrapPipeSpray Extends TrapBase

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TrapPipeSprayData
  ActorValue Property Health Auto Const mandatory
  ActorValue Property TRP_AV_Broken Auto Const mandatory
  ActorValue Property TRP_AV_Pressurized Auto Const mandatory
  Keyword Property TrapStartUnbrokenKeyword Auto Const mandatory
  { Add this keyword to the reference if the pipe segment should start unbroken. }
  Keyword Property LinkCustom01 Auto Const mandatory
  { Link to FX }
  Keyword Property LinkCustom02 Auto Const mandatory
  { Link to Hazard }
  Keyword Property LinkCustom03 Auto Const mandatory
  { Link to Weak PipeSegment }
  Float Property DamageThreshold = 99.0 Auto Const
EndGroup


;-- Functions ---------------------------------------

Function HandleOnLoad()
  ObjectReference PipeSegment = Self.GetLinkedRef(LinkCustom03) ; #DEBUG_LINE_NO:23
  Self.GetLinkedRef(LinkCustom02).Disable(False) ; #DEBUG_LINE_NO:24
  Self.SetValue(TRP_AV_Pressurized, 1.0) ; #DEBUG_LINE_NO:25
  Self.RegisterForActorValueLessThanEvent(PipeSegment, Health, DamageThreshold) ; #DEBUG_LINE_NO:27
  If Self.HasKeyword(TrapStartUnbrokenKeyword) == False ; #DEBUG_LINE_NO:30
    Self.BreakPipe() ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandleOnUnload()
  Self.StopSpray() ; #DEBUG_LINE_NO:37
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.BreakPipe() ; #DEBUG_LINE_NO:43
EndEvent

Function BecomeActive()
  Self.SetValue(TRP_AV_Pressurized, 1.0) ; #DEBUG_LINE_NO:48
  If Self.GetValue(TRP_AV_Broken) == 1.0 ; #DEBUG_LINE_NO:49
    Self.StartSpray() ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function BecomeInactive()
  Self.SetValue(TRP_AV_Pressurized, 0.0) ; #DEBUG_LINE_NO:56
  Self.StopSpray() ; #DEBUG_LINE_NO:57
EndFunction

Function BreakPipe()
  Self.GetLinkedRef(LinkCustom03).Disable(False) ; #DEBUG_LINE_NO:62
  Self.SetValue(TRP_AV_Broken, 1.0) ; #DEBUG_LINE_NO:63
  If Self.GetValue(TRP_AV_Pressurized) == 1.0 ; #DEBUG_LINE_NO:65
    Self.StartSpray() ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartSpray()
  Self.GetLinkedRef(LinkCustom01).PlayAnimation("Play01") ; #DEBUG_LINE_NO:73
  Self.GetLinkedRef(LinkCustom02).Enable(False) ; #DEBUG_LINE_NO:75
EndFunction

Function StopSpray()
  Self.GetLinkedRef(LinkCustom02).Disable(False) ; #DEBUG_LINE_NO:82
  Self.GetLinkedRef(LinkCustom01).PlayAnimation("StopEffect") ; #DEBUG_LINE_NO:83
EndFunction
