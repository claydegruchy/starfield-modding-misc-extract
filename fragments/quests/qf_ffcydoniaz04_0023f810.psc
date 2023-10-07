ScriptName Fragments:Quests:QF_FFCydoniaZ04_0023F810 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property StackOfDrawings Auto Const mandatory
Quest Property FFCydoniaZ04Misc Auto Const mandatory
RefCollectionAlias Property Alias_Walls Auto Const mandatory
Quest Property FFCydoniaZ04Posters Auto Const mandatory
Message Property FFCydoniaR04_SpaceFrogRecipe_MSG Auto Const mandatory
ActorValue Property FFCydoniaZ04_ForeknowledgeAV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If FFCydoniaZ04Misc.IsRunning() ; #DEBUG_LINE_NO:8
    FFCydoniaZ04Misc.SetStage(1000) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
  Alias_Walls.EnableAll(False) ; #DEBUG_LINE_NO:12
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:14
  Game.GetPlayer().AddItem(StackOfDrawings.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().RemoveItem(StackOfDrawings.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:23
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:24
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:33
  Game.GetPlayer().SetValue(FFCydoniaZ04_ForeknowledgeAV, 1.0) ; #DEBUG_LINE_NO:34
  FFCydoniaZ04Posters.Start() ; #DEBUG_LINE_NO:35
  FFCydoniaR04_SpaceFrogRecipe_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:36
  Self.Stop() ; #DEBUG_LINE_NO:37
EndFunction
