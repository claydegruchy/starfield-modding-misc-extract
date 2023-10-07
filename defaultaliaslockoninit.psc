ScriptName DefaultAliasLockOnInit Extends ReferenceAlias Const default
{ Default script used for checking if an alias has been locked/unlocked }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property LockLevel = -1 Auto Const
{ Optional: The Lock Level for the door. By default, the lock will be Very Easy }

;-- Functions ---------------------------------------

Event OnAliasInit()
  ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:8
  myRef.Lock(True, False, True) ; #DEBUG_LINE_NO:9
  If LockLevel > 0 ; #DEBUG_LINE_NO:10
    myRef.SetLockLevel(LockLevel) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndEvent
