ScriptName TestElectrifiedWaterScript Extends ObjectReference

;-- Variables ---------------------------------------
Int instance1

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
VisualEffect Property ElectrifiedWaterEffect Auto Const mandatory
wwiseevent Property ElectrifiedWaterSound Auto Const
Bool Property bPowered = True Auto

;-- Functions ---------------------------------------

Event OnLoad()
  If bPowered ; #DEBUG_LINE_NO:16
    ElectrifiedWaterEffect.Play(Self.GetLinkedRef(LinkCustom01), -1.0, None) ; #DEBUG_LINE_NO:17
    instance1 = ElectrifiedWaterSound.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If bPowered ; #DEBUG_LINE_NO:25
    ElectrifiedWaterEffect.Stop(Self.GetLinkedRef(LinkCustom01)) ; #DEBUG_LINE_NO:26
    Self.GetLinkedRef(LinkCustom01).Disable(False) ; #DEBUG_LINE_NO:27
    wwiseevent.StopInstance(instance1) ; #DEBUG_LINE_NO:28
    bPowered = False ; #DEBUG_LINE_NO:29
  ElseIf bPowered == False ; #DEBUG_LINE_NO:30
    Self.GetLinkedRef(LinkCustom01).Enable(False) ; #DEBUG_LINE_NO:33
    Utility.Wait(0.5) ; #DEBUG_LINE_NO:34
    ElectrifiedWaterEffect.Play(Game.GetPlayer() as ObjectReference, -1.0, None) ; #DEBUG_LINE_NO:36
    instance1 = ElectrifiedWaterSound.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:37
    bPowered = True ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndEvent
