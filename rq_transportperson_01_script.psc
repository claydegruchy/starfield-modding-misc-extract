ScriptName RQ_TransportPerson_01_Script Extends RQ_TransportPersonScript

;-- Variables ---------------------------------------
Bool assignedAVs = False

;-- Properties --------------------------------------
Group TransportPerson_Properties
  ActorValue Property RQ_AV_TransportPerson_01_HabitatProblem Auto Const mandatory
  ActorValue Property RQ_AV_TransportPerson_01_ShipProblem Auto Const mandatory
  Int Property HabitatProblemLineCount = 8 Auto Const
  { The number of randomly selectable dialogue lines related to the Quest Giver's habitat problems. }
  Int Property ShipProblemLineCount = 8 Auto Const
  { The number of randomly selectable dialogue lines related to the Quest Giver's ship problems. }
EndGroup


;-- Functions ---------------------------------------

Function OnQuestGiverSet(ObjectReference akQuestGiver)
  If !assignedAVs ; #DEBUG_LINE_NO:17
    assignedAVs = True ; #DEBUG_LINE_NO:18
    akQuestGiver.SetValue(RQ_AV_TransportPerson_01_HabitatProblem, Utility.RandomInt(0, HabitatProblemLineCount - 1) as Float) ; #DEBUG_LINE_NO:20
    akQuestGiver.SetValue(RQ_AV_TransportPerson_01_ShipProblem, Utility.RandomInt(0, ShipProblemLineCount - 1) as Float) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndFunction
