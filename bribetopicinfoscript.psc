ScriptName BribeTopicInfoScript Extends TopicInfo Const
{ for bribe infos - remove credits }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CreditsToRemoveGlobal Auto Const mandatory
{ global used for credits to remove for this bribe }
conditionform Property Perk_CND_NegotiationRank4Check Auto Const mandatory
Message Property NegotiationRank4Message Auto Const mandatory
{ message for if you get a free bribe }
GlobalVariable Property NegotiationRank4Chance Auto Const mandatory
{ percentage chance to get a free bribe if you have Bribery rank 4 }

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  Self.RemoveItem(akSpeakerRef) ; #DEBUG_LINE_NO:16
EndEvent

Function RemoveItem(ObjectReference akSpeakerRef)
  Bool freeBribe = False ; #DEBUG_LINE_NO:20
  If Perk_CND_NegotiationRank4Check.IsTrue(None, None) ; #DEBUG_LINE_NO:21
    Int freeBribeRoll = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:23
    Int freeBribeChance = NegotiationRank4Chance.GetValueInt() ; #DEBUG_LINE_NO:24
    freeBribe = freeBribeRoll <= freeBribeChance ; #DEBUG_LINE_NO:25
    If freeBribe ; #DEBUG_LINE_NO:27
      NegotiationRank4Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:30
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If freeBribe == False ; #DEBUG_LINE_NO:34
    Int countToRemove = CreditsToRemoveGlobal.GetValueInt() ; #DEBUG_LINE_NO:36
    Game.GetPlayer().RemoveItem(Game.GetCredits() as Form, countToRemove, False, akSpeakerRef) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndFunction
