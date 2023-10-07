ScriptName DBTestRuntimeDecalScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
textureset Property DecalPuddleMd01 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.PlaceTestDecal() ; #DEBUG_LINE_NO:6
EndEvent

Function PlaceTestDecal()
  Self.PlaceAtMe(DecalPuddleMd01 as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:10
EndFunction
