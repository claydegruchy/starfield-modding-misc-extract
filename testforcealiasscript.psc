ScriptName TestForceAliasScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property AliasToForce Auto Const

;-- Functions ---------------------------------------

Function ForceIntoAlias(Form myForm)
  ObjectReference myRef = myForm as ObjectReference ; #DEBUG_LINE_NO:6
  If myRef ; #DEBUG_LINE_NO:7
    AliasToForce.ForceRefTo(myRef) ; #DEBUG_LINE_NO:8
  Else ; #DEBUG_LINE_NO:
    spaceshipreference myShip = myForm as spaceshipreference ; #DEBUG_LINE_NO:10
    If myShip ; #DEBUG_LINE_NO:11
      AliasToForce.ForceRefTo(myShip as ObjectReference) ; #DEBUG_LINE_NO:12
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
