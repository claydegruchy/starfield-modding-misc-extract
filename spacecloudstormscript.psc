ScriptName SpaceCloudStormScript Extends SpaceCloudManagerScript
{ Script for Space Storm Clouds. Ships in these clouds are periodically hit by SpaceStormBolt lightning spells. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group StormCloudProperties
  Spell[] Property SpaceStormBolts Auto Const
  { Array of full-strength Space Storm Bolt spells to cast. Variants are used to vary the damage a bit. }
  Spell Property SpaceStormBolt_DamageVariantHalf Auto Const
  { A half-strength Space Storm Bolt, cast when we roll to have two bolts strike in quick succession. }
  ActorValue Property SpaceStormBoltTimestampValue Auto Const
  { Actor value used to timestamp when a bolt was last cast on each target. }
  Float Property SpaceStormBoltCastDelayMin = 1.0 Auto Const
  { Minimum delay between bolts. }
  Float Property SpaceStormBoltCastDelayMax = 2.0 Auto Const
  { Maximum delay between bolts. }
  Float Property SpaceStormBoltChanceTwoBolts = 0.200000003 Auto Const
  { Chance that, when we go to cast a SpaceStormBolt, we fire two half-strength bolts instead of a single full-strength bolt. }
  Float Property SpaceStormBoltTwoBoltDelayMin = 0.100000001 Auto Const
  { Minimum delay between double bolts. }
  Float Property SpaceStormBoltTwoBoltDelayMax = 0.5 Auto Const
  { Maximum delay between double bolts. }
EndGroup

Group Debug
  Spell Property Debug_SpaceStormBolt_DamageVariantRatio Auto Const
  ActorValue Property Debug_SpaceStormBolt_TestEffectRatioValue Auto Const
EndGroup


;-- Functions ---------------------------------------

Function ApplyCloudEffect(spaceshipreference target, Float currentTime)
  Float effectSpellTimestamp = target.GetValue(SpaceStormBoltTimestampValue) ; #DEBUG_LINE_NO:37
  If effectSpellTimestamp == 0.0 ; #DEBUG_LINE_NO:38
    target.SetValue(SpaceStormBoltTimestampValue, currentTime + Utility.RandomFloat(0.0, SpaceStormBoltCastDelayMax)) ; #DEBUG_LINE_NO:40
  ElseIf currentTime > effectSpellTimestamp || currentTime < effectSpellTimestamp - SpaceStormBoltCastDelayMax ; #DEBUG_LINE_NO:41
    If target.GetValue(Debug_SpaceStormBolt_TestEffectRatioValue) ; #DEBUG_LINE_NO:43
      Debug_SpaceStormBolt_DamageVariantRatio.Cast(target as ObjectReference, target as ObjectReference) ; #DEBUG_LINE_NO:44
    ElseIf Utility.RandomFloat(0.0, 1.0) < SpaceStormBoltChanceTwoBolts ; #DEBUG_LINE_NO:45
      SpaceStormBolt_DamageVariantHalf.Cast(target as ObjectReference, target as ObjectReference) ; #DEBUG_LINE_NO:46
      Utility.Wait(Utility.RandomFloat(SpaceStormBoltTwoBoltDelayMin, SpaceStormBoltTwoBoltDelayMax)) ; #DEBUG_LINE_NO:47
      SpaceStormBolt_DamageVariantHalf.Cast(target as ObjectReference, target as ObjectReference) ; #DEBUG_LINE_NO:48
    Else ; #DEBUG_LINE_NO:
      Spell selectedBolt = SpaceStormBolts[Utility.RandomInt(0, SpaceStormBolts.Length - 1)] ; #DEBUG_LINE_NO:50
      selectedBolt.Cast(target as ObjectReference, target as ObjectReference) ; #DEBUG_LINE_NO:51
    EndIf ; #DEBUG_LINE_NO:
    target.SetValue(SpaceStormBoltTimestampValue, currentTime + Utility.RandomFloat(SpaceStormBoltCastDelayMin, SpaceStormBoltCastDelayMax)) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RemoveCloudEffect(spaceshipreference target)
  target.SetValue(SpaceStormBoltTimestampValue, 0.0) ; #DEBUG_LINE_NO:61
EndFunction
