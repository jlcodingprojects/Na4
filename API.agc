function DoWalls()
	player.ospeed=player.speed
	tmx#=GetSpritePhysicsVelocityX(player.id)
	tmy#=GetSpritePhysicsVelocityY(player.id)
	player.speed=tmx#+tmy#
	//tmv#=abs(player.ospeed-player.speed)
	

	
	for k=1 to 299
		if walls[k].active
			
			//*//this code block plays the hit sound when you hit a block. However PlaySound causes weird lag on some devices so it's out
			if walls[k].typ<>w_teleporter and walls[k].typ<>w_fan and walls[k].typ<>w_laser and walls[k].typ<>w_timer
				if GetPhysicsCollision(player.id,walls[k].id)
					tmv#=abs(player.ospeed-player.speed)
					
					if tmv#>10
						tmv#=tmv#/2
						if tmv#>100 then tmv#=100
						tmp=TrySound(sfx.hit) //only play hit sound if going fast enough
						SetSoundInstanceVolume(tmp,tmv#)
					endif
				endif
			endif
			//*/
			
			if walls[k].typ=w_spin
				SetSpriteAngle(walls[k].id,GetSpriteAngle(walls[k].id)+walls[k].f1)
			endif
			if walls[k].typ=w_oneway
				if GetSpriteCollision(player.id,walls[k].id2)
					SetSpritePhysicsOff(walls[k].id)
					SetSpriteColorAlpha(walls[k].id,50)
				else
					ta=GetSpriteColorAlpha(walls[k].id)
					if ta<255 then ta=ta+5
					if ta>255 then ta=255
					SetSpriteColorAlpha(walls[k].id,ta)
					SetSpritePhysicsOn(walls[k].id,1)
				endif
			endif
			if walls[k].typ=w_door
				if walls[k].toggle
					walls[k].toggle=0
					
					if walls[k].i1=1
						walls[k].i1=0
						SetSpritePhysicsOff(walls[k].id)
					else
						walls[k].i1=1
						SetSpritePhysicsOn(walls[k].id,1)
					endif
				endif
				
				if walls[k].i1=0
					if walls[k].f1>0 then walls[k].f1=walls[k].f1-15
					if walls[k].f1<0 then walls[k].f1=0
				else
					if walls[k].f1<222 then walls[k].f1=walls[k].f1+15
					if walls[k].f1>222 then walls[k].f1=222
				endif
				SetSpriteColorAlpha(walls[k].id,walls[k].f1)
			endif
			if walls[k].typ=w_teleporter
				a=GetSpriteColorAlpha(walls[k].id3)
				if a>0 then a=a-15
				if a<0 then a=0
				SetSpriteColorAlpha(walls[k].id3,a)
				SetSpriteColorAlpha(walls[k].id4,a)
						
				if walls[k].teleporting=1
					if GetSpriteCollision(player.id,walls[k].id)=0
						if GetSpriteCollision(player.id,walls[k].id2)=0
							walls[k].teleporting=0
						endif
					endif
				else
					if GetSpriteCollision(player.id,walls[k].id)
						walls[k].teleporting=1
						player.pos.x=GetSpriteX(walls[k].id2)+4-2.5
						player.pos.y=GetSpriteY(walls[k].id2)+4-2.5
						player.pos.z=GetSpriteAngle(player.id)
						player.vel.x=GetSpritePhysicsVelocityX(player.id)
						player.vel.y=GetSpritePhysicsVelocityY(player.id)
						player.vel.z=GetSpritePhysicsAngularVelocity(player.id)
						SetSpritePositionByVector(player.id,player.pos)
						SetSpritePhysicsByVector(player.id,player.vel)
						SetSpritePhysicsDamping( player.id, player.damping)
						SetSpritePhysicsRestitution( player.id, player.restitution)
						SetSpriteColorAlpha(walls[k].id3,255)
						SetSpriteColorAlpha(walls[k].id4,255)
						TrySound(sfx.bop)
						
					elseif GetSpriteCollision(player.id,walls[k].id2)
						walls[k].teleporting=1
						player.pos.x=GetSpriteX(walls[k].id)+4-2.5
						player.pos.y=GetSpriteY(walls[k].id)+4-2.5
						player.pos.z=GetSpriteAngle(player.id)
						player.vel.x=GetSpritePhysicsVelocityX(player.id)
						player.vel.y=GetSpritePhysicsVelocityY(player.id)
						player.vel.z=GetSpritePhysicsAngularVelocity(player.id)
						SetSpritePositionByVector(player.id,player.pos)
						SetSpritePhysicsByVector(player.id,player.vel)
						SetSpritePhysicsDamping( player.id, player.damping)
						SetSpritePhysicsRestitution( player.id, player.restitution)
						SetSpriteColorAlpha(walls[k].id3,255)
						SetSpriteColorAlpha(walls[k].id4,255)
						TrySound(sfx.bop)
						
					endif
				endif
				
			endif
			if walls[k].typ=w_motion
				inc walls[k].i2,1
				if walls[k].i2=walls[k].i1 //flip direction and reset counter
					walls[k].f1=-walls[k].f1
					walls[k].i2=0
				endif
				
				walls[k].pos.x=walls[k].pos.x+(walls[k].v1.x*walls[k].f1)
				walls[k].pos.y=walls[k].pos.y+(walls[k].v1.y*walls[k].f1)
				
				SetSpritePositionByVector(walls[k].id,walls[k].pos)
			endif
			
			
			if walls[k].typ=w_fan
				if GetSpriteCollision(player.id,walls[k].id)
					fx#=GetSpritePhysicsVelocityX(player.id)
					fy#=GetSpritePhysicsVelocityY(player.id)
					d#=dist(GetSpriteX(player.id),GetSpriteY(player.id),walls[k].pos.x+4,walls[k].pos.y+16)
					d#=16-d#
					if d#>16 then d#=16
					if d#<0 then d#=0
					d#=d#/8.0 //str multiplyer
					
					fx#=fx#+(cos(walls[k].pos.z-90)*(5+d#))
					fy#=fy#+(sin(walls[k].pos.z-90)*(5+d#))
					
					SetSpritePhysicsVelocity(player.id,fx#,fy#)
				endif
			endif
			
			if walls[k].typ=w_laser
				if walls[k].toggle=1
					walls[k].toggle=0
					
					if walls[k].i1=1
						walls[k].i1=0
						SetParticlesVisible(walls[k].id4,0)
					else
						walls[k].i1=1
						SetParticlesVisible(walls[k].id4,1)
					endif
				endif
				
				if walls[k].i1=1
					walls[k].f2=walls[k].f2+25
					if walls[k].f2>255 then walls[k].f2=255
				else
					walls[k].f2=walls[k].f2-25
					if walls[k].f2<0 then walls[k].f2=0
				endif
				
				SetSpriteColorAlpha(walls[k].id2,walls[k].f2)
				
				
				if walls[k].i1=1 and walls[k].f2>100
					if GetSpriteCollision(player.id,walls[k].id2) and game.state=1
						player.state=0
						if player.dead=0 then player.dead=1
						if walls[k].i2=0
							walls[k].i2=1 //flare
							walls[k].id3=CreateSprite(img.flare)
							SetSpriteSize(walls[k].id3,113,90)
							SetSpriteOffset(walls[k].id3,84,59)
							SetSpriteDepth(walls[k].id3,3)
							SetSpritePositionByOffset(walls[k].id3,walls[k].pos.x+10,walls[k].pos.y+18)
							walls[k].f3=0
							walls[k].f4=0
						endif
					endif
				endif
				if walls[k].i2=1
					//SetSpritePositionByOffset(walls[k].id3,walls[k].pos.x+walls[k].f4+10,walls[k].pos.y+18)
					SetSpritePositionByOffset(walls[k].id3,walls[k].pos.x+10+cos(walls[k].pos.z)*walls[k].f4,walls[k].pos.y+18+sin(walls[k].pos.z)*walls[k].f4)
					SetSpriteColorAlpha(walls[k].id3,walls[k].f3)
					walls[k].f4=walls[k].f4+1
					pointSprite(walls[k].id3,0,0,60)
					
					walls[k].f3=walls[k].f3+20
					if walls[k].f3>255
						walls[k].f3=255
						walls[k].i2=2
					endif
				endif
				if walls[k].i2=2
					//SetSpritePositionByOffset(walls[k].id3,walls[k].pos.x+walls[k].f4+10,walls[k].pos.y+18)
					SetSpritePositionByOffset(walls[k].id3,walls[k].pos.x+10+cos(walls[k].pos.z)*walls[k].f4,walls[k].pos.y+18+sin(walls[k].pos.z)*walls[k].f4)
					SetSpriteColorAlpha(walls[k].id3,walls[k].f3)
					walls[k].f3=walls[k].f3-20
					if walls[k].f3<0 then walls[k].f3=0
					walls[k].f4=walls[k].f4+1
					pointSprite(walls[k].id3,0,0,60)
				endif
			endif
			
			if walls[k].typ=w_timer
				if walls[k].f3=0 //there is no delay, or it has already gone
					if timer()-walls[k].f1>walls[k].f2
						walls[k].f1=timer()
						walls[walls[k].i1].toggle=1
					endif
				else
					if timer()-walls[k].f1>walls[k].f3
						walls[k].f3=0
						walls[k].f1=timer()
					endif
				endif
			endif
			
			if walls[k].typ=w_static
				if GetSpriteCollision(player.id,walls[k].id)
					player.sticking=k
					//SetSpriteColor(walls[k].id,200,200,200,200)
					SetSpriteImage(walls[k].id,img.static2)
				else
					if player.sticking=k
						player.sticking=-k
					elseif player.sticking=-k
						player.sticking=0
					endif
					//SetSpriteColor(walls[k].id,255,255,255,255)
					SetSpriteImage(walls[k].id,img.static1)
				endif
				
			endif
			
			if walls[k].typ=w_lever
				if GetSpriteCollision(player.id,walls[k].id)
					if walls[k].i3=0
						if walls[k].i2=0
							walls[k].i2=1
							walls[walls[k].i4].toggle=1
							SetSpriteImage(walls[k].id,img.lbase2)
						else
							walls[k].i2=0
							walls[walls[k].i4].toggle=1
							SetSpriteImage(walls[k].id,img.lbase1)
						endif
					endif
					
					walls[k].i3=1
				else
					walls[k].i3=0
				endif
				SetSpriteAngle(walls[k].id2,walls[k].f3)
				if walls[k].i2=0
					if walls[k].f3>-170
						walls[k].f3=walls[k].f3-10
					else
						walls[k].f3=-170
					endif
				else
					if walls[k].f3<-10
						walls[k].f3=walls[k].f3+10
					else
						walls[k].f3=-10
					endif
				endif
			endif
			
		endif
	next
endfunction

function DoFansPreview()
	for fk=1 to fansEnumC
		k=fansEnum[fk] //only look through the fans
		if walls[k].active=1
			if walls[k].typ=w_fan
				if GetSpriteCollision(player.id,walls[k].id)
					fx#=GetSpritePhysicsVelocityX(player.id)
					fy#=GetSpritePhysicsVelocityY(player.id)
					d#=dist(GetSpriteX(player.id),GetSpriteY(player.id),walls[k].pos.x+4,walls[k].pos.y+16)
					d#=16-d#
					if d#>16 then d#=16
					if d#<0 then d#=0
					d#=d#/8.0 //str multiplyer
					
					fx#=fx#+(cos(walls[k].pos.z-90)*(5+d#))
					fy#=fy#+(sin(walls[k].pos.z-90)*(5+d#))
					
					SetSpritePhysicsVelocity(player.id,fx#,fy#)
				endif
			endif
		endif
	next
endfunction



function MakeRoundedRectangle(x as float, y as float, radius as float)
	sizex=ceil(x)+1
	sizey=ceil(y)+1
	m=CreateMemblock(12+((sizex*sizey)*4)) //+24 for buffer size
	SetMemblockInt(m, 0, x) //0,1,2,3
	SetMemblockInt(m, 4, y) //4,5,6,7
	SetMemblockInt(m, 8, 32) //8,9,10,11 - ColourSpace
	pos = 12
	
	if radius>x/2 then radius=x/2
	
	for i=1 to y
		for k=1 to x //top line first, the second/third/forth etc
			SetMemblockByte(m, pos, 255)
			SetMemblockByte(m, pos+1, 255)
			SetMemblockByte(m, pos+2, 255)
			i#=i
			k#=k
			
			SetMemblockByte(m, pos+3, 255)
			
			if k<radius and i<radius //if less than circle diamaters
				SetMemblockByte(m, pos+3, 0)
				if ((radius-k#)*(radius-k#)+(radius-i#)*(radius-i#))>radius*radius
					SetMemblockByte(m, pos+3, 0)
				else
					SetMemblockByte(m, pos+3, 255)
				endif
			endif
			
			if k>(x-radius) and i<radius //if less than circle diamaters
				SetMemblockByte(m, pos+3, 0)
				if (((x-radius)-k#)*((x-radius)-k#)+(radius-i#)*(radius-i#))>radius*radius
					SetMemblockByte(m, pos+3, 0)
				else
					SetMemblockByte(m, pos+3, 255)
				endif
			endif
			
			if k<radius and i>(y-radius) //if less than circle diamaters
				SetMemblockByte(m, pos+3, 0)
				if ((radius-k#)*(radius-k#)+((y-radius)-i#)*((y-radius)-i#))>radius*radius
					SetMemblockByte(m, pos+3, 0)
				else
					SetMemblockByte(m, pos+3, 255)
				endif
			endif
			
			if k>(x-radius) and i>(y-radius) //if less than circle diamaters
				SetMemblockByte(m, pos+3, 0)
				if (((x-radius)-k#)*((x-radius)-k#)+((y-radius)-i#)*((y-radius)-i#))>radius*radius
					SetMemblockByte(m, pos+3, 0)
				else
					SetMemblockByte(m, pos+3, 255)
				endif
			endif
			
			
			inc pos, 4
		next
		//roundoff=roundoff-1
	next
	
	imx=CreateImageFromMemblock(m)
endfunction imx



function Shake()
	/*
	if shaking=1
		shaks.rad = 0.6
		shaks.lastTime=timer()
		shaks.randomAngle = random(0,360)
		shaks.offsetX = sin(shaks.randomAngle) * shaks.rad
		shaks.offsetY = cos(shaks.randomAngle) * shaks.rad //create offset 2d vector
		SetViewOffset(shaks.offsetX,shaks.offsetX)
		shaking=2
	elseif shaking=2
		if timer()-shaks.lastTime>0.1
			lastTime=timer()
			shaks.rad=shaks.rad*0.95 //diminish radius each frame
			shaks.randomAngle=random(1,360)
			shaks.offsetX = sin(shaks.randomAngle) * shaks.rad //create offset 2d vector
			shaks.offsetY = cos(shaks.randomAngle) * shaks.rad //create offset 2d vector
			SetViewOffset(shaks.offsetX,shaks.offsetY)
			if shaks.rad<0.2 then shaking=3
        endif
	elseif shaking=3
		SetViewOffset(0,0)
		shaking=0
	endif
	*/
endfunction

function DoArti()
	d#=dist(GetSpriteX(player.id),GetSpriteY(player.id),arti[cArti].pos.x,arti[cArti].pos.y)
	
	
	if cArti<>0
		if cAnimate=0
			if d#<51
				SetSpriteColorAlpha(arti[cArti].id,255-(d#*5))
			else
				SetSpriteColorAlpha(arti[cArti].id,0)
			endif
		else
			SetSpriteColorAlpha(arti[cArti].id,0)
		endif
		
		if arti[cArti].unlocked=0
			if GetSpriteCollision(player.id,arti[cArti].id)
				arti[cArti].unlocked=1
				SaveProgress()
				cAnimate=1
			endif
		endif
	endif
	
	if cAnimate=1
		
		PlaySound(sfx.achieve)
		cAnimateT=timer()
		cAnimateID1=CreateSprite(img.art[cArti])
		SetSpriteSize(cAnimateID1,18,18)
		SetSpritePosition(cAnimateID1,75-9-2,-20)
		SetSpriteDepth(cAnimateID1,3)
		FixSpriteToScreen(cAnimateID1,1)
		SetSpriteColorAlpha(cAnimateID1,0)
		if lightColours then SetSpriteColor(cAnimateID1,0,0,0,0)
		
		cAnimateID2=CreateSprite(img.sunburst)
		SetSpriteSize(cAnimateID2,72*1.75,29*1.75)
		SetSpriteOffset(cAnimateID2,36*1.75,7.17*1.75)
		SetSpritePositionByCenter(cAnimateID2,75,2+9+(7.17*1.75))
		SetSpriteColorAlpha(cAnimateID2,0)
		SetSpriteDepth(cAnimateID2,4)
		FixSpriteToScreen(cAnimateID2,1)
		cAnimateT=timer()
		cAnimate=2
		
		
		cAnimateID3B=CreateText("ARTIFACT FOUND!")
		SetTextAlignment(cAnimateID3B,1)
		SetTextColor(cAnimateID3B,20,20,20,0)
		SetTextPosition(cAnimateID3B,75+0.5,15+0.5)
		SetTextFont(cAnimateID3B,gravityFONT)
		SetTextSize(cAnimateID3B,10)
		SetTextSpacing(cAnimateID3B,-0.2)
		SetTextDepth(cAnimateID3B,3)
		cAnimateID3=CreateText("ARTIFACT FOUND!")
		SetTextAlignment(cAnimateID3,1)
		SetTextColor(cAnimateID3,50,240,240,0)
		if lightColours then SetTextColor(cAnimateID3,0,0,0,0)
		SetTextPosition(cAnimateID3,75,15)
		SetTextFont(cAnimateID3,gravityFONT)
		SetTextSize(cAnimateID3,10)
		SetTextSpacing(cAnimateID3,-0.2)
		SetTextDepth(cAnimateID3,3)
		
	elseif cAnimate=2
		SetSpriteAngle(cAnimateID2,GetSpriteAngle(cAnimateID2)+0.1)
		a=GetSpriteColorAlpha(cAnimateID2)+10
		if a>200 then a=200
		SetSpriteColorAlpha(cAnimateID2,a)
		SetSpriteColorAlpha(cAnimateID1,a)
		SetTextColorAlpha(cAnimateID3,a)
		SetTextColorAlpha(cAnimateID3B,a/2)
		posy#=GetSpriteY(cAnimateID1)
		posx#=GetSpriteX(cAnimateID1)
		posy#=posy#+2
		posx#=posx#+0.05
		if posy#>1+(7.17*1.75)-9
			posy#=1+(7.17*1.75)-9
			cAnimate=3
		endif
		SetSpritePosition(cAnimateID1,posx#,posy#)
		
		SetTextPosition(cAnimateID3,75-posx#+75-9-2,15)
		SetTextPosition(cAnimateID3B,75-posx#+75-9-2,15)
	elseif cAnimate=3
		SetSpriteAngle(cAnimateID2,GetSpriteAngle(cAnimateID2)+0.04)
		a=GetSpriteColorAlpha(cAnimateID2)+10
		if a>200 then a=200
		SetSpriteColorAlpha(cAnimateID2,a)
		SetSpriteColorAlpha(cAnimateID1,a)
		SetTextColorAlpha(cAnimateID3,a)
		SetTextColorAlpha(cAnimateID3B,a/2)
		posy#=GetSpriteY(cAnimateID1)
		posx#=GetSpriteX(cAnimateID1)
		posx#=posx#+0.01
		SetSpritePosition(cAnimateID1,posx#,posy#)
		SetTextPosition(cAnimateID3,75-posx#+75-9-2,15)
		SetTextPosition(cAnimateID3B,75-posx#+75-9-2,15)
		if timer()-cAnimateT>4.5
			cAnimate=4
		endif
	elseif cAnimate=4
		SetSpriteAngle(cAnimateID2,GetSpriteAngle(cAnimateID2)+0.1)
		a=GetSpriteColorAlpha(cAnimateID2)-10
		if a<0 then a=0
		SetSpriteColorAlpha(cAnimateID2,a)
		SetSpriteColorAlpha(cAnimateID1,a)
		SetTextColorAlpha(cAnimateID3,a)
		SetTextColorAlpha(cAnimateID3B,a/2)
		posy#=GetSpriteY(cAnimateID1)
		posx#=GetSpriteX(cAnimateID1)
		posy#=posy#-2
		posx#=posx#+0.05
		if posy#<-20 then posy#=-20
		SetSpritePosition(cAnimateID1,posx#,posy#)
		SetTextPosition(cAnimateID3,75-posx#+75-9-2,15)
		SetTextPosition(cAnimateID3B,75-posx#+75-9-2,15)
	endif
endfunction
