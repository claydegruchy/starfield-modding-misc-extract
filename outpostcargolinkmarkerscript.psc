ScriptName OutpostCargoLinkMarkerScript Extends ObjectReference conditional
{ holds data about the specifics of this cargo link }

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard animationStateGuard

;-- Properties --------------------------------------
sq_outpostcargolinkscript Property SQ_OutpostCargoLink Auto Const mandatory
ActorValue Property CarryWeight Auto Const mandatory
{ actor value to set on myself for code to use as default ship carry weight }
ActorValue Property OutpostCargoLinkAnimState Auto Const mandatory
{ actor value to set on myself for code to use as default ship carry weight }
Float Property SpaceshipDefaultCarryWeight = 300.0 Auto Const
{ value to set }
spaceshipbase Property OutpostCargoLinkShip Auto Const mandatory
{ spaceship base for my cargo ship }
Bool Property RequiresFuel = False Auto Const
Bool Property CreateShipAtCargoLink01 = True Auto Const
{ if true, create ship at cargo link 01 - the one the player is at
  if false, create ship at cargo link 02 - the "other" cargo link }
Keyword Property CargoLinkMenuKeyword Auto Const
{ OPTIONAL - if included, pass this in to ShowWorkshopTargetMenu }
Keyword Property OutpostCargoLinkLightsKeyword Auto Const mandatory
{ used to get linked lights on cargo link }
Form Property SpecificCargo Auto hidden
{ used only for Supply missions - if set, only move this type of cargo between cargo links - updated by supply mission }
Int Property SpecificCargoMax Auto hidden
{ used only for supply missions - max amount of cargo to take - updated by supply mission }
Bool Property isLinked = False Auto conditional hidden

;-- Functions ---------------------------------------

Event OnInit()
  Self.SetValue(CarryWeight, SpaceshipDefaultCarryWeight) ; #DEBUG_LINE_NO:41
  If RequiresFuel ; #DEBUG_LINE_NO:42
    Self.AddKeyword(SQ_OutpostCargoLink.OutpostProductionHalted) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  Int animStateID = Self.GetValueInt(OutpostCargoLinkAnimState) ; #DEBUG_LINE_NO:49
  sq_outpostcargolinkscript:animdata theData = SQ_OutpostCargoLink.GetAnimationData(animStateID) ; #DEBUG_LINE_NO:50
  Self.SetAnimationState(animStateID, theData) ; #DEBUG_LINE_NO:51
EndEvent

Event OnWorkshopCargoLinkChanged(ObjectReference akOldTarget, ObjectReference akNewTarget)
  If akNewTarget != akOldTarget ; #DEBUG_LINE_NO:56
    If akOldTarget ; #DEBUG_LINE_NO:60
      SQ_OutpostCargoLink.ClearCargoLink(Self as ObjectReference, akOldTarget) ; #DEBUG_LINE_NO:61
    EndIf ; #DEBUG_LINE_NO:
    If akNewTarget ; #DEBUG_LINE_NO:64
      If SQ_OutpostCargoLink.CreateCargoLink(Self as ObjectReference, akNewTarget) == False ; #DEBUG_LINE_NO:66
        SQ_OutpostCargoLink.ClearCargoLink(Self as ObjectReference, akNewTarget) ; #DEBUG_LINE_NO:69
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    SQ_OutpostCargoLink.SendOutpostCargoLinkChangedEvent(Self.GetWorkshop(), Self as ObjectReference, akOldTarget, akNewTarget) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akActionRef)
  SQ_OutpostCargoLink.ClearCargoLink(Self as ObjectReference, None) ; #DEBUG_LINE_NO:80
EndEvent

Function SetAnimationState(Int stateID, sq_outpostcargolinkscript:animdata theData)
  Guard animationStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:86
    Self.SetValue(OutpostCargoLinkAnimState, stateID as Float) ; #DEBUG_LINE_NO:88
    Var[] kargs = new Var[1] ; #DEBUG_LINE_NO:90
    kargs[0] = theData as Var ; #DEBUG_LINE_NO:91
    Self.SendCustomEvent("outpostcargolinkmarkerscript_SetAnimationStateEvent", kargs) ; #DEBUG_LINE_NO:92
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction
