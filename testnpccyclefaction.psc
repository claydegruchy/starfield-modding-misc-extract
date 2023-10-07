ScriptName TestNPCCycleFaction Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property teamFactionToChange = 1 Auto Const
{ 1. Red, 2. Blue }
FormList Property AllFactionFormList Auto Const mandatory
{ Form List of FormLists, for complete list of factions }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference SpawnControllerFromLink = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:11
  If SpawnControllerFromLink ; #DEBUG_LINE_NO:12
    FormList oldFactionList = (SpawnControllerFromLink as testnpcarenascript).GetFactionFormList(teamFactionToChange) ; #DEBUG_LINE_NO:14
    Int currentIndex = AllFactionFormList.Find(oldFactionList as Form) ; #DEBUG_LINE_NO:17
    Int newIndex = 0 ; #DEBUG_LINE_NO:20
    If currentIndex >= 0 ; #DEBUG_LINE_NO:21
      If currentIndex != AllFactionFormList.GetSize() - 1 ; #DEBUG_LINE_NO:22
        newIndex = currentIndex + 1 ; #DEBUG_LINE_NO:23
      EndIf ; #DEBUG_LINE_NO:
      FormList newFactionList = AllFactionFormList.GetAt(newIndex) as FormList ; #DEBUG_LINE_NO:26
      (SpawnControllerFromLink as testnpcarenascript).SetFactionToSpawn(newFactionList, teamFactionToChange) ; #DEBUG_LINE_NO:29
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
