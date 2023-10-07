ScriptName TestAirlockScript01 Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property ArmorTypeHelmet Auto Const mandatory
Message Property TestAirlockMSG01 Auto Const mandatory
Bool Property bPowerered = True Auto

;-- Functions ---------------------------------------

Event OnInit()
  Self.BlockActivation(True, False) ; #DEBUG_LINE_NO:8
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If bPowerered ; #DEBUG_LINE_NO:13
    If Self.GetOpenState() == 3 ; #DEBUG_LINE_NO:15
      If (akActionRef as Actor).WornHasKeyword(ArmorTypeHelmet) ; #DEBUG_LINE_NO:16
        Self.Activate(akActionRef, True) ; #DEBUG_LINE_NO:18
      ElseIf akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:19
        Int ButtonPressed = 0 ; #DEBUG_LINE_NO:21
        ButtonPressed = TestAirlockMSG01.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:22
        If ButtonPressed == 1 ; #DEBUG_LINE_NO:23
          Self.Activate(akActionRef, True) ; #DEBUG_LINE_NO:25
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Self.Activate(akActionRef, True) ; #DEBUG_LINE_NO:29
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.Activate(akActionRef, True) ; #DEBUG_LINE_NO:33
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function PowerOff()
  Self.SetOpen(True) ; #DEBUG_LINE_NO:39
  bPowerered = False ; #DEBUG_LINE_NO:40
EndFunction

Function PowerOn()
  Self.SetOpen(False) ; #DEBUG_LINE_NO:44
  bPowerered = True ; #DEBUG_LINE_NO:45
EndFunction
