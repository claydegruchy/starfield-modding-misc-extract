ScriptName Fragments:Quests:QF_City_NewAtlantis_z_TheArt_00111F53 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Solomon Auto Const
ReferenceAlias Property Zoe Auto Const
ReferenceAlias Property Credits Auto Const
ReferenceAlias Property Art Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:18
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:19
  Zoe.GetActorRef().RemoveItem(Art.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:21
  Game.GetPlayer().AddItem(Art.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().RemoveItem(Art.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:33
  Solomon.GetActorRef().AddItem(Art.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:34
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:35
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:37
  Self.Stop() ; #DEBUG_LINE_NO:38
EndFunction
