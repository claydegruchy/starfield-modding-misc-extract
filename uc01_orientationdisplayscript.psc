ScriptName UC01_OrientationDisplayScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SceneToPlay Auto Const mandatory
ReferenceAlias Property StarterLight Auto Const mandatory
{ Alias for the light paired to this display. Used to turn off all the lights if the player stops the sequence }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForCustomEvent((Self.GetOwningQuest() as uc01_orientationdisplayquestscript) as ScriptObject, "uc01_orientationdisplayquestscript_HaltOrientationScenes") ; #DEBUG_LINE_NO:9
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If !SceneToPlay.IsPlaying() ; #DEBUG_LINE_NO:13
    (Self.GetOwningQuest() as uc01_orientationdisplayquestscript).SendHaltScenes(Self.GetRef()) ; #DEBUG_LINE_NO:14
    SceneToPlay.Start() ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event UC01_OrientationDisplayQuestScript.HaltOrientationScenes(uc01_orientationdisplayquestscript akSenderRef, Var[] akargs)
  ObjectReference TriggeringDisplay = akargs[0] as ObjectReference ; #DEBUG_LINE_NO:20
  If TriggeringDisplay != Self.GetRef() && SceneToPlay.IsPlaying() ; #DEBUG_LINE_NO:22
    SceneToPlay.Stop() ; #DEBUG_LINE_NO:23
    (StarterLight.GetRef() as uc01_lighttimingrefscript).TriggerLightUpdate(True) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent
