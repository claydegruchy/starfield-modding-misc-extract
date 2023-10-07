ScriptName Fragments:Quests:QF_BE_MQ102_002A3901 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Moara Auto Const mandatory
ReferenceAlias Property Alias_CaptiveMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  Actor MoaraREF = Alias_Moara.GetActorRef() ; #DEBUG_LINE_NO:7
  MoaraREF.Disable(False) ; #DEBUG_LINE_NO:8
  MoaraREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:9
  MoaraREF.Moveto(Alias_CaptiveMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:10
  MoaraREF.Enable(False) ; #DEBUG_LINE_NO:11
EndFunction
