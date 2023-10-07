ScriptName DefaultAliasReadWhileSittingScript Extends ReferenceAlias Const default
{ script to get an NPC to read in a chair }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Package[] Property ReadingPackages Auto Const
{ list of packages where you want the NPC reading while sitting }
Idle Property IdleBookReadStart Auto Const

;-- Functions ---------------------------------------

Event OnSit(ObjectReference akFurniture)
  Actor theActor = Self.GetActorRef() ; #DEBUG_LINE_NO:11
  If theActor ; #DEBUG_LINE_NO:12
    Package currentPackage = Self.GetActorRef().GetCurrentPackage() ; #DEBUG_LINE_NO:13
    Int packageIndex = ReadingPackages.find(currentPackage, 0) ; #DEBUG_LINE_NO:14
    If packageIndex > -1 ; #DEBUG_LINE_NO:15
      theActor.PlayIdle(IdleBookReadStart) ; #DEBUG_LINE_NO:18
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
