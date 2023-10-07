ScriptName Fragments:Packages:PF_SQ_OutpostCargoLinkTravel_00255CC4 Extends Package Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  sq_outpostcargolinkshipscript myShip = akActor.GetSpaceship() as sq_outpostcargolinkshipscript ; #DEBUG_LINE_NO:8
  If myShip ; #DEBUG_LINE_NO:9
    myShip.ArriveAtOutpost() ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndFunction
