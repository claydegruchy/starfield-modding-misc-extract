ScriptName TestJeffBMournScript Extends Actor conditional

;-- Variables ---------------------------------------
Actor myParent
Actor player

;-- Properties --------------------------------------
Bool Property isParentDead = False Auto conditional
Bool Property amParent = False Auto
Keyword Property myKeyword Auto

;-- Functions ---------------------------------------

Event OnLoad()
  If amParent == False ; #DEBUG_LINE_NO:11
    myParent = Self.getLinkedRef(myKeyword) as Actor ; #DEBUG_LINE_NO:12
    Self.RegisterForRemoteEvent(myParent as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akActionRef)
  isParentDead = True ; #DEBUG_LINE_NO:18
  Self.stopcombat() ; #DEBUG_LINE_NO:19
  Self.EvaluatePackage(False) ; #DEBUG_LINE_NO:20
EndEvent
