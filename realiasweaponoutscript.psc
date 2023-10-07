ScriptName REAliasWeaponOutScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
reweaponoutscript Property myScript Auto

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForCustomEvent(myScript as ScriptObject, "reweaponoutscript_OnWeaponAway") ; #DEBUG_LINE_NO:7
EndEvent

Event REWeaponOutScript.OnWeaponAway(reweaponoutscript akSender, Var[] akArgs)
  Self.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:13
EndEvent
