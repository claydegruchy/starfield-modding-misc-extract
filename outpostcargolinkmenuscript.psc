ScriptName OutpostCargoLinkMenuScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkOutpostCargoLink Auto Const mandatory
{ keyword to find linked ref of my cargo link }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:7
    outpostcargolinkmarkerscript myCargoLink = Self.GetLinkedRef(LinkOutpostCargoLink) as outpostcargolinkmarkerscript ; #DEBUG_LINE_NO:8
    If myCargoLink ; #DEBUG_LINE_NO:10
      Bool includeIntersystem = myCargoLink.RequiresFuel ; #DEBUG_LINE_NO:12
      Keyword requiredKeyword = myCargoLink.CargoLinkMenuKeyword ; #DEBUG_LINE_NO:13
      myCargoLink.ShowWorkshopTargetMenu(True, None, includeIntersystem, requiredKeyword) ; #DEBUG_LINE_NO:15
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
