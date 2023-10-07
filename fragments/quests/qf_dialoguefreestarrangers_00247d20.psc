ScriptName Fragments:Quests:QF_DialogueFreestarRangers_00247D20 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueFreestarRangers_MaryHelgaIntroScene Auto Const mandatory
Scene Property DialogueFreestarRangers_AugustEmmaScene Auto Const mandatory
ReferenceAlias Property Alias_HelgaDubray Auto Const mandatory
ReferenceAlias Property Alias_MaryCartwright Auto Const mandatory
ReferenceAlias Property Alias_FreestarMechFactoryMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Alias_FreestarMechFactoryMapMarker.GetReference().Disable(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_1100_Item_00()
  DialogueFreestarRangers_MaryHelgaIntroScene.Start() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_1150_Item_00()
  Alias_HelgaDubray.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:24
  Alias_MaryCartwright.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_1200_Item_00()
  DialogueFreestarRangers_AugustEmmaScene.Start() ; #DEBUG_LINE_NO:33
EndFunction
