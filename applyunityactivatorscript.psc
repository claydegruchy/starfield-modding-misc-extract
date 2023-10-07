ScriptName ApplyUnityActivatorScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property SourceActor Auto Const
ReferenceAlias Property ReceivingActor Auto Const
ActorValue Property Health Auto Const mandatory
ActorValue Property Oxygen Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function ApplyUnityCharacter(Actor akSourceActor)
  Actor ReceivingActorREF = ReceivingActor.GetActorRef() ; #DEBUG_LINE_NO:13
  Int myHealth = akSourceActor.GetValue(Health) as Int ; #DEBUG_LINE_NO:17
  Int myOxygen = akSourceActor.GetValue(Oxygen) as Int ; #DEBUG_LINE_NO:18
  Int myLevel = akSourceActor.GetLevel() ; #DEBUG_LINE_NO:19
  ReceivingActorREF.SetValue(Health, myHealth as Float) ; #DEBUG_LINE_NO:23
  ReceivingActorREF.SetValue(Oxygen, myOxygen as Float) ; #DEBUG_LINE_NO:24
  Int myCredits = akSourceActor.GetItemCount(Credits as Form) ; #DEBUG_LINE_NO:30
  ReceivingActorREF.AddItem(Credits as Form, myCredits, False) ; #DEBUG_LINE_NO:31
  akSourceActor.RemoveAllItems(ReceivingActorREF as ObjectReference, False, False) ; #DEBUG_LINE_NO:34
EndFunction

Event OnActivate(ObjectReference akActionRef)
  Self.ApplyUnityCharacter(SourceActor.GetActorRef()) ; #DEBUG_LINE_NO:39
EndEvent
