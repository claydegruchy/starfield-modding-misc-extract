ScriptName Fragments:Quests:QF_OE_AustinF_DeadManBox02_000626FF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_RewardContainer Auto Const mandatory
ReferenceAlias Property Alias_KeyObject Auto Const mandatory
ReferenceAlias Property Alias_Corpse Auto Const mandatory
ReferenceAlias Property Alias_BiomePredator Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_RewardContainer.Getref().Lock(True, False, True) ; #DEBUG_LINE_NO:7
  Alias_RewardContainer.Getref().SetLockLevel(255) ; #DEBUG_LINE_NO:8
  Alias_Corpse.Getref().AddItem(Alias_KeyObject.Getref() as Form, 1, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor Creature = None ; #DEBUG_LINE_NO:26
  If Alias_BiomePredator ; #DEBUG_LINE_NO:28
    Creature = Alias_BiomePredator.GetActorRef() ; #DEBUG_LINE_NO:29
    Creature.Enable(False) ; #DEBUG_LINE_NO:31
    Creature.EvaluatePackage(False) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:41
EndFunction
