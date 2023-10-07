ScriptName VendorInfoScript Extends TopicInfo Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If Utility.IsGameMenuPaused() == False ; #DEBUG_LINE_NO:6
    Actor vendorRef = None ; #DEBUG_LINE_NO:7
    spaceshipreference vendorShipRef = None ; #DEBUG_LINE_NO:8
    If akSpeakerRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:9
      vendorRef = (akSpeakerRef as Actor).GetDialogueTarget() ; #DEBUG_LINE_NO:10
    Else ; #DEBUG_LINE_NO:
      vendorRef = akSpeakerRef as Actor ; #DEBUG_LINE_NO:12
      If vendorRef == None ; #DEBUG_LINE_NO:13
        vendorShipRef = akSpeakerRef as spaceshipreference ; #DEBUG_LINE_NO:14
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If vendorShipRef ; #DEBUG_LINE_NO:17
      Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:20
      vendorShipRef.ShowBarterMenu() ; #DEBUG_LINE_NO:21
    ElseIf vendorRef ; #DEBUG_LINE_NO:
      Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:25
      vendorRef.ShowBarterMenu() ; #DEBUG_LINE_NO:26
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
