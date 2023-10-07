ScriptName UC_RHQ_TeleportRefOnLoadScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property UC_RHQ_TeleportLinkedRef Auto Const mandatory
{ Keyword used to know which marker to teleport the NPC to }

;-- Functions ---------------------------------------

Event OnCellLoad()
  If Self.IsEnabled() ; #DEBUG_LINE_NO:7
    Self.MoveTo(Self.GetLinkedRef(UC_RHQ_TeleportLinkedRef), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
