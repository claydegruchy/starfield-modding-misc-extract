ScriptName CF06QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Location Property CityNeonTradeTowerAstralLoungeLocation Auto Const mandatory
Cell Property CityNeonTradeTowerAstralLounge Auto Const mandatory
Int Property iStageToMoveBayu Auto Const mandatory
Int Property iStageDoneWithBayu Auto Const mandatory
ReferenceAlias Property CF06_BenjaminBayu Auto Const mandatory
ReferenceAlias Property CF06_AstralLoungeBayuMarker Auto Const mandatory
ReferenceAlias Property CF06_AstralLoungeLoadDoor Auto Const mandatory
ActorValue Property Assistance Auto Const mandatory
ActorValue Property Confidence Auto Const mandatory

;-- Functions ---------------------------------------

Function StartGetOffPlanetTimer()
  Self.StartTimerGameTime(2.0, 0) ; #DEBUG_LINE_NO:4
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  Self.SetStage(450) ; #DEBUG_LINE_NO:8
EndEvent

Function CallNeonCrime()
  CrimeFactionNeon.ModCrimeGold(10000, False) ; #DEBUG_LINE_NO:12
EndFunction

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:18
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer() ; #DEBUG_LINE_NO:26
    If Self.GetStageDone(iStageToMoveBayu) && !Self.GetStageDone(iStageDoneWithBayu) ; #DEBUG_LINE_NO:28
      If akNewLoc == CityNeonTradeTowerAstralLoungeLocation ; #DEBUG_LINE_NO:30
        Actor BayuRef = CF06_BenjaminBayu.GetActorRef() ; #DEBUG_LINE_NO:33
        BayuRef.MoveTo(CF06_AstralLoungeBayuMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:34
        BayuRef.SetValue(Assistance, 0.0) ; #DEBUG_LINE_NO:35
        BayuRef.SetValue(Confidence, 0.0) ; #DEBUG_LINE_NO:36
        ObjectReference DoorRef = CF06_AstralLoungeLoadDoor.GetRef() ; #DEBUG_LINE_NO:38
        DoorRef.SetFactionOwner(PlayerFaction, False) ; #DEBUG_LINE_NO:39
        DoorRef.Lock(True, False, True) ; #DEBUG_LINE_NO:40
        DoorRef.SetLockLevel(254) ; #DEBUG_LINE_NO:42
        CityNeonTradeTowerAstralLounge.EnableFastTravel(False) ; #DEBUG_LINE_NO:44
      EndIf ; #DEBUG_LINE_NO:
      If akOldLoc == CityNeonTradeTowerAstralLoungeLocation ; #DEBUG_LINE_NO:46
        Self.ReleasePlayer() ; #DEBUG_LINE_NO:50
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ReleasePlayer()
  ObjectReference DoorRef = CF06_AstralLoungeLoadDoor.GetRef() ; #DEBUG_LINE_NO:59
  DoorRef.Lock(False, False, True) ; #DEBUG_LINE_NO:60
  DoorRef.SetFactionOwner(None, False) ; #DEBUG_LINE_NO:61
  CityNeonTradeTowerAstralLounge.EnableFastTravel(True) ; #DEBUG_LINE_NO:62
  CF06_BenjaminBayu.GetActorRef().SetValue(Assistance, 1.0) ; #DEBUG_LINE_NO:63
  CF06_BenjaminBayu.GetActorRef().SetValue(Confidence, 2.0) ; #DEBUG_LINE_NO:64
EndFunction
