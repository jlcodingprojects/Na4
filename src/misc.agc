function CreateBText(a$)
    i=CreateText(a$)
    SetTextColor(i,0,0,0,255)
    SetTextMaxWidth( i, 100 )
endfunction i

function diff(a#,b#)
    c#=a#-b#
    if c#<0 then c#=0-c#
endfunction c#

global pointtime as float
global dragtime as float
global frametime as float

function TrySound(id)
	if DisableSounds=0
		tempf#=timer()
		tmpid=PlaySound(id)
		if timer()-tempf#>0.09 then DisableSounds=1
	endif
endfunction tmpid


function LoadProgress()
	doUnlock=0
	if GetFileExists("v2.na4")=0 //first time running expansion pack version
		if GetFileExists("prg.na4") //file exists therefore game has been run before therefore unlock full version
			doUnlock=1
		endif
		f=OpenToWrite("v2.na4") //create file
		CloseFile(f)
	endif
	
	if GetFileExists("prg.na4")
		f=OpenToRead("prg.na4")
			maxLevel=ReadInteger(f)
			musicvol=ReadInteger(f)
			sfxvol=ReadInteger(f)
			upframe=ReadInteger(f)
			lightColours=ReadInteger(f)
			lastLevel=maxLevel
			
			for k=1 to 20
				arti[k].unlocked=ReadInteger(f)
			next
			
			FullVersionUnlocked=ReadInteger(f)
		CloseFile(f)
	else
		maxLevel=1
		lastLevel=1
		musicvol=70
		sfxvol=100
		upframe=0
		lightColours=0
		for k=1 to 20
			arti[k].unlocked=0
		next
		
		FullVersionUnlocked=0
		SaveProgress()
	endif
	if GetFileExists("skp.na4")
		f=OpenToRead("skp.na4")
			for k=1 to 99
				skippedLevels[k]=ReadInteger(f)
			next
		CloseFile(f)
	else
		for k=1 to 99
			skippedLevels[k]=0
		next
		SaveProgress()
	endif
	
	if doUnlock=1
		FullVersionUnlocked=1
		SaveProgress()
	endif
endfunction

function SaveProgress()
	f=OpenToWrite("prg.na4")
		WriteInteger(f,maxLevel)
		WriteInteger(f,musicvol)
		WriteInteger(f,sfxvol)
		WriteInteger(f,upframe)
		WriteInteger(f,lightColours)
		
		for k=1 to 20
			WriteInteger(f,arti[k].unlocked)
		next
		
		WriteInteger(f,FullVersionUnlocked)
	CloseFile(f)
	f=OpenToWrite("skp.na4")
		for k=1 to 99
			WriteInteger(f,skippedLevels[k])
		next
	CloseFile(f)
endfunction

function easeInOutQuad(t#, b#, c#, d#)
	ret# as float
	ret#=0
	t# = t#/(d#/2)
	if t# < 1
		ret#=c#/2*t#*t# + b#
	else
		t#=t#-1.0
		ret#=-c#/2 * (t#*(t#-2) - 1) + b#
	endif
endfunction ret#

function LoadLevel(file as string)
	fansEnumC=0
	cArti=0 //default no artifact
	cAnimate=0 //set at same time to reset artifact animation
	for k=1 to 99
		fansEnum[k]=0
	next
	
	
	f=OpenToRead(file)
		levelPar=ReadInteger(f)
		SetSpritePosition(player.id,ReadFloat(f),ReadFloat(f))
		portal.pos.x=ReadFloat(f)
		portal.pos.y=ReadFloat(f)
		SetSpritePositionByCenter(portal.id,portal.pos.x,portal.pos.y)
		SetSpritePositionByCenter(portal.id2,portal.pos.x,portal.pos.y)
		
		for k=1 to 3
			SetSpritePosition(stars[k].id,ReadFloat(f),ReadFloat(f))
		next
		c=ReadInteger(f)
		vc=ReadInteger(f)
		cArti=ReadInteger(f) //0 if no artifact, else contains artifact ID
		for k=1 to c
			typ=ReadInteger(f)
			if typ=w_teleporter
				x1#=ReadFloat(f)
				y1#=ReadFloat(f)
				x2#=ReadFloat(f)
				y2#=ReadFloat(f)
				t=AddTeleporter(x1#,y1#,x2#,y2#)
			elseif typ=w_laser
				x1#=ReadFloat(f)
				y1#=ReadFloat(f)
				a1#=ReadFloat(f)
				t=AddLaser(x1#,y1#,a1#)
			elseif typ=w_lever
				x1#=ReadFloat(f)
				y1#=ReadFloat(f)
				tid=ReadInteger(f)
				t=AddLever(x1#,y1#,tid)
			elseif typ=w_timer
				duration#=ReadFloat(f)
				delay#=ReadFloat(f)
				toggleID=ReadInteger(f)
				t=AddTimer(duration#,delay#,toggleID)
			elseif typ=w_fan
				inc fansEnumC,1
				x#=ReadFloat(f)
				y#=ReadFloat(f)
				a#=ReadFloat(f)
				t=AddFan(x#,y#,a#)
				fansEnum[fansEnumC]=t
			elseif typ=w_spin
				sx#=ReadFloat(f)
				sy#=ReadFloat(f)
				x#=ReadFloat(f)
				y#=ReadFloat(f)
				a#=ReadFloat(f)
				spin#=ReadFloat(f)
				t=AddWall(typ,sx#,sy#,x#,y#,a#)
				walls[t].f1=spin#
			else
				sx#=ReadFloat(f)
				sy#=ReadFloat(f)
				x#=ReadFloat(f)
				y#=ReadFloat(f)
				a#=ReadFloat(f)
				t=AddWall(typ,sx#,sy#,x#,y#,a#)
				if typ=w_wall
					//AddGrass(walls[t].tg,x#+(sy#*0.15),y#,a#,sx#-(sy#*0.3))
					AddGrass(walls[t].tg,x#,y#,a#,sx#)
				endif
			endif
		next
		for k=1 to vc
			typ=ReadInteger(f)
			sx#=ReadFloat(f)
			sy#=ReadFloat(f)
			x#=ReadFloat(f)
			y#=ReadFloat(f)
			a#=ReadFloat(f)
			t=AddVine(typ,sx#,x#,y#,a#)
		next
		if arti[cArti].unlocked=1 then cArti=0
		if cArti<>0
			arti[cArti].id=CreateSprite(img.art[cArti])
			arti[cArti].pos.x=ReadFloat(f)
			arti[cArti].pos.y=ReadFloat(f)
			arti[cArti].scale=ReadFloat(f)
			SetSpritePosition(arti[cArti].id,arti[cArti].pos.x,arti[cArti].pos.y)
			SetSpriteSize(arti[cArti].id,8*arti[cArti].scale,8*arti[cArti].scale)
			if lightColours then SetSpriteColor(arti[cArti].id,0,0,0,255)
		endif
    CloseFile(f)
    
    for k=1 to 299
		if walls[k].typ=w_timer then walls[k].f1=timer()
	next
endfunction
function SaveLevel(file as string)
	c=0
	vc=0
	for k=1 to 299
		if walls[k].active=1 then inc c,1
	next
	for k=1 to 299
		if vines[k].active=1 then inc vc,1
	next
	
	if vc=0
		sync() //clear print
		SetPrintColor(255,0,0)
		//print("WARNING: No Vines, intended?")
		//if levelPar=5 then print("WARNING: LevelPar is DEFAULT, intended?")
		//sync()
	endif
	
	
	
	f=OpenToWrite(file,0)
		WriteInteger(f,levelPar)
		WriteFloat(f,GetSpriteX(player.id))
		WriteFloat(f,GetSpriteY(player.id))
		WriteFloat(f,GetSpriteX(portal.id)+7)
		WriteFloat(f,GetSpriteY(portal.id)+7)
		for k=1 to 3
			WriteFloat(f,GetSpriteX(stars[k].id))
			WriteFloat(f,GetSpriteY(stars[k].id))
		next
		WriteInteger(f,c) 
		WriteInteger(f,vc)
		WriteInteger(f,cArti)
		realk = 0
		for k=1 to 299
			if walls[k].active=1
				inc realk,1
				if walls[k].typ=w_teleporter
					WriteInteger(f,walls[k].typ)
					WriteFloat(f,GetSpriteX(walls[k].id))
					WriteFloat(f,GetSpriteY(walls[k].id))
					WriteFloat(f,GetSpriteX(walls[k].id2))
					WriteFloat(f,GetSpriteY(walls[k].id2))
				elseif walls[k].typ=w_laser
					WriteInteger(f,walls[k].typ)
					WriteFloat(f,GetSpriteX(walls[k].id))
					WriteFloat(f,GetSpriteY(walls[k].id))
					WriteFloat(f,GetSpriteAngle(walls[k].id))
				elseif walls[k].typ=w_lever
					WriteInteger(f,walls[k].typ)
					WriteFloat(f,GetSpriteX(walls[k].id))
					WriteFloat(f,GetSpriteY(walls[k].id))
					WriteInteger(f,walls[k].i4 - (k-realk)) //reassign the target id based on where it will appear
				elseif walls[k].typ=w_timer
					WriteInteger(f,walls[k].typ)
					WriteFloat(f,walls[k].f2)
					WriteFloat(f,walls[k].f3)
					
					
					WriteInteger(f,walls[k].i1 - (k-realk))
				elseif walls[k].typ=w_fan
					WriteInteger(f,walls[k].typ)
					WriteFloat(f,GetSpriteX(walls[k].id))
					WriteFloat(f,GetSpriteY(walls[k].id))
					WriteFloat(f,GetSpriteAngle(walls[k].id))
					//WriteInteger(f,walls[k].i4)
				elseif walls[k].typ=w_spin
					WriteInteger(f,walls[k].typ)
					WriteFloat(f,GetSpriteWidth(walls[k].id))
					WriteFloat(f,GetSpriteHeight(walls[k].id))
					WriteFloat(f,GetSpriteX(walls[k].id))
					WriteFloat(f,GetSpriteY(walls[k].id))
					WriteFloat(f,GetSpriteAngle(walls[k].id))
					WriteFloat(f,walls[k].f1)
				else
					WriteInteger(f,walls[k].typ)
					WriteFloat(f,GetSpriteWidth(walls[k].id))
					WriteFloat(f,GetSpriteHeight(walls[k].id))
					WriteFloat(f,GetSpriteX(walls[k].id))
					WriteFloat(f,GetSpriteY(walls[k].id))
					WriteFloat(f,GetSpriteAngle(walls[k].id))
				endif
			endif
		next
		for k=1 to 299
			if vines[k].active
				WriteInteger(f,vines[k].typ)
				WriteFloat(f,GetSpriteWidth(vines[k].id))
				WriteFloat(f,GetSpriteHeight(vines[k].id))
				WriteFloat(f,GetSpriteXByCenter(vines[k].id))
				WriteFloat(f,GetSpriteYByCenter(vines[k].id))
				WriteFloat(f,GetSpriteAngle(vines[k].id))
			endif
		next
		if cArti<>0
			WriteFloat(f,arti[cArti].pos.x)
			WriteFloat(f,arti[cArti].pos.y)
			WriteFloat(f,arti[cArti].scale)
		endif
	CloseFile(f)
endfunction

function CreateExtendedText(text$,posx#,posy#,size#,alignment)
	ret=CreateText(text$)
	SetTextPosition(ret,posx#,posy#)
	SetTextSize(ret,size#)
	SetTextAlignment(ret,1)
	SetTextSpacing(ret,1)
endfunction ret

function SetSpritePositionByCenter(id,x as float, y as float)
	SetSpritePosition(id,x-(GetSpriteWidth(id)/2),y-(GetSpriteHeight(id)/2))
endfunction

function GetSpriteXByCenter(id)
	x#=GetSpriteX(id)+(GetSpriteWidth(id)/2)
endfunction x#

function GetSpriteYByCenter(id)
	y#=GetSpriteY(id)+(GetSpriteHeight(id)/2)
endfunction y#

function SpriteOverlay(id1, id2)
	SetSpritePosition(id1, GetSpriteX(id2)+(GetSpriteWidth(id2)/2)-(GetSpriteWidth(id1)/2), GetSpriteY(id2)+(GetSpriteHeight(id2)/2)-(GetSpriteHeight(id1)/2))
endfunction

function pointSprite(spriteID,x#,y#,angleRot#)
    dx# = x#-getSpriteXbyOffset(spriteID)
    dy# = y#-getSpriteYbyOffset(spriteID)
    setSpriteAngle(spriteID,atanfull(dx#,dy#)+angleRot#)
endfunction

function CreateBSprite(i,r,g,b) `CreateBackgroundSprite
    id=CreateSprite(i)
    SetSpriteSize(id,177.78,112.5)
    //SetSpriteSize(id,150,100)
    SetSpriteColor(id,r,g,b,255)
    SetSpritePosition(id,0-13.89,0-6.25)
    //SetSpritePosition(id,0,0)
    FixSpriteToScreen(id,1)
    SetSpriteDepth(id,25)
endfunction id

function printn(m$)
	for k=1 to 60
		print(m$)
		if GetPointerState() then k=61
		sync()
	next
endfunction

function debug()
	print("")
	print("GetDrawingTime "+str(GetDrawingTime()))
	print("GetParticleDrawnQuadCount "+str(GetParticleDrawnQuadCount()))
	print("GetPhysicsTime "+str(GetPhysicsTime()))
	print("GetPixelsDrawn "+str(GetPixelsDrawn()))
	print("GetUpdateTime "+str(GetUpdateTime()))
	print("FPS "+str(ScreenFPS()))
endfunction

function spriteonloc(s1,xp,yp)
    txs#=GetSpriteWidth(s1)
    tys#=GetSpriteHeight(s1)
    SetSpritePosition(s1,xp-(txs#/2),yp-(tys#/2))
endfunction

function GetSpriteCenterX(i)
    a#=GetSpriteX(i)+(GetSpriteWidth(i)/2)
endfunction a#

function GetSpriteCenterY(i)
    a#=GetSpriteY(i)+(GetSpriteHeight(i)/2)
endfunction a#

function dist(a as float,b as float,c as float,d as float)
    e as float
    e = sqrt((a - c)^2 + ((b-d)/1.5)^2)
endfunction e

	
function sinInterpolate(min#,max#,current#,speed#)
    distm#=max#/180.0
    ret#=(Sin(current#/distm#)*speed#)+1 //At full distance, SIN(180),  half, Sin(90)
endfunction ret#

Function DoSync()
	DoTouch()
	DoButtons()
	DoTendrils()
	Update(_FRAMETIME)
	
	if GetSpriteExists(player.id3) 
		SetSpritePosition(player.id3,GetSpriteX(player.id),GetSpriteY(player.id))
		SetSpritePosition(player.id4,GetSpriteX(player.id)-5,GetSpriteY(player.id)-5)
	endif
	Render()
	Swap()
endfunction

function SetSpritePositionByVector(id,pos as vector)
	SetSpritePosition(id,pos.x,pos.y)
	SetSpriteAngle(id,pos.z)
endfunction

function SetSpritePhysicsByVector(id,phy as vector)
	SetSpritePhysicsVelocity(id,phy.x,phy.y)
	SetSpritePhysicsAngularVelocity(id,phy.z)
endfunction

function Reset()
	SetViewOffset(0,0)
    
    DeleteAllWalls()
    DeleteAllVines()
    DeleteAllSprites()
    DeleteAllText()
    DeleteAllButtons()
    DeleteAllTendrils()
    DeleteArtifacts()
    SetViewZoom(1)
endfunction
