type images
    back
    backL
    bar
    menu
    menul
    player
    spike
    dot
    circleFull
    circle
    glow
    blur
    portal
    tele
    cross
    scare
    
    laserblock
    laserbeam1
    laserbeam2
    flare
    sunburst
    rain
    
    click
    point
    aim
    
    tendrils
    tendrils151
    tendrilsbox
    static1
    static2
    
    bLevel1
    bLevel2
    bLevelS1
    bLevelS2
    bRestart1
    bRestart2
    bBack1
    bBack2
    bSettings1
    bSettings2
    bLove1
    bLove2
    bNext1
    bNext2
    bMenu1
    bMenu2
    bPause1
    bPause2
    bBlank1
    bBlank2
    bArtifacts1
    bArtifacts2
    bTwitter1
    bTwitter2
    bFB1
    bFB2
    bRate1
    bRate2
    bSkip1
    bSkip2
    bUnlock1
    bUnlock2
    bRestore1
    bRestore2
    
    lbase1
    lbase2
    lever
    fan
    
    timetrial
    notify
    
    lb as integer[20,2]
    art as integer[20]
    previews as integer[99]
    
    g4l
	g4r
	g2
	g81
	g82
	g121
	g122
	
    grass
    vine as integer[9]
    
    pu as integer[3]
endtype

type artifacts
	id
	pos as vector //x,y,z[angle]
	scale as float
	unlocked
endtype

type sounds
	soundtrack
	bop
	click
	click2
	explode
	whoosh
	beeping
	sparkly
	boom
	hit
	raining
	growl
	ambient
	achieve
endtype


type button
    id `Sprite ID
    tid `TextID
    e `exists
    a `Active
    textAlpha as float `Text alpha color
    i1 `image1
    i2 `"
    s `State
    sounding `Play sound?
endtype

type tendrilsT
	e
	a
	bid
	id
	typ
	size as float
	tsize as float
	x as float
	y as float
	max as float
	min as float
endtype

type tutorial
	state
	part
	clicker
	
	tween1
	tween2
	tween3
	
	v1
	v2
	v3
	v4
	v5
	v6
	v7
	v8
	v9
	
	t1
	t2
	t3
	t4
	t5
	
	f1 as float
	f2 as float
	f3 as float
	f4 as float
	f5 as float
	
	s1 as string
	s2 as string
	s3 as string
	s4 as string
	s5 as string
	
	initshots
	text
	text2
	texta
	textIn
	changed
	timed as float
	aimer as tAim
	aimer2 as tAim
endtype

type timetrials
	time as float
	maxtime as float
	spriteID as integer
	state as integer
endtype


type shakeT
	rad as float
	offsetX as float
	offsetY as float
	randomAngle as float
	lastTime as float
endtype


type pointer
    x as float
    ox as float
    lx as float
    wx as float
    y as float
    oy as float
    ly as float
    wy as float
    s
    p
    r
    t as float
endtype


type vector
	x as float
	y as float
	z as float
endtype

type tObject
	id
	id2
	id3
	id4
	pos as vector
	vel as vector
	speed as float
	ospeed as float
	state
	aiming
	damping as float
	angledamping as float
	restitution as float
	kill as float
	f1 as float
	f2 as float
	f3 as float
	f4 as float
	i1 as integer
	i2 as integer
	i3 as integer
	i4 as integer
	sticking as integer
	dead as integer
endtype

type tAim
	active
	id as integer[99]
	pos as vector[99]
endtype


type tWall
	id
	id2
	id3
	id4
	idImg as integer
	tg as tGrass
	
	typ
	active
	
	v1 as vector
	v2 as vector
	t1 as float
	t2 as float
	i1 as integer
	i2 as integer
	i3 as integer
	i4 as integer
	f1 as float
	f2 as float
	f3 as float
	f4 as float
	toggle as integer
	
	unstickable as integer
	teleporting as integer
	
	pos as vector
	vel as vector
endtype

type tGrass
	active as integer
	id as integer[29]
	count as integer
endtype

type tVine
	id
	typ
	active
	pos as vector
	scale as float
	//scissor1 as vector
	//scissor2 as vector
endtype

type tGame
	state
	portalState
endtype

type tObjects
	maxW
	wallCount as integer
	lowestWallY as integer
	lastDistance
	distanceToNextWall
	
	screenTop
	screenBottom
	
	physicsSpeed as float
	screenSpeed as float
	screenPos as float
	
	lastWallPos
	
	phoneAngle as float
	phoneAngleDeadZone as float
	_device
endtype


