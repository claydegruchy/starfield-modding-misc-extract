ScriptName City_Neon_Drug02_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
city_neon_druggamescript Property City_Neon_Drug_Game Auto Const mandatory
Location Property CityNeonLegrandesLiquorsLocation Auto Const mandatory
Cell Property CityNeonLegrandesLiquors Auto Const mandatory
Int Property iStageToMoveBayu Auto Const mandatory
Int Property iStageDoneWithBayu Auto Const mandatory
ReferenceAlias Property BenjaminBayu Auto Const mandatory
ReferenceAlias Property BayuFurniture Auto Const mandatory
ReferenceAlias Property LegrandesLoadDoor Auto Const mandatory
ReferenceAlias Property Alias_IngredientHopper Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ActorValue Property Assistance Auto Const mandatory
Int Property maxRefills = 3 Auto Const
{ how many "refills" will player get on retries, per round }

;-- Functions ---------------------------------------

Function ReplayGame()
  City_Neon_Drug_Game.Stop() ; #DEBUG_LINE_NO:26
  City_Neon_Drug_Game.Reset() ; #DEBUG_LINE_NO:27
  City_Neon_Drug_Game.Start() ; #DEBUG_LINE_NO:28
EndFunction

Function AddItemsToHopper()
  ObjectReference hopperRef = Alias_IngredientHopper.GetRef() ; #DEBUG_LINE_NO:33
  Int I = 0 ; #DEBUG_LINE_NO:34
  While I < City_Neon_Drug_Game.HopperItems.Length ; #DEBUG_LINE_NO:35
    city_neon_druggamescript:hopperitem theHopperItem = City_Neon_Drug_Game.HopperItems[I] ; #DEBUG_LINE_NO:36
    hopperRef.AddItem(theHopperItem.hopperIngredient as Form, theHopperItem.countGiven, False) ; #DEBUG_LINE_NO:37
    I += 1 ; #DEBUG_LINE_NO:38
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:44
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer() ; #DEBUG_LINE_NO:52
    If Self.GetStageDone(iStageToMoveBayu) && !Self.GetStageDone(iStageDoneWithBayu) ; #DEBUG_LINE_NO:54
      If akNewLoc == CityNeonLegrandesLiquorsLocation ; #DEBUG_LINE_NO:56
        Actor BayuRef = BenjaminBayu.GetActorRef() ; #DEBUG_LINE_NO:59
        BayuRef.MoveTo(BayuFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:60
        BayuRef.SetValue(Assistance, 0.0) ; #DEBUG_LINE_NO:61
        ObjectReference DoorRef = LegrandesLoadDoor.GetRef() ; #DEBUG_LINE_NO:63
        DoorRef.SetFactionOwner(PlayerFaction, False) ; #DEBUG_LINE_NO:64
        DoorRef.Lock(True, False, True) ; #DEBUG_LINE_NO:65
        DoorRef.SetLockLevel(254) ; #DEBUG_LINE_NO:66
        CityNeonLegrandesLiquors.EnableFastTravel(False) ; #DEBUG_LINE_NO:68
      EndIf ; #DEBUG_LINE_NO:
      If akOldLoc == CityNeonLegrandesLiquorsLocation ; #DEBUG_LINE_NO:71
        Self.ReleasePlayer() ; #DEBUG_LINE_NO:75
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ReleasePlayer()
  ObjectReference DoorRef = LegrandesLoadDoor.GetRef() ; #DEBUG_LINE_NO:85
  DoorRef.Lock(False, False, True) ; #DEBUG_LINE_NO:86
  DoorRef.SetFactionOwner(None, False) ; #DEBUG_LINE_NO:87
  CityNeonLegrandesLiquors.EnableFastTravel(True) ; #DEBUG_LINE_NO:88
  BenjaminBayu.GetActorRef().SetValue(Assistance, 1.0) ; #DEBUG_LINE_NO:89
EndFunction
