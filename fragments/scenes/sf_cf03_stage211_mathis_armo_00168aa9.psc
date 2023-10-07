ScriptName Fragments:Scenes:SF_CF03_Stage211_Mathis_Armo_00168AA9 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF03_ArmoryWeaponCase Auto Const
ReferenceAlias Property Alias_CF03_ArmoryWeaponCaseCollision Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  ObjectReference weaponCase = Alias_CF03_ArmoryWeaponCase.GetRef() ; #DEBUG_LINE_NO:7
  weaponCase.BlockActivation(True, True) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Phase_03_Begin()
  ObjectReference weaponCase = Alias_CF03_ArmoryWeaponCase.GetRef() ; #DEBUG_LINE_NO:16
  weaponCase.Unlock(False) ; #DEBUG_LINE_NO:17
  weaponCase.SetOpen(True) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Phase_05_Begin()
  Self.GetOwningQuest().SetStageNoWait(213) ; #DEBUG_LINE_NO:26
EndFunction
