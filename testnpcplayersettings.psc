ScriptName TestNPCPlayerSettings Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property PlayerIsEnemy = False Auto Const
{ True = NPCs will be Hostile to Player }
Bool Property isToggle = False Auto Const
{ True = Each activation will toggle NPC relation to player }

;-- Functions ---------------------------------------

Event OnLoad()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  ObjectReference SpawnControllerFromLink = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:16
  Bool treatPlayerAsEnemy = PlayerIsEnemy ; #DEBUG_LINE_NO:17
  If SpawnControllerFromLink ; #DEBUG_LINE_NO:18
    If isToggle ; #DEBUG_LINE_NO:19
      treatPlayerAsEnemy = !(SpawnControllerFromLink as testnpcarenascript).VersusPlayer ; #DEBUG_LINE_NO:20
    EndIf ; #DEBUG_LINE_NO:
    (SpawnControllerFromLink as testnpcarenascript).VersusPlayer = treatPlayerAsEnemy ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndEvent
