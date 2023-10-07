ScriptName MechanicalTurretScript Extends ObjectReference
{ Script to handle mechanical turret moving up and down based on player position }

;-- Variables ---------------------------------------
Bool bUseHorizontalX
Bool bUseHorizontalY
Bool bUseVertical
Bool doOnce = False
Float fAnimRate
Float fHorizontalXLength
Float fHorizontalXMoverVar
Float fHorizontalYLength
Float fHorizontalYMoverVar
Float fRootRefDistanceToPlayer
Float fTargetMin = 1.25
Float fVerticalLength
Float fVerticalMoverVar
ObjectReference fireNodeRef
Float fplayerDistanceToZFloor
ObjectReference horizontalXMoverRef
ObjectReference horizontalXRef
ObjectReference horizontalYMoverRef
ObjectReference horizontalYRef
Float myTimer = 0.100000001
Int myTimerID = 0
Float myTimerMax = 0.100000001
Float myTimerMin = 0.100000001
ObjectReference playerRef
ObjectReference rootRef
ObjectReference verticalMoverRef
Float xAngle
ObjectReference zRef
Float zRootPosition

;-- Properties --------------------------------------
Int Property TurretType = 4 Auto Const
{ 0=vertical only, 1=horizontal only, 2=horizontal and vertical (default), 3=all three axis, 4=random }
Keyword Property LinkCustom01 Auto Const mandatory
{ z platform helper }
Keyword Property LinkCustom02 Auto Const mandatory
{ horizontalY platform helper }
Keyword Property LinkCustom03 Auto Const mandatory
{ horizontalX platform helper }
Keyword Property LinkCustom04 Auto Const mandatory
{ turret fire node }
Keyword Property LinkCustom05 Auto Const mandatory
{ ref for root marker }
Keyword Property LinkCustom06 Auto Const mandatory
{ ref for ceiling of z bound }
Keyword Property LinkCustom07 Auto Const mandatory
{ ref for horizontalY bound }
Keyword Property LinkCustom08 Auto Const mandatory
{ ref for horizontalX bound }
Float Property fTimeTakenToMove = 2.0 Auto Const
{ how fast the turret moves from point A to B }
Weapon Property turretWeapon Auto Const
{ weapon turret uses }
Ammo Property turretAmmo Auto Const
{ ammo that turret fires }

;-- Functions ---------------------------------------

Event OnLoad()
  playerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:68
  verticalMoverRef = Self.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:69
  horizontalYMoverRef = Self.GetLinkedRef(LinkCustom02) ; #DEBUG_LINE_NO:70
  horizontalXMoverRef = Self.GetLinkedRef(LinkCustom03) ; #DEBUG_LINE_NO:71
  fireNodeRef = Self.GetLinkedRef(LinkCustom04) ; #DEBUG_LINE_NO:72
  rootRef = Self.GetLinkedRef(LinkCustom05) ; #DEBUG_LINE_NO:73
  zRef = Self.GetLinkedRef(LinkCustom06) ; #DEBUG_LINE_NO:74
  horizontalYRef = Self.GetLinkedRef(LinkCustom07) ; #DEBUG_LINE_NO:75
  horizontalXRef = Self.GetLinkedRef(LinkCustom08) ; #DEBUG_LINE_NO:76
  zRootPosition = rootRef.GetPositionZ() ; #DEBUG_LINE_NO:78
  fAnimRate = 1.0 / fTimeTakenToMove ; #DEBUG_LINE_NO:80
  verticalMoverRef.SetAnimationVariableFloat("Speed", fAnimRate) ; #DEBUG_LINE_NO:82
  horizontalYMoverRef.SetAnimationVariableFloat("Speed", fAnimRate) ; #DEBUG_LINE_NO:83
  horizontalXMoverRef.SetAnimationVariableFloat("Speed", fAnimRate) ; #DEBUG_LINE_NO:84
  fVerticalLength = zRef.GetPositionZ() - zRootPosition ; #DEBUG_LINE_NO:86
  fHorizontalYLength = rootRef.GetDistance(horizontalYRef) ; #DEBUG_LINE_NO:87
  fHorizontalXLength = rootRef.GetDistance(horizontalXRef) ; #DEBUG_LINE_NO:88
  If TurretType == 1 ; #DEBUG_LINE_NO:90
    bUseVertical = False ; #DEBUG_LINE_NO:91
  Else ; #DEBUG_LINE_NO:
    bUseVertical = True ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
  If TurretType == 0 ; #DEBUG_LINE_NO:96
    bUseHorizontalY = False ; #DEBUG_LINE_NO:97
  Else ; #DEBUG_LINE_NO:
    bUseHorizontalY = True ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
  If TurretType == 3 || TurretType == 4 ; #DEBUG_LINE_NO:102
    bUseHorizontalX = True ; #DEBUG_LINE_NO:103
  Else ; #DEBUG_LINE_NO:
    bUseHorizontalX = False ; #DEBUG_LINE_NO:105
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && doOnce == False ; #DEBUG_LINE_NO:113
    doOnce = True ; #DEBUG_LINE_NO:114
    Self.StartTimer(myTimer, myTimerID) ; #DEBUG_LINE_NO:115
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == myTimerID ; #DEBUG_LINE_NO:122
    Float fHorizontalYShortLength = 0.0 ; #DEBUG_LINE_NO:123
    Float fHorizontalXShortLength = 0.0 ; #DEBUG_LINE_NO:124
    fplayerDistanceToZFloor = playerRef.GetPositionZ() - zRootPosition + fTargetMin ; #DEBUG_LINE_NO:126
    fRootRefDistanceToPlayer = playerRef.GetDistance(rootRef) ; #DEBUG_LINE_NO:127
    If TurretType == 1 || TurretType == 2 || TurretType == 3 ; #DEBUG_LINE_NO:129
      fHorizontalYShortLength = Self.FindTriangleBase(fRootRefDistanceToPlayer, fHorizontalYLength, playerRef.GetDistance(horizontalYRef)) ; #DEBUG_LINE_NO:130
    EndIf ; #DEBUG_LINE_NO:
    If TurretType == 3 ; #DEBUG_LINE_NO:133
      fHorizontalXShortLength = Self.FindTriangleBase(fRootRefDistanceToPlayer, fHorizontalXLength, playerRef.GetDistance(horizontalXRef)) ; #DEBUG_LINE_NO:134
    EndIf ; #DEBUG_LINE_NO:
    Self.MoveTurret(fHorizontalYShortLength, fHorizontalXShortLength) ; #DEBUG_LINE_NO:137
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Float Function FindTriangleBase(Float SideA, Float SideB, Float SideC)
{ takes four sides of a triangle, finds the height of the triangle, then finds the short length of that new triangle }
  Float fHeronPart1 = 0.0 ; #DEBUG_LINE_NO:146
  Float fHeronPart2 = 0.0 ; #DEBUG_LINE_NO:147
  Float fTriangleHeight = 0.0 ; #DEBUG_LINE_NO:148
  Float fTriangleBase = 0.0 ; #DEBUG_LINE_NO:149
  fHeronPart1 = (SideA + SideB + SideC) / 2.0 ; #DEBUG_LINE_NO:153
  fHeronPart2 = Math.sqrt(fHeronPart1 * (fHeronPart1 - SideA) * (fHeronPart1 - SideB) * (fHeronPart1 - SideC)) ; #DEBUG_LINE_NO:156
  fTriangleHeight = 2.0 * fHeronPart2 / SideB ; #DEBUG_LINE_NO:162
  fTriangleBase = Math.sqrt(Math.pow(SideA, 2.0) - Math.pow(fTriangleHeight, 2.0)) ; #DEBUG_LINE_NO:168
  Return fTriangleBase ; #DEBUG_LINE_NO:170
EndFunction

Function MoveTurret(Float fHorizontalY, Float fHorizontalX)
  Self.CancelTimer(myTimerID) ; #DEBUG_LINE_NO:176
  If TurretType != 4 ; #DEBUG_LINE_NO:178
    fVerticalMoverVar = fplayerDistanceToZFloor / fVerticalLength ; #DEBUG_LINE_NO:179
    fHorizontalYMoverVar = fHorizontalY / fHorizontalYLength ; #DEBUG_LINE_NO:180
    fHorizontalXMoverVar = fHorizontalX / fHorizontalXLength ; #DEBUG_LINE_NO:181
  Else ; #DEBUG_LINE_NO:
    fVerticalMoverVar = Utility.RandomFloat(0.0, 1.0) ; #DEBUG_LINE_NO:183
    fHorizontalYMoverVar = Utility.RandomFloat(0.0, 1.0) ; #DEBUG_LINE_NO:184
    fHorizontalXMoverVar = Utility.RandomFloat(0.0, 1.0) ; #DEBUG_LINE_NO:185
  EndIf ; #DEBUG_LINE_NO:
  verticalMoverRef.SetAnimationVariableFloat("Position", fVerticalMoverVar) ; #DEBUG_LINE_NO:188
  horizontalYMoverRef.SetAnimationVariableFloat("Position", fHorizontalYMoverVar) ; #DEBUG_LINE_NO:189
  horizontalXMoverRef.SetAnimationVariableFloat("Position", fHorizontalXMoverVar) ; #DEBUG_LINE_NO:190
  If bUseHorizontalX == True ; #DEBUG_LINE_NO:192
    horizontalXMoverRef.PlayAnimationAndWait("Play01", "done") ; #DEBUG_LINE_NO:193
    Self.FireTurret() ; #DEBUG_LINE_NO:194
    Utility.Wait(0.25) ; #DEBUG_LINE_NO:195
  EndIf ; #DEBUG_LINE_NO:
  If bUseVertical == True ; #DEBUG_LINE_NO:198
    verticalMoverRef.PlayAnimationAndWait("Play01", "done") ; #DEBUG_LINE_NO:199
    Self.FireTurret() ; #DEBUG_LINE_NO:200
    Utility.Wait(0.25) ; #DEBUG_LINE_NO:201
  EndIf ; #DEBUG_LINE_NO:
  If bUseHorizontalY == True ; #DEBUG_LINE_NO:204
    horizontalYMoverRef.PlayAnimationAndWait("Play01", "done") ; #DEBUG_LINE_NO:205
    Self.FireTurret() ; #DEBUG_LINE_NO:206
    Utility.Wait(0.25) ; #DEBUG_LINE_NO:207
  EndIf ; #DEBUG_LINE_NO:
  If TurretType == 4 ; #DEBUG_LINE_NO:210
    Self.StartTimer(Utility.RandomFloat(myTimerMin, myTimerMax), 0) ; #DEBUG_LINE_NO:211
  Else ; #DEBUG_LINE_NO:
    Self.StartTimer(myTimer, myTimerID) ; #DEBUG_LINE_NO:213
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function FireTurret()
  Float fPlayerZ = playerRef.GetPositionZ() + fTargetMin ; #DEBUG_LINE_NO:220
  Float fFireNodeRefZ = fireNodeRef.GetPositionZ() ; #DEBUG_LINE_NO:221
  Float fZDifferencePlayerFireNode = fPlayerZ - fFireNodeRefZ ; #DEBUG_LINE_NO:222
  Float fDistanceFireNodeToPlayer = fireNodeRef.GetDistance(playerRef) ; #DEBUG_LINE_NO:223
  Float zOffset = fireNodeRef.GetHeadingAngle(playerRef) ; #DEBUG_LINE_NO:224
  If fPlayerZ >= fFireNodeRefZ ; #DEBUG_LINE_NO:226
    xAngle = Math.asin(fZDifferencePlayerFireNode / fDistanceFireNodeToPlayer) * -1.0 ; #DEBUG_LINE_NO:228
  Else ; #DEBUG_LINE_NO:
    xAngle = 90.0 - Math.acos(fZDifferencePlayerFireNode * -1.0 / fDistanceFireNodeToPlayer) ; #DEBUG_LINE_NO:231
  EndIf ; #DEBUG_LINE_NO:
  fireNodeRef.setAngle(xAngle, fireNodeRef.GetAngleY(), fireNodeRef.GetAngleZ() + zOffset) ; #DEBUG_LINE_NO:234
  turretWeapon.Fire(fireNodeRef, turretAmmo) ; #DEBUG_LINE_NO:235
EndFunction
