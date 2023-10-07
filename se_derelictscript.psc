ScriptName SE_DerelictScript Extends Quest
{ spawn a random derelict ship }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  ActorValue Property SpaceshipCrew Auto Const mandatory
  ActorValue Property SpaceshipExternalLightsDisabledValue Auto Const mandatory
EndGroup

FormList Property DerelictShipList Auto Const mandatory
{ list of ships to randomly pick from }
ReferenceAlias Property Alias_GeneralMarker01 Auto Const mandatory
{ marker to place derelict ship at }
ReferenceAlias Property Alias_DerelictShip Auto Const mandatory
{ put ship into this alias }
sq_parentscript Property SQ_Parent Auto Const mandatory
{ SQ_Parent script, for applying damage to the derelict ship. }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.SpawnShips(DerelictShipList, Alias_DerelictShip, Alias_GeneralMarker01) ; #DEBUG_LINE_NO:22
EndEvent

Function SpawnShips(FormList akCurrentGroup, ReferenceAlias akRefColToAddTo, ReferenceAlias akSpawnMarker)
  Int indnum = Utility.RandomInt(0, akCurrentGroup.GetSize() - 1) ; #DEBUG_LINE_NO:26
  ObjectReference ADMarker = akSpawnMarker.GetRef() ; #DEBUG_LINE_NO:28
  spaceshipreference newShip = ADMarker.PlaceShipAtMe(akCurrentGroup.GetAt(indnum), 4, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:29
  newShip.DamageValue(SpaceshipCrew, newShip.GetValue(SpaceshipCrew)) ; #DEBUG_LINE_NO:30
  newShip.SetValue(SpaceshipExternalLightsDisabledValue, 1.0) ; #DEBUG_LINE_NO:31
  SQ_Parent.SetupDamagedShip(newShip, False, True, True, True, True, True, None) ; #DEBUG_LINE_NO:32
  akRefColToAddTo.ForceRefTo(newShip as ObjectReference) ; #DEBUG_LINE_NO:33
EndFunction
