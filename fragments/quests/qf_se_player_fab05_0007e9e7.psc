ScriptName Fragments:Quests:QF_SE_Player_FAB05_0007E9E7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_Grandma Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property SE_Player_FAB05_GrandmaDead Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  SE_Player_FAB05_GrandmaDead.SetValue(1.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0006_Item_00()
  SE_Player_FAB05_GrandmaDead.SetValue(1.0) ; #DEBUG_LINE_NO:15
  spaceshipreference GrandmaRef = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:16
  GrandmaRef.SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:18
  GrandmaRef.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:19
  GrandmaRef.StopCombat() ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0066_Item_00()
  Actor GrandmaRef = Alias_Grandma.GetActorRef() ; #DEBUG_LINE_NO:37
  spaceshipreference GrandmaShipRef = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:38
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:39
  GrandmaRef.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:41
  GrandmaRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:42
  GrandmaShipRef.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:43
  GrandmaShipRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:44
  If GrandmaRef.GetParentCell() == PlayerRef.GetParentCell() ; #DEBUG_LINE_NO:46
    GrandmaRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:58
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:59
EndFunction
