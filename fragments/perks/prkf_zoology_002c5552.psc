ScriptName Fragments:Perks:PRKF_Zoology_002C5552 Extends Perk Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_parentscript Property SQ_Parent Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
  SQ_Parent.HarvestActor(akTargetRef as Actor) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Entry_01(ObjectReference akTargetRef, Actor akActor)
  SQ_Parent.HarvestActor(akTargetRef as Actor) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Entry_02(ObjectReference akTargetRef, Actor akActor)
  SQ_Parent.HarvestActor(akTargetRef as Actor) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Entry_03(ObjectReference akTargetRef, Actor akActor)
  SQ_Parent.HarvestActor(akTargetRef as Actor) ; #DEBUG_LINE_NO:31
EndFunction
