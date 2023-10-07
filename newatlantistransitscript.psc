ScriptName NewAtlantisTransitScript Extends ObjectReference
{ Controls the transit system for New Atlantis }

;-- Variables ---------------------------------------
Bool carWaiting = False
ObjectReference myLinkCustom01
ObjectReference myTrack
Bool playerInsideCar = False

;-- Properties --------------------------------------
String Property offRamp = "offRamp" Auto Const
{ event to call the car off the line }
String Property onRamp = "takeOff" Auto Const
{ event to call the car back on the line }
String Property offRampDone = "IdleStop" Auto Const
{ event that fires when offRamp is done }
Keyword Property LinkCustom01 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  myTrack = Self.getLinkedRef(None) ; #DEBUG_LINE_NO:23
  myLinkCustom01 = Self.getLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:24
  Self.RegisterForRemoteEvent(myLinkCustom01 as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:25
  Self.RegisterForRemoteEvent(myLinkCustom01 as ScriptObject, "OnTriggerLeave") ; #DEBUG_LINE_NO:26
  Self.RegisterForRemoteEvent(myTrack as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:27
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && carWaiting == False ; #DEBUG_LINE_NO:33
    myTrack.PlayAnimationAndWait(offRamp, offRampDone) ; #DEBUG_LINE_NO:34
    carWaiting = True ; #DEBUG_LINE_NO:35
    myLinkCustom01.enable(False) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:45
    If carWaiting == True ; #DEBUG_LINE_NO:46
      playerInsideCar = True ; #DEBUG_LINE_NO:48
    EndIf ; #DEBUG_LINE_NO:
    Self.RegisterForRemoteEvent(myLinkCustom01 as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSender, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:57
    playerInsideCar = False ; #DEBUG_LINE_NO:58
    Self.RegisterForRemoteEvent(myLinkCustom01 as ScriptObject, "OnTriggerLeave") ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:66
    If carWaiting == True && playerInsideCar == True ; #DEBUG_LINE_NO:67
      carWaiting = False ; #DEBUG_LINE_NO:69
      myTrack.PlayAnimation(onRamp) ; #DEBUG_LINE_NO:70
    ElseIf carWaiting == False ; #DEBUG_LINE_NO:71
      myTrack.PlayAnimationAndWait(offRamp, offRampDone) ; #DEBUG_LINE_NO:73
      carWaiting = True ; #DEBUG_LINE_NO:74
    EndIf ; #DEBUG_LINE_NO:
    Self.RegisterForRemoteEvent(myTrack as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
EndEvent
