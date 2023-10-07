ScriptName UC04_SoldierValueTopicInfoScript Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property FireTeamMarine Auto Const mandatory
{ Ref alias for the standard Fire Team Marine }
ReferenceAlias Property FireTeamMarineCaptain Auto Const mandatory
{ Ref alias for the Fire Team Marine Captain }
ActorValue Property UC04_SoldierPackageValue Auto Const mandatory
{ Actor value used to manage the team's behavior }
Int Property ActivityValue Auto Const mandatory
{ What value this topic should set on the marines }
Weapon Property WeaponToEquip Auto Const
{ If the soldier needs to equip a different weapon, have them do so here }

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  Actor MarineCaptain = FireTeamMarineCaptain.GetActorRef() ; #DEBUG_LINE_NO:19
  Actor Marine = FireTeamMarine.GetActorRef() ; #DEBUG_LINE_NO:20
  Marine.SetValue(UC04_SoldierPackageValue, ActivityValue as Float) ; #DEBUG_LINE_NO:22
  MarineCaptain.SetValue(UC04_SoldierPackageValue, ActivityValue as Float) ; #DEBUG_LINE_NO:23
  If WeaponToEquip != None && !MarineCaptain.IsEquipped(WeaponToEquip as Form) ; #DEBUG_LINE_NO:25
    MarineCaptain.EquipItem(WeaponToEquip as Form, False, False) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
  If WeaponToEquip != None && !Marine.IsEquipped(WeaponToEquip as Form) ; #DEBUG_LINE_NO:29
    Marine.EquipItem(WeaponToEquip as Form, False, False) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
  Marine.EvaluatePackage(False) ; #DEBUG_LINE_NO:33
  MarineCaptain.EvaluatePackage(False) ; #DEBUG_LINE_NO:34
EndEvent
