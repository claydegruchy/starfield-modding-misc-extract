ScriptName Fragments:Quests:QF_FFConstantZ06_002117CA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_LetterParadiso Auto Const mandatory
ReferenceAlias Property Alias_LetterConstant Auto Const mandatory
Quest Property FFConstantZ04 Auto Const mandatory
Quest Property FFConstantZ05 Auto Const mandatory
ReferenceAlias Property Alias_Janet Auto Const mandatory
ReferenceAlias Property Alias_JanetMarker Auto Const mandatory
Topic Property FFConstantZ06_Janet_CallToPlayer Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFConstantZ06_Credits Auto Const mandatory
Scene Property FFConstantZ06_0050_Janet_Approach Auto Const mandatory
Outfit Property Outfit_Clothes_NewAtlantis_BusinessSuit_Female Auto Const mandatory
ActorValue Property FFConstantZ06_ForeknowledgeAV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference myJanet = Alias_Janet.GetRef() ; #DEBUG_LINE_NO:7
  myJanet.MoveTo(Alias_JanetMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  myJanet.Enable(False) ; #DEBUG_LINE_NO:9
  Alias_Janet.GetActorRef().SetOutfit(Outfit_Clothes_NewAtlantis_BusinessSuit_Female, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_Janet.GetActorRef().SetOutfit(Outfit_Clothes_NewAtlantis_BusinessSuit_Female, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_Janet.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_Janet.GetRef().Say(FFConstantZ06_Janet_CallToPlayer, None, False, None) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:42
  Self.SetActive(True) ; #DEBUG_LINE_NO:43
  Alias_Janet.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:53
  If FFConstantZ04.IsCompleted() ; #DEBUG_LINE_NO:55
    myPlayer.AddItem(Alias_LetterParadiso.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
  If FFConstantZ05.IsCompleted() ; #DEBUG_LINE_NO:58
    myPlayer.AddItem(Alias_LetterConstant.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
  myPlayer.SetValue(FFConstantZ06_ForeknowledgeAV, 1.0) ; #DEBUG_LINE_NO:62
  Self.SetObjectivecompleted(100, True) ; #DEBUG_LINE_NO:64
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0205_Item_00()
  Alias_Janet.GetRef().Disable(False) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0210_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:81
  ObjectReference myLetterParadiso = Alias_LetterParadiso.GetRef() ; #DEBUG_LINE_NO:82
  ObjectReference myLetterConstant = Alias_LetterConstant.GetRef() ; #DEBUG_LINE_NO:83
  If myPlayer.GetItemCount(myLetterParadiso as Form) ; #DEBUG_LINE_NO:85
    myPlayer.RemoveItem(myLetterParadiso as Form, 1, False, None) ; #DEBUG_LINE_NO:86
  EndIf ; #DEBUG_LINE_NO:
  If myPlayer.GetItemCount(myLetterConstant as Form) ; #DEBUG_LINE_NO:88
    myPlayer.RemoveItem(myLetterConstant as Form, 1, False, None) ; #DEBUG_LINE_NO:89
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:98
  Self.Stop() ; #DEBUG_LINE_NO:99
EndFunction
