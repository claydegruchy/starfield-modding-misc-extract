ScriptName TestMultiActorSceneScript Extends ObjectReference Const

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
ObjectReference Property Chair Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:14
    Int ButtonValue = TestMultiActorMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:15
    If ButtonValue == 0 ; #DEBUG_LINE_NO:16
      SecondPerson.Moveto(SidebySide, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:17
    ElseIf ButtonValue == 1 ; #DEBUG_LINE_NO:18
      SecondPerson.Moveto(Width, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:19
    ElseIf ButtonValue == 2 ; #DEBUG_LINE_NO:20
      SecondPerson.Moveto(Depth, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:21
    ElseIf ButtonValue == 3 ; #DEBUG_LINE_NO:22
      SecondPerson.Moveto(Combo, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
    ElseIf ButtonValue == 4 ; #DEBUG_LINE_NO:24
      SecondPerson.Moveto(Chair, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:25
    EndIf ; #DEBUG_LINE_NO:
    FirstPerson.Moveto(FirstMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndEvent
