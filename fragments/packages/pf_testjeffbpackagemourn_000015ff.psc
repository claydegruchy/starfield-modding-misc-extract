ScriptName Fragments:Packages:PF_TestJeffBPackageMourn_000015FF Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
idlemarker Property myIdleMarker Auto Const
Furniture Property myfurniture1 Auto Const
Furniture Property myFurniture2 Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  Bool doOnce = False ; #DEBUG_LINE_NO:7
  Int rand = Utility.RandomInt(0, 2) ; #DEBUG_LINE_NO:8
  If doOnce == False ; #DEBUG_LINE_NO:9
    doOnce = True ; #DEBUG_LINE_NO:10
    If rand == 0 ; #DEBUG_LINE_NO:11
      akActor.placeAtMe(myIdleMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:12
    ElseIf rand == 1 ; #DEBUG_LINE_NO:13
      akActor.placeAtMe(myfurniture1 as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:14
    Else ; #DEBUG_LINE_NO:
      akActor.placeAtMe(myFurniture2 as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:16
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
