ScriptName CF_PostQuestScript Extends Quest
{ Quest script for CF_Post, the CF Postquest Script. }

;-- Variables ---------------------------------------
Int CONST_CaptainState_Active = 0 Const
Int CONST_CaptainState_Dead = 2 Const
Int CONST_CaptainState_Freed = 4 Const
Int CONST_CaptainState_Imprisoned = 3 Const
Int CONST_CaptainState_Inactive = 1 Const
Int CONST_Stage_PostquestFinal_CF = 110 Const
Int CONST_Stage_PostquestFinal_SD = 210 Const
Int CONST_Stage_PostquestStartup_CF = 100 Const
Int CONST_Stage_PostquestStartup_SD = 200 Const
Int CONST_Stage_QuickstartCF = 0 Const
Int CONST_Stage_QuickstartSD = 1 Const
Float CONST_VigilanceCrippledHealthPercent = 0.050000001 Const
Bool waitingForPlayerToSit

;-- Properties --------------------------------------
Group QuestProperties
  ActorValue[] Property VigilanceSystemActorValues Auto Const mandatory
  dialogueshipservicesscript Property DialogueShipServices Auto Const mandatory
EndGroup

Group AutofillProperties
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  LocationAlias Property SuvorovOrbitLocation Auto Const mandatory
  ReferenceAlias Property TheKey Auto Const mandatory
  ReferenceAlias Property Vigilance Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property TheKeyMapMarker Auto Const mandatory
  ReferenceAlias Property Captain_RokovShip Auto Const mandatory
  ReferenceAlias Property Captain_MathisShip Auto Const mandatory
  ReferenceAlias Property Captain_NaevaShip Auto Const mandatory
  ReferenceAlias Property Captain_AdlerShip Auto Const mandatory
  ReferenceAlias Property Captain_HuanShip Auto Const mandatory
  ReferenceAlias Property Captain_EstelleShip Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Mathis Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Adler Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
  ReferenceAlias Property CFPost_CFVigilanceMarker Auto Const mandatory
  ReferenceAlias Property CFPost_SDVigilanceMarker Auto Const mandatory
  Faction Property CrimeFactionUC Auto Const mandatory
  Faction Property UCSysDefFaction Auto Const mandatory
  Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function QuickstartToKey()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:70
  inputenablelayer myEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:71
  myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:72
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:73
  playerShipRef.InstantUndock() ; #DEBUG_LINE_NO:74
  playerShipRef.MoveTo(TheKeyMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:75
  player.MoveTo(playerShipRef as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:76
  PlayerShipPilotSeat.GetRef().Activate(player as ObjectReference, False) ; #DEBUG_LINE_NO:77
  myEnableLayer.Delete() ; #DEBUG_LINE_NO:78
EndFunction

Function RegisterForPostquestLocationChange()
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:87
EndFunction

Event ReferenceAlias.OnLocationChange(ReferenceAlias source, Location akOldLoc, Location akNewLoc)
  Location survorovOrbitLoc = SuvorovOrbitLocation.GetLocation() ; #DEBUG_LINE_NO:91
  If akNewLoc != survorovOrbitLoc && !survorovOrbitLoc.IsChild(akNewLoc) ; #DEBUG_LINE_NO:92
    Self.UnregisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:93
    If Self.GetStageDone(CONST_Stage_PostquestStartup_CF) ; #DEBUG_LINE_NO:94
      Self.SetStage(CONST_Stage_PostquestFinal_CF) ; #DEBUG_LINE_NO:95
    ElseIf Self.GetStageDone(CONST_Stage_PostquestStartup_SD) ; #DEBUG_LINE_NO:96
      Self.SetStage(CONST_Stage_PostquestFinal_SD) ; #DEBUG_LINE_NO:97
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CF_CleanupAllCaptainShips()
  Self.CF_CleanupCaptainShip(CrimsonFleetCaptainState_Rokov.GetValueInt(), Captain_RokovShip) ; #DEBUG_LINE_NO:108
  Self.CF_CleanupCaptainShip(CrimsonFleetCaptainState_Mathis.GetValueInt(), Captain_MathisShip) ; #DEBUG_LINE_NO:109
  Self.CF_CleanupCaptainShip(CrimsonFleetCaptainState_Naeva.GetValueInt(), Captain_NaevaShip) ; #DEBUG_LINE_NO:110
  Self.CF_CleanupCaptainShip(CrimsonFleetCaptainState_Adler.GetValueInt(), Captain_AdlerShip) ; #DEBUG_LINE_NO:111
  Self.CF_CleanupCaptainShip(CrimsonFleetCaptainState_Huan.GetValueInt(), Captain_HuanShip) ; #DEBUG_LINE_NO:112
  Self.CF_CleanupCaptainShip(CrimsonFleetCaptainState_Estelle.GetValueInt(), Captain_EstelleShip) ; #DEBUG_LINE_NO:113
EndFunction

Function CF_CleanupCaptainShip(Int captainState, ReferenceAlias captainShip)
  If captainState == CONST_CaptainState_Active ; #DEBUG_LINE_NO:117
    spaceshipreference captainShipRef = captainShip.GetShipRef() ; #DEBUG_LINE_NO:118
    captainShipRef.EnableNoWait(False) ; #DEBUG_LINE_NO:119
    If captainShipRef.IsDockedWith(Vigilance.GetShipRef()) ; #DEBUG_LINE_NO:120
      captainShipRef.InstantUndock() ; #DEBUG_LINE_NO:121
    EndIf ; #DEBUG_LINE_NO:
    captainShip.TryToEvaluatePackage() ; #DEBUG_LINE_NO:123
    captainShipRef.InstantDock(TheKey.GetShipRef() as ObjectReference) ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CF_ConvertVigilance()
  spaceshipreference vigilanceRef = Vigilance.GetShipRef() ; #DEBUG_LINE_NO:129
  vigilanceRef.RemoveFromFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:130
  vigilanceRef.RemoveFromFaction(UCSysDefFaction) ; #DEBUG_LINE_NO:131
  vigilanceRef.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:132
EndFunction

Function CF_DisableCaptainShips()
  Captain_RokovShip.TryToDisableNoWait() ; #DEBUG_LINE_NO:137
  Captain_MathisShip.TryToDisableNoWait() ; #DEBUG_LINE_NO:138
  Captain_AdlerShip.TryToDisableNoWait() ; #DEBUG_LINE_NO:139
  Captain_HuanShip.TryToDisableNoWait() ; #DEBUG_LINE_NO:140
  Captain_EstelleShip.TryToDisableNoWait() ; #DEBUG_LINE_NO:141
EndFunction

Function CF_MoveAndCrippleVigilance()
  spaceshipreference vigilanceRef = Vigilance.GetShipRef() ; #DEBUG_LINE_NO:145
  vigilanceRef.Enable(False) ; #DEBUG_LINE_NO:146
  vigilanceRef.MoveTo(CFPost_CFVigilanceMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:147
  Int I = 0 ; #DEBUG_LINE_NO:148
  While I < VigilanceSystemActorValues.Length ; #DEBUG_LINE_NO:149
    vigilanceRef.EnablePartRepair(VigilanceSystemActorValues[I], False) ; #DEBUG_LINE_NO:150
    vigilanceRef.DamageValue(VigilanceSystemActorValues[I], vigilanceRef.GetValue(VigilanceSystemActorValues[I])) ; #DEBUG_LINE_NO:151
    I += 1 ; #DEBUG_LINE_NO:152
  EndWhile ; #DEBUG_LINE_NO:
  vigilanceRef.EnablePartRepair(Health, False) ; #DEBUG_LINE_NO:154
  vigilanceRef.DamageValue(Health, vigilanceRef.GetValue(Health) * (1.0 - CONST_VigilanceCrippledHealthPercent)) ; #DEBUG_LINE_NO:155
EndFunction

Function SD_CleanupAllCaptainShips()
  Self.SD_CleanupCaptainShip(CrimsonFleetCaptainState_Rokov.GetValueInt(), Captain_RokovShip) ; #DEBUG_LINE_NO:164
  Self.SD_CleanupCaptainShip(CrimsonFleetCaptainState_Mathis.GetValueInt(), Captain_MathisShip) ; #DEBUG_LINE_NO:165
  Self.SD_CleanupCaptainShip(CrimsonFleetCaptainState_Naeva.GetValueInt(), Captain_NaevaShip) ; #DEBUG_LINE_NO:166
  Self.SD_CleanupCaptainShip(CrimsonFleetCaptainState_Adler.GetValueInt(), Captain_AdlerShip) ; #DEBUG_LINE_NO:167
  Self.SD_CleanupCaptainShip(CrimsonFleetCaptainState_Huan.GetValueInt(), Captain_HuanShip) ; #DEBUG_LINE_NO:168
  Self.SD_CleanupCaptainShip(CrimsonFleetCaptainState_Estelle.GetValueInt(), Captain_EstelleShip) ; #DEBUG_LINE_NO:169
EndFunction

Function SD_CleanupCaptainShip(Int captainState, ReferenceAlias captainShip)
  If captainState == CONST_CaptainState_Active ; #DEBUG_LINE_NO:173
    captainShip.GetShipRef().DisableNoWait(False) ; #DEBUG_LINE_NO:174
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SD_MoveVigilance()
  spaceshipreference vigilanceRef = Vigilance.GetShipRef() ; #DEBUG_LINE_NO:179
  vigilanceRef.Enable(False) ; #DEBUG_LINE_NO:180
  vigilanceRef.MoveTo(CFPost_SDVigilanceMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:181
EndFunction
