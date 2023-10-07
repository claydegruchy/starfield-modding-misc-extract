ScriptName Fragments:Perks:PRKF_TestTradePerk_00001E96 Extends Perk Const hidden

;-- Functions ---------------------------------------

Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
  (akTargetRef as Actor).ShowBarterMenu() ; #DEBUG_LINE_NO:7
EndFunction
