function AddWall(typ, sx as float, sy as float, x as float, y as float, a as float)
	for k=1 to 299
		if walls[k].active=0
			i=k
			k=300
		endif
	next
	walls[i]=CreateWall(typ,sx,sy,x,y,a, walls[i].idImg)
endfunction i



function DeleteGrass(tg ref as tGrass)
	if tg.active=1
		for k=1 to tg.count
			if GetSpriteExists(tg.id[k])
				DeleteSprite(tg.id[k])
				tg.id[k]=0
			endif
		next
		tg.count=0
		tg.active=0
	endif
endfunction

function AddGrass(tg ref as tGrass, gx as float, gy as float, a as float, grasslength as float)
	tg.active=1
	grasslengthRemainder as float //minimum 6, range in increments of 2
	grasscount as integer
	grasspos as float
	
	grasslengthRemainder=grasslength
	grasspos=0
	
	gx=gx+(cos(a+90)*2.4)
	gy=gy+(sin(a+90)*2.4)
	
	gdepth=4
	
	grasscount=0
	inc grasscount,1
	grasslengthRemainder=grasslengthRemainder-4-1
	tg.id[grasscount] = CreateSprite(img.g4l)
	SetSpriteDepth(tg.id[grasscount],4) //in front of player, vials etc
	//ggf[grasscount] = 4
	SetSpriteSize(tg.id[grasscount],4,4)
	SetSpriteColor(tg.id[grasscount],0,0,0,255)
	SetSpritePosition(tg.id[grasscount],gx+( cos(a)*grasspos ),gy+( sin(a)*grasspos ))
	SetSpriteOffset(tg.id[grasscount],0,0)
	SetSpriteAngle(tg.id[grasscount],a)
	grasspos=grasspos+4-1
	
	do
		inc grasscount,1
		
		if grasslengthRemainder>=12
			grasslengthRemainder=grasslengthRemainder-12+1
			tg.id[grasscount] = CreateSprite(img.g121)
			if random(0,5)=5 then SetSpriteImage(tg.id[grasscount],img.g122)
			//ggf[grasscount] = 12
			SetSpriteSize(tg.id[grasscount],12,4)
			SetSpriteColor(tg.id[grasscount],0,0,0,255)
			SetSpritePosition(tg.id[grasscount],gx+( cos(a)*grasspos ),gy+( sin(a)*grasspos ))
			SetSpriteOffset(tg.id[grasscount],0,0)
			SetSpriteAngle(tg.id[grasscount],a)
			SetSpriteDepth(tg.id[grasscount],4) //in front of player, vials etc
			grasspos=grasspos+12-1
		elseif grasslengthRemainder>=8
			grasslengthRemainder=grasslengthRemainder-8+1
			tg.id[grasscount] = CreateSprite(img.g81)
			if random(0,5)=5 then SetSpriteImage(tg.id[grasscount],img.g82)
			//ggf[grasscount] = 8
			SetSpriteSize(tg.id[grasscount],8,4)
			SetSpriteColor(tg.id[grasscount],0,0,0,255)
			SetSpritePosition(tg.id[grasscount],gx+( cos(a)*grasspos ),gy+( sin(a)*grasspos ))
			SetSpriteOffset(tg.id[grasscount],0,0)
			SetSpriteAngle(tg.id[grasscount],a)
			SetSpriteDepth(tg.id[grasscount],4) //in front of player, vials etc
			grasspos=grasspos+8-1
		elseif grasslengthRemainder>=4
			grasslengthRemainder=grasslengthRemainder-4+1
			tg.id[grasscount] = CreateSprite(img.g4r)
			//ggf[grasscount] = 4
			SetSpriteSize(tg.id[grasscount],4,4)
			SetSpriteColor(tg.id[grasscount],0,0,0,255)
			SetSpritePosition(tg.id[grasscount],gx+( cos(a)*grasspos ),gy+( sin(a)*grasspos ))
			SetSpriteOffset(tg.id[grasscount],0,0)
			SetSpriteAngle(tg.id[grasscount],a)
			SetSpriteDepth(tg.id[grasscount],4) //in front of player, vials etc
			grasspos=grasspos+4-1
		else
			grasslengthRemainder=grasslengthRemainder-2+1
			tg.id[grasscount] = CreateSprite(img.g2)
			//ggf[grasscount] = 2
			SetSpriteSize(tg.id[grasscount],2,4)
			SetSpriteColor(tg.id[grasscount],0,0,0,255)
			SetSpritePosition(tg.id[grasscount],gx+( cos(a)*grasspos ),gy+( sin(a)*grasspos ))
			SetSpriteOffset(tg.id[grasscount],0,0)
			SetSpriteAngle(tg.id[grasscount],a)
			SetSpriteDepth(tg.id[grasscount],4) //in front of player, vials etc
			grasspos=grasspos+2-1
		endif
		
		/*
		foo=1
		while foo=1
			DrawLine(gx,gy,gx+( cos(a)*grasspos ),gy+( sin(a)*grasspos ),255,255,255)
			if GetPointerReleased() then foo=0
			sync()
		endwhile
		//*/
		
		
		if grasslengthRemainder<=0 then exit
	loop
	
	inc grasscount,1
	//grasslength=grasslength-4
	tg.id[grasscount] = CreateSprite(img.g4r)
	//ggf[grasscount] = 4
	SetSpriteSize(tg.id[grasscount],4,4)
	SetSpriteColor(tg.id[grasscount],0,0,0,255)
	SetSpritePosition(tg.id[grasscount],gx+( cos(a)*(grasslength-3.6) ),gy+( sin(a)*(grasslength-3.6) ))
	SetSpriteOffset(tg.id[grasscount],0,0)
	SetSpriteAngle(tg.id[grasscount],a)
	SetSpriteDepth(tg.id[grasscount],5) //in front of player, vials etc
	grasspos=grasspos+8-1
	tg.count=grasscount
endfunction

function AddVine(typ, sx as float, x as float, y as float, a as float)
	for k=1 to 299
		if vines[k].active=0
			i=k
			k=300
		endif
	next
	
	
	
	
	vines[i].id=CreateSprite(img.vine[typ])
	vines[i].scale=vineRatios[typ]
	SetSpriteSize(vines[i].id,sx,sx*vines[i].scale)
	SetSpritePositionByCenter(vines[i].id,x,y)
	if typ<>0 then SetSpriteColor(vines[i].id,0,0,0,255)
	SetSpriteAngle(vines[i].id,a)
	SetSpriteDepth(vines[i].id,4)
	vines[i].active=1
	vines[i].pos.x=x
	vines[i].pos.y=y
	vines[i].pos.z=a
	vines[i].typ=typ
endfunction i
	
function CreateWall(typ, sx as float, sy as float, x as float, y as float, a as float, im)
	temp as tWall
	
	
	if sy<sx
		rx#=sy*3
	else
		rx#=sx*3
	endif
	
	temp.idImg=im
	
	if GetImageExists(temp.idImg)
		m=CreateMemblockFromImage(temp.idImg)
		tempx#=GetMemblockInt(m, 0) //0,1,2,3
		tempy#=GetMemblockInt(m, 4) //4,5,6,7
		
		
		if tempx#<>sx*12 or tempy#<>sy*12 //if this image has the same size as target then don't recreate
			DeleteImage(temp.idImg)
			temp.idImg=MakeRoundedRectangle(sx*12,sy*12,sy*3)
		endif
		DeleteMemblock(m)
	else
		temp.idImg=MakeRoundedRectangle(sx*12,sy*12,sy*3)
	endif
	
	SetImageMagFilter( temp.idImg, 1 ) 
	
	temp.id=CreateSprite(temp.idImg)
    SetSpriteSize(temp.id,sx,sy)
    SetSpriteColor(temp.id,234,234,225,255)
    SetSpritePosition(temp.id,x,y)
    SetSpriteAngle(temp.id,a)
    SetSpriteDepth(temp.id,8) //further block, some are closer
    
    /*
    Can only create the following:
			Static
			Dynamic
			Spin
			static
			OneWay
			Door
			Laser
    */
    
    select typ
			case w_wall
				SetSpriteOffset(temp.id,0,0)
				SetSpritePhysicsOn(temp.id,1)
				SetSpriteColor(temp.id,0,0,0,255)
				SetSpriteDepth(temp.id,7)
			endcase
			case w_dynamic
				SetSpritePhysicsOn(temp.id,2)
				SetSpriteColor(temp.id,15,15,15,255)
			endcase
			case w_spin
				SetSpritePhysicsOn(temp.id,1)
				SetSpriteColor(temp.id,0,0,0,255)
				temp.f1=0.5 //spin value, will always be set from level anyway
			endcase
			case w_static
				SetSpriteColor(temp.id,255,255,255,255)
				SetSpriteImage(temp.id,img.static1)
				SetSpriteSize(temp.id,8,8)
			endcase
			case w_oneway
				temp.id2=CreateSprite(0)
				SetSpriteSize(temp.id2,sx*1.5,sy)
				SetSpriteColor(temp.id2,255,255,255,255)
				SetSpritePosition(temp.id2,x,y)
				SetSpriteAngle(temp.id2,a)
				SetSpriteColorAlpha(temp.id2,50)
				SetSpriteDepth(temp.id2,6)
				
				SetSpritePhysicsOn(temp.id,1)
				SetSpriteColor(temp.id,200,200,200,255)
			endcase
			case w_door
				SetSpriteOffset(temp.id,0,0)
				//temp.t1=timer()
				temp.toggle=0
				temp.f1=255 //alpha colour
				temp.i1=1 //currently open or not
				SetSpritePhysicsOn(temp.id,1)
				SetSpriteColor(temp.id,0,0,0,222)
			endcase
	endselect
    
    temp.pos.x=x
    temp.pos.y=y
    temp.pos.z=a
    temp.typ=typ
    temp.active=1
endfunction temp

function HideAllGrass()
	for k=1 to 299
		if walls[k].active
			if walls[k].tg.active
				for i=1 to walls[k].tg.count
					SetSpriteColorAlpha(walls[k].tg.id[i],100)
				next
			endif
		endif
	next
endfunction

function ShowAllGrass()
	for k=1 to 299
		if walls[k].active
			if walls[k].tg.active
				for i=1 to walls[k].tg.count
					SetSpriteColorAlpha(walls[k].tg.id[i],255)
				next
			endif
		endif
	next
endfunction


function DeleteWall(k)
	DeleteGrass(walls[k].tg)
	if GetSpriteExists(walls[k].id) then DeleteSprite(walls[k].id)
	if GetSpriteExists(walls[k].id2) then DeleteSprite(walls[k].id2)
	if GetSpriteExists(walls[k].id3) then DeleteSprite(walls[k].id3)
	if walls[k].typ=w_laser
		if GetParticlesExists(walls[k].id4) then DeleteParticles(walls[k].id4)
		DeleteWall(walls[k].i3) //delete the assoc timer/lever
	elseif walls[k].typ=w_fan
		if GetParticlesExists(walls[k].id4) then DeleteParticles(walls[k].id4)
		if walls[k].i3<>0 then DeleteWall(walls[k].i3) //delete the assoc timer/lever
	elseif walls[k].typ=w_door
		DeleteWall(walls[k].i3) //delete the assoc timer/lever
	else
		if GetSpriteExists(walls[k].id4) then DeleteSprite(walls[k].id4)
	endif
	//if GetImageExists(walls[k].idImg) then DeleteImage(walls[k].idImg) //never delete images, they will be reused where possible
	//deleted otherwise
	walls[k].typ=0
	walls[k].active=0
	walls[k].v1.x=0
	walls[k].v1.y=0
	walls[k].v1.z=0
	walls[k].v2.x=0
	walls[k].v2.y=0
	walls[k].v2.z=0
	walls[k].pos.x=0
	walls[k].pos.y=0
	walls[k].pos.z=0
	walls[k].vel.x=0
	walls[k].vel.y=0
	walls[k].vel.z=0
	walls[k].t1=0
	walls[k].t2=0
	walls[k].i1=0
	walls[k].i2=0
	walls[k].f1=0
	walls[k].f2=0
	walls[k].unstickable=0
	walls[k].teleporting=0
endfunction

function DeleteAllWalls()
	for k=1 to 299
		//if walls[k].active
			DeleteWall(k)
		//endif
	next
endfunction


function DeleteVine(k)
	if GetSpriteExists(vines[k].id) then DeleteSprite(vines[k].id)
	
	vines[k].id=0
	vines[k].typ=0
	vines[k].active=0
	vines[k].pos.x=0
	vines[k].pos.y=0
	vines[k].pos.z=0
	vines[k].scale=0
endfunction

function DeleteAllVines()
	for k=1 to 299
		if vines[k].active
			DeleteVine(k)
		endif
	next
endfunction

function AddTeleporter(x1 as float, y1 as float, x2 as float, y2 as float)
	for k=1 to 299
		if walls[k].active=0
			i=k
			k=300
		endif
	next
	walls[i]=CreateTeleporter(x1,y1,x2,y2)
endfunction i

function AddLaser(x as float, y as float, a as float)
	for k=1 to 299
		if walls[k].active=0
			i=k
			k=300
		endif
	next
	walls[i]=CreateLaser(x,y,a)
endfunction i

function AddFan(x as float, y as float, a as float)
	for k=1 to 299
		if walls[k].active=0
			i=k
			k=300
		endif
	next
	walls[i]=CreateFan(x,y,a)
endfunction i

function AddLever(x as float, y as float, toggleID)
	for k=1 to 299
		if walls[k].active=0
			i=k
			k=300
		endif
	next
	walls[i]=CreateLever(x,y,toggleID)
endfunction i

function AddTimer(duration as float, delay as float, toggleID)
	for k=1 to 299
		if walls[k].active=0
			i=k
			k=300
		endif
	next
	walls[i]=CreateTimer(duration,delay,toggleID)
endfunction i

function CreateTeleporter(x1 as float, y1 as float, x2 as float, y2 as float)
	temp as tWall
	temp.id=CreateSprite(img.tele)
    SetSpriteSize(temp.id,8,8)
    SetSpriteColor(temp.id,255,255,225,255)
    SetSpritePosition(temp.id,x1,y1)
    SetSpriteDepth(temp.id,6)
    temp.id2=CreateSprite(img.tele)
    SetSpriteSize(temp.id2,8,8)
    SetSpriteColor(temp.id2,255,255,225,255)
    SetSpritePosition(temp.id2,x2,y2)
    SetSpriteDepth(temp.id2,6)
	temp.id3=CreateSprite(img.circleFull)
    SetSpriteSize(temp.id3,8,8)
    SetSpriteColor(temp.id3,255,255,225,0)
    SetSpritePosition(temp.id3,x1,y1)
    SetSpriteDepth(temp.id3,6)
    temp.id4=CreateSprite(img.circleFull)
    SetSpriteSize(temp.id4,8,8)
    SetSpriteColor(temp.id4,255,255,225,0)
    SetSpritePosition(temp.id4,x2,y2)
    SetSpriteDepth(temp.id4,6)
    
    temp.typ=w_teleporter
    temp.active=1
endfunction temp

function CreateLaser(x as float, y as float, a as float)
	temp as tWall
	temp.pos.x=x
	temp.pos.y=y
	temp.pos.z=a
	
	temp.id=CreateSprite(img.laserblock)
    SetSpriteSize(temp.id,45,30)
    SetSpriteOffset(temp.id,12,15)
    SetSpriteColor(temp.id,255,255,225,255)
    SetSpritePosition(temp.id,x,y)
    SetSpriteAngle(temp.id,a)
    SetSpriteDepth(temp.id,6)
    temp.id2=CreateSprite(img.laserbeam1)
    SetSpriteSize(temp.id2,45,30)
    SetSpriteColor(temp.id2,255,255,225,255)
    SetSpriteOffset(temp.id2,12,15)
    SetSpritePosition(temp.id2,x,y)
    SetSpriteAngle(temp.id2,a)
    SetSpriteDepth(temp.id2,8)
    SetSpriteShapeBox(temp.id,-2,-1.5,22,1.5,0)
    SetSpriteShapeBox(temp.id2,-2,-1.5,22,1.5,0)
    
    temp.id3=0 //flare
    temp.id4=CreateParticles(x+12,y+15)
    SetParticlesDirection(temp.id4,cos(a)*12,sin(a)*12)
    SetParticlesAngle(temp.id4,0)
    SetParticlesFrequency(temp.id4,5)
    SetParticlesImage(temp.id4,img.circleFull)
    SetParticlesLife(temp.id4,1.5)
    SetParticlesStartZone(temp.id4,-0.6,-0.7,0.6,0.7)
    SetParticlesDepth(temp.id4,5)
    SetParticlesSize(temp.id4,0.5)
    SetParticlesVelocityRange(temp.id4,0.8,1.1)
    FixParticlesToScreen(temp.id4,0)
    AddParticlesColorKeyFrame(temp.id4,0,255,255,255,0)
    AddParticlesColorKeyFrame(temp.id4,0.1,255,255,255,255)
    AddParticlesColorKeyFrame(temp.id4,1.3,255,255,255,200)
    AddParticlesColorKeyFrame(temp.id4,1.5,255,255,255,0)
    
    
    //temp.f1=timer() //lasers will be automatically switched by the associated timer
    temp.i1=1 //active
    temp.i2=0 //flare
    temp.i3=0 //the ID of the timer, must be set to kill it later
    temp.toggle=0 //if set to 1, toggle the laser
    temp.f2=255 //alpha
    
    temp.typ=w_laser
    temp.active=1
endfunction temp


function CreateFan(x as float, y as float, a as float)
	temp as tWall
	temp.pos.x=x
	temp.pos.y=y
	temp.pos.z=a
	
	temp.id=CreateSprite(img.fan)
    SetSpriteSize(temp.id,8,16)
    SetSpriteOffset(temp.id,4,16)
    SetSpriteColor(temp.id,255,255,225,255)
    SetSpritePosition(temp.id,x,y)
    SetSpriteDepth(temp.id,9)
    SetSpriteAngle(temp.id,a)
    
    fx#=GetSpriteXByOffset(temp.id)
    fy#=GetSpriteYByOffset(temp.id)
    
    
    
    temp.id4=CreateParticles(fx#,fy#)
    SetParticlesDirection(temp.id4,cos(a+90)*-1,sin(a+90)*-1)
    SetParticlesAngle(temp.id4,180)
    SetParticlesFrequency(temp.id4,10)
    SetParticlesImage(temp.id4,img.circleFull)
    SetParticlesLife(temp.id4,2.5)
    SetParticlesStartZone(temp.id4,-0.1,-0.1,0.1,0.1)
    SetParticlesDepth(temp.id4,6)
    SetParticlesSize(temp.id4,0.4)
    SetParticlesVelocityRange(temp.id4,0.4,1.2)
    FixParticlesToScreen(temp.id4,0)
    AddParticlesForce( temp.id4, 1, 2, cos(a+90)*-12,sin(a+90)*-12) 
    AddParticlesColorKeyFrame(temp.id4,0,245,245,255,0)
    AddParticlesColorKeyFrame(temp.id4,1.0,245,245,255,0)
    AddParticlesColorKeyFrame(temp.id4,1.1,245,245,255,255)
    AddParticlesColorKeyFrame(temp.id4,2.1,245,245,255,200)
    AddParticlesColorKeyFrame(temp.id4,2.1,245,245,255,50)
    AddParticlesColorKeyFrame(temp.id4,2.5,255,255,255,0)
    
    
    //temp.f1=timer() //lasers will be automatically switched by the associated timer
    temp.i1=1 //active
    temp.i3=0 //the ID of the toggler, must be set to kill it later
    temp.toggle=0 //if set to 1, toggle the laser
    temp.f2=255 //alpha
    
    temp.typ=w_fan
    temp.active=1
endfunction temp


function CreateLever(x as float, y as float, toggleID)
	temp as tWall
	temp.pos.x=x
	temp.pos.y=y
	scale as float
	scale=0.5
	
	temp.id=CreateSprite(img.lbase1)
    SetSpriteSize(temp.id,14*scale,7.6*scale)
    SetSpriteColor(temp.id,255,255,225,255)
    SetSpritePosition(temp.id,x,y)
    SetSpriteDepth(temp.id,4)
    SetSpriteColor(temp.id,255,255,255,255)
    temp.id2=CreateSprite(img.lever)
    SetSpriteSize(temp.id2,16*scale,2.5*scale)
    SetSpriteColor(temp.id2,255,255,225,255)
    SetSpriteOffset(temp.id2,0.6*scale,1.25*scale)
    SetSpritePositionByOffset(temp.id2,x+(7.1*scale),y+(4.1)*scale)
    SetSpriteColor(temp.id2,0,0,0,255)
    SetSpriteDepth(temp.id2,6)
    SetSpriteAngle(temp.id2,-170)
    //SetSpriteShapeBox(temp.id,-12,-1.5,12,1.5,0)
    //SetSpriteShapeBox(temp.id2,-12,-1.5,12,1.5,0)
    
    
    temp.f1=timer()
    temp.i1=1 //active
    temp.i2=0 //switch is off
    temp.i3=0 //used for toggle detection, set to 1 if sprite hits it
    temp.i4=toggleID //the ID of the wall to toggle
    temp.f2=255 //alpha
    temp.f3=-170 //angle, ranges to -10
    
    temp.typ=w_lever
    temp.active=1
endfunction temp

function CreateTimer(duration as float, delay as float, toggleID)
	temp as tWall
	
    temp.f1=timer()
    temp.f2=duration
    temp.f3=delay
    
    temp.i1=toggleID
    
    temp.typ=w_timer
    temp.active=1
endfunction temp

function AddMotionBlock()
	for k=1 to 299
		if walls[k].active=0
			i=k
			k=300
		endif
	next
	walls[i]=CreateMotionBlock()
endfunction

function CreateMotionBlock()
	temp as tWall
	temp.id=CreateSprite(0)
    SetSpriteSize(temp.id,2,30)
    SetSpriteColor(temp.id,0,0,0,255)
    SetSpritePosition(temp.id,41,50)
    SetSpriteDepth(temp.id,6)
    
    temp.pos.x=41
    temp.pos.y=50
    
    temp.i1=250
    temp.i2=0
    
    temp.f1=1 //direction
    
    temp.v1.x=0 //motion vector
    temp.v1.y=-0.175
    
    SetSpritePhysicsOn(temp.id,1)
    
    temp.typ=w_motion
    temp.active=1
endfunction temp

