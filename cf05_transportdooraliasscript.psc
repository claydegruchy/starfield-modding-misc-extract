ScriptName CF05_TransportDoorAliasScript Extends ReferenceAlias
{ Script to display objectives to find keys for locked doors leading to the different sections of SY-920. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property KeyToCheck Auto Const mandatory
{ The key required to unlock the door. }
Int Property iHasKeyStage Auto Const mandatory
{ The stage to set when elevator is activated. }
Int Property iNoKeyStage Auto Const mandatory
{ The stage to set to display the objective to find the key. }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:15
  If akActionRef == PlayerRef && PlayerRef.GetItemCount(KeyToCheck as Form) <= 0 ; #DEBUG_LINE_NO:17
    Self.GetOwningQuest().SetStage(iNoKeyStage) ; #DEBUG_LINE_NO:18
  ElseIf akActionRef == PlayerRef ; #DEBUG_LINE_NO:19
    Self.GetOwningQuest().SetStage(iHasKeyStage) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent
