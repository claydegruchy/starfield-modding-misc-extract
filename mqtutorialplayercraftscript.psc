ScriptName MQTutorialPlayerCraftScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet = 100 Auto Const

;-- Functions ---------------------------------------

Event OnPlayerModArmorWeapon(Form akBaseObject, objectmod akModBaseObject)
  Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:7
EndEvent

Event OnPlayerCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)
  Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:11
EndEvent
