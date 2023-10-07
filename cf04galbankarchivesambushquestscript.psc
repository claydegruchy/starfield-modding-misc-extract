ScriptName CF04GalbankArchivesAmbushQuestScript Extends Quest
{ Quest to control Ecliptic ambush at the Galbnk archives, as part of CF04. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  ReferenceAlias Property Alias_GalbankArchivesDoor Auto Const mandatory
EndGroup

Group TimingProperties
  Float Property secondsUntilEclipticExitAmbushFurniture = 1.0 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function OnGalbankArchivesTriggerEntered()
  ObjectReference galbankArchivesDoor = Alias_GalbankArchivesDoor.GetRef() ; #DEBUG_LINE_NO:14
  galbankArchivesDoor.SetOpen(False) ; #DEBUG_LINE_NO:16
  galbankArchivesDoor.SetLockLevel(255) ; #DEBUG_LINE_NO:17
EndFunction
