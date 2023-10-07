ScriptName SpaceCloudDistortionScript Extends SpaceCloudManagerScript
{ Script for Space Distortion Clouds. Ships in these clouds are given a perk that reduces incoming damage. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group DistortionCloudProperties
  Perk Property EffectPerk Auto Const
  { Perk to apply to ships within the cloud. }
EndGroup


;-- Functions ---------------------------------------

Function ApplyCloudEffect(spaceshipreference target, Float currentTime)
  If target.GetValue(UpdateTimestampValue) == 0.0 ; #DEBUG_LINE_NO:11
    target.AddPerk(EffectPerk, False) ; #DEBUG_LINE_NO:13
    If target == PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:14
      Game.GetPlayer().AddPerk(EffectPerk, False) ; #DEBUG_LINE_NO:15
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RemoveCloudEffect(spaceshipreference target)
  target.RemovePerk(EffectPerk) ; #DEBUG_LINE_NO:22
  If target == PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:23
    Game.GetPlayer().RemovePerk(EffectPerk) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndFunction
