ScriptName Fragments:Quests:QF_FFNeonZ11_002E8298 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueFCNeon Auto Const mandatory
ReferenceAlias Property Alias_Vasco Auto Const mandatory
ReferenceAlias Property Alias_Lendel Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
Quest Property CREW_EliteCrew_Vasco Auto Const mandatory
Perk Property CREW_Ship_AneutronicFusion Auto Const mandatory
Perk Property CREW_Ship_Shields Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Lendel.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  Alias_Vasco.GetRef().MoveTo(Alias_Lendel.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  CREW_EliteCrew_Vasco.SetStage(1) ; #DEBUG_LINE_NO:11
  CREW_EliteCrew_Vasco.SetStage(50) ; #DEBUG_LINE_NO:12
  Actor VascoRef = Alias_Vasco.GetActorRef() ; #DEBUG_LINE_NO:15
  (VascoRef as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:16
  VascoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:17
  VascoRef.AddPerk(CREW_Ship_AneutronicFusion, False) ; #DEBUG_LINE_NO:20
  VascoRef.AddPerk(CREW_Ship_Shields, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0010_Item_00()
  DialogueFCNeon.SetStage(486) ; #DEBUG_LINE_NO:29
  Self.Stop() ; #DEBUG_LINE_NO:30
EndFunction
