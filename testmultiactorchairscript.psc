ScriptName TestMultiActorChairScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property TestMultiActorMSG Auto Const
ObjectReference Property FirstPerson Auto Const
ObjectReference Property SecondPerson Auto Const
ObjectReference Property SidebySide Auto Const
ObjectReference Property Width Auto Const
ObjectReference Property Depth Auto Const
ObjectReference Property Combo Auto Const
ObjectReference Property FirstMarker Auto Const
Scene Property TestTwoPersonSceneNonPlayerScene Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:14
    Int ButtonValue = TestMultiActorMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:15
    If ButtonValue == 0 ; #DEBUG_LINE_NO:16
      SecondPerson.Disable(False) ; #DEBUG_LINE_NO:17
      SecondPerson.SetLinkedRef(SidebySide, None, True) ; #DEBUG_LINE_NO:18
      SecondPerson.Moveto(SidebySide, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:19
      SecondPerson.Enable(False) ; #DEBUG_LINE_NO:20
    ElseIf ButtonValue == 1 ; #DEBUG_LINE_NO:21
      SecondPerson.Disable(False) ; #DEBUG_LINE_NO:22
      SecondPerson.SetLinkedRef(Width, None, True) ; #DEBUG_LINE_NO:23
      SecondPerson.Moveto(Width, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:24
      SecondPerson.Enable(False) ; #DEBUG_LINE_NO:25
    ElseIf ButtonValue == 2 ; #DEBUG_LINE_NO:26
      SecondPerson.Moveto(Depth, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
      SecondPerson.Disable(False) ; #DEBUG_LINE_NO:28
      SecondPerson.SetLinkedRef(Depth, None, True) ; #DEBUG_LINE_NO:29
      SecondPerson.Moveto(Depth, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:30
      SecondPerson.Enable(False) ; #DEBUG_LINE_NO:31
    ElseIf ButtonValue == 3 ; #DEBUG_LINE_NO:32
      SecondPerson.Disable(False) ; #DEBUG_LINE_NO:33
      SecondPerson.SetLinkedRef(Combo, None, True) ; #DEBUG_LINE_NO:34
      SecondPerson.Moveto(Combo, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:35
      SecondPerson.Enable(False) ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
