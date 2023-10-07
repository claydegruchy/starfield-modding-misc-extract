ScriptName TestElectricityArcScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property bPowered = True Auto
Spell Property ElectricitySpell Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory
Bool Property bRandomTarget = False Auto
{ Set to true if you want this to arc to the player randomly if they're nearby }

;-- Functions ---------------------------------------

Event OnLoad()
  If bPowered && bRandomTarget ; #DEBUG_LINE_NO:16
    Self.ElectrifyRandomTarget() ; #DEBUG_LINE_NO:17
  ElseIf bPowered ; #DEBUG_LINE_NO:
    Self.ElectrifyTarget() ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If bPowered ; #DEBUG_LINE_NO:26
    bPowered = False ; #DEBUG_LINE_NO:27
  ElseIf bPowered == False && bRandomTarget ; #DEBUG_LINE_NO:28
    bPowered = True ; #DEBUG_LINE_NO:29
    Self.ElectrifyRandomTarget() ; #DEBUG_LINE_NO:30
  ElseIf bPowered == False ; #DEBUG_LINE_NO:31
    Self.ElectrifyTarget() ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ElectrifyTarget()
  While bPowered ; #DEBUG_LINE_NO:
    Float fRandom = Utility.RandomFloat(0.200000003, 3.0) ; #DEBUG_LINE_NO:40
    ElectricitySpell.Cast(Self.GetLinkedRef(LinkCustom01), Self.GetLinkedRef(LinkCustom02)) ; #DEBUG_LINE_NO:41
    Utility.Wait(fRandom) ; #DEBUG_LINE_NO:42
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ElectrifyRandomTarget()
  While bPowered ; #DEBUG_LINE_NO:
    Int iRandom = Utility.RandomInt(1, 100) ; #DEBUG_LINE_NO:50
    Float fRandom = Utility.RandomFloat(0.200000003, 3.0) ; #DEBUG_LINE_NO:51
    Float fDistance = Game.GetPlayer().GetDistance(Self.GetLinkedRef(LinkCustom01)) ; #DEBUG_LINE_NO:52
    If iRandom <= 50 && fDistance < 12.0 ; #DEBUG_LINE_NO:53
      ElectricitySpell.Cast(Self.GetLinkedRef(LinkCustom01), Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:54
    Else ; #DEBUG_LINE_NO:
      ElectricitySpell.Cast(Self.GetLinkedRef(LinkCustom01), Self.GetLinkedRef(LinkCustom02)) ; #DEBUG_LINE_NO:56
    EndIf ; #DEBUG_LINE_NO:
    Utility.Wait(fRandom) ; #DEBUG_LINE_NO:58
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
