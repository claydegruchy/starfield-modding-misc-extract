ScriptName BuriedArtifact Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group SharedDefaults collapsedonref
  wwiseevent Property VisionAmbient Auto Const
  { The ambient sound that leads into the vision }
  VisualEffect Property VisionEffects Auto Const
  { The visual component of the vision. }
  MusicType Property VisionMusic Auto Const
  { Music To Play during the vision, should be flagged as "Plays One Selection" }
  inputenablelayer Property ArtifactEnableLayer Auto hidden
EndGroup

Bool Property PickupEnabled = False Auto
ObjectReference Property FXlights Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If PickupEnabled ; #DEBUG_LINE_NO:21
    ArtifactEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:22
    ArtifactEnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:25
    FXlights.Enable(False) ; #DEBUG_LINE_NO:26
    PickupEnabled = False ; #DEBUG_LINE_NO:28
    Self.SendCustomEvent("buriedartifact_OnArtifactAcquireStarted", None) ; #DEBUG_LINE_NO:29
    If VisionEffects ; #DEBUG_LINE_NO:31
      VisionEffects.Play(Game.GetPlayer() as ObjectReference, -1.0, None) ; #DEBUG_LINE_NO:32
    EndIf ; #DEBUG_LINE_NO:
    If VisionMusic ; #DEBUG_LINE_NO:34
      VisionMusic.Add() ; #DEBUG_LINE_NO:35
    EndIf ; #DEBUG_LINE_NO:
    VisionAmbient.PlayAndWait(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:37
    Self.ArtifactAcquired() ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ArtifactAcquired()
  If VisionEffects ; #DEBUG_LINE_NO:44
    VisionEffects.Stop(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
  ArtifactEnableLayer.Delete() ; #DEBUG_LINE_NO:47
  Self.SendCustomEvent("buriedartifact_OnArtifactAcquireEnded", None) ; #DEBUG_LINE_NO:48
EndFunction
