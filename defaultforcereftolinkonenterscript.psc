ScriptName DefaultForceRefToLinkOnEnterScript Extends ObjectReference Const default
{ Used Primarily for Quest Target breadcrumbing. Force the QT RefAlias to this trigger's LinkedRef when the Player enters this Trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property RefAliasToFill Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  ObjectReference MyLink = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:7
  RefAliasToFill.ForceRefTo(MyLink) ; #DEBUG_LINE_NO:9
EndEvent
