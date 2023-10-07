ScriptName Fragments:Quests:QF_DialogueRedMile_002B2C2B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueRedMile_OpeningScene Auto Const mandatory
Potion Property Food_RS_Tavern_RunnersRush Auto Const mandatory
ReferenceAlias Property Alias_Jade Auto Const mandatory
ReferenceAlias Property Alias_Mei Auto Const mandatory
ReferenceAlias Property Alias_Stocker Auto Const mandatory
Quest Property FFRedMileR01Misc Auto Const mandatory
Quest Property FFRedMileR01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0099_Item_00()
  DialogueRedMile_OpeningScene.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_Mei.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:15
  Alias_Stocker.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0350_Item_00()
  If !FFRedMileR01.IsRunning() && !FFRedMileR01Misc.IsRunning() ; #DEBUG_LINE_NO:24
    FFRedMileR01Misc.Start() ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0420_Item_00()
  Game.GetPlayer().RemoveItem(Food_RS_Tavern_RunnersRush as Form, 1, False, None) ; #DEBUG_LINE_NO:35
EndFunction
