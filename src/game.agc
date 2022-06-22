function gameFunction()
	if not dontshowloading
		print("Loading")
		sync()
		print("Loading.")
		sync()
		print("Loading..")
		sync()
		print("Loading...")
		sync()
	endif
	dontshowloading=0
	
	//SetPhysicsDebugOn()
	
	//SetRawMouseVisible(0) //TEMP
		
    b=CreateBSprite(img.back,255,255,255)
    if lightColours then SetSpriteImage(b,img.backl)
    bo=CreatebSprite(0,0,0,0)
    SetSpriteDepth(b,20)
    SetSpriteColor(bo,0,0,0,0)
    if lightColours then SetSpriteColor(bo,230,230,200,0)
    SetSpriteVisible(bo,0)
    SetSpriteDepth(bo,0)
    playmode=0
    
    SetPhysicsGravity(0,100)
    SetViewZoomMode(1)
    SetViewZoom(0.85)
    
    
    STARCOUNT=3
    starVol=100
    
    flagfordecrease=0
    
    
    player.id=CreateSprite(img.player)
    player.id3=CreateSprite(img.circle)
    player.id4=CreateSprite(img.glow)
    player.damping=0.3
    player.restitution=0.3 //will quickly change to 0.8
    player.state=5 //levelPAR (default 5
    player.dead=0
    player.kill=0
    player.aiming=0
    player.sticking=0
    player.angledamping=0
    SetSpriteSize(player.id,5,5)
    SetSpriteSize(player.id3,5,5)
    SetSpriteSize(player.id4,15,15)
    SetSpriteColor(player.id,234,234,225,255)
    SetSpriteColor(player.id3,234,234,225,255)
    SetSpriteColor(player.id4,234,234,225,255)
    if lightColours
		SetSpriteColor(player.id,0,0,0,255)
		SetSpriteColor(player.id3,0,0,0,255)
		SetSpriteColor(player.id4,0,0,0,255)
	endif
    SetSpritePosition(player.id,10,80)
    SetSpritePosition(player.id3,10,80)
    SetSpritePosition(player.id4,10,80)
    SetSpritePhysicsOn(player.id,2)
    SetSpriteShape(player.id,1)
    SetSpritePhysicsRestitution(player.id,0.8)
    SetSpritePhysicsDamping( player.id, player.damping)
    SetSpritePhysicsAngularDamping(player.id,player.angledamping)
    SetSpritePhysicsIsBullet(player.id,1)
    SetSpriteDepth(player.id,12)
    SetSpriteDepth(player.id3,12)
    SetSpriteDepth(player.id4,12)
    
    
    pauseButton=MakeButton(sbR-10-3,sbT+3,10,10,img.bPause1,img.bPause2)
	MakeTendrils(sbR-10-3+5,sbT+3+5,11,6, pauseButton,2) //max possible is about 18
    
    
    blur=CreateSprite(img.blur)
    SetSpriteSize(blur,10,10)
    SetSpriteVisible(blur,0)
    
    //TEMP
    /*
    cursor=CreateSprite(img.aim)
	SetSpriteSize(cursor,8,8)
	SetSpriteColor(cursor,0,255,0,240)
	SetSpriteDepth(cursor,1)
	*/
    
    
    whiteout = CreateParticles(0,0)
    SetParticlesDirection(whiteout,150,0)
    SetParticlesAngle(whiteout,0)
    SetParticlesFrequency(whiteout,35)
    SetParticlesImage(whiteout,img.circleFull)
    SetParticlesLife(whiteout,3)
    SetParticlesStartZone(whiteout,sbL-1,sbT,sbL,sbB)
    SetParticlesDepth(whiteout,1)
    SetParticlesSize(whiteout,0.8)
    SetParticlesVelocityRange(whiteout,1.1,2.3)
    FixParticlesToScreen(whiteout,1)
    AddParticlesColorKeyFrame(whiteout,0,255,255,255,0)
    AddParticlesColorKeyFrame(whiteout,0.1,255,255,255,255)
    AddParticlesColorKeyFrame(whiteout,3,255,255,255,0)
    AddParticlesForce(whiteout,1,3,10,-50)
    
    SetParticlesActive(whiteout,0)
    
    
    global trail
    rtrailfreq as integer
    ttrailfreq as integer
    rtrailfreq=5
    ttrailfreq=5
    trail = CreateParticles(0,0)
    SetParticlesDirection(trail,1,0)
    SetParticlesAngle(trail,360)
    SetParticlesFrequency(trail,rtrailfreq)
    SetParticlesImage(trail,img.circleFull)
    SetParticlesLife(trail,1)
    SetParticlesStartZone(trail,-2.5,-2.5,2.5,2.5)
    SetParticlesDepth(trail,13)
    SetParticlesSize(trail,0.5)
    SetParticlesMax(trail,-1)
    SetParticlesVelocityRange(trail,0.8,1.1)
    FixParticlesToScreen(trail,0)
    
    
    if lightColours=0
		AddParticlesColorKeyFrame(trail,0,255,255,255,0)
		AddParticlesColorKeyFrame(trail,0.2,255,255,255,255)
		AddParticlesColorKeyFrame(trail,1,255,255,255,0)
	else
		AddParticlesColorKeyFrame(trail,0,0,0,0,0)
		AddParticlesColorKeyFrame(trail,0.2,0,0,0,255)
		AddParticlesColorKeyFrame(trail,1,0,0,0,0)
	endif
    
    AddParticlesScaleKeyFrame(trail,0.0,0)
    AddParticlesScaleKeyFrame(trail,0.2,1)
    AddParticlesScaleKeyFrame(trail,0.5,1)
    AddParticlesScaleKeyFrame(trail,1.0,0.2)
    
    
    
    
    SetParticlesActive(trail,1)
    
    
    portal.id=CreateSprite(img.circle)
    SetSpriteSize(portal.id,14,14)
    SetSpritePositionByCenter(portal.id,12,12)
    SetSpriteShape(portal.id,1)
    SetSpriteColor(portal.id,234,234,225,0)
    portal.id2=CreateSprite(img.portal)
    SetSpriteSize(portal.id2,14-1.4,14-1.4)
    SetSpritePositionByCenter(portal.id2,12,12)
    SetSpriteShape(portal.id2,1)
    SetSpriteColor(portal.id2,234,234,225,0)
    portal.state=STARCOUNT //current count of stars
    SetSpriteDepth(portal.id,9) //in front of player, behind grass etc
    SetSpriteDepth(portal.id2,9) //in front of player, behind grass etc
    
    if lightColours
		SetSpriteColor(portal.id,0,0,0,0)
		SetSpriteColor(portal.id2,0,0,0,0)
	endif
    
    
    
    portalSize#=0
    global starPart as integer[3]
    global portalPart as integer
    
    for k=1 to STARCOUNT
		stars[k].id=CreateSprite(img.pu[k])
		SetSpriteSize(stars[k].id,6,6)
		SetSpriteColor(stars[k].id,255,255,255,255)
		if lightColours then SetSpriteColor(stars[k].id,0,0,0,255)
		SetSpritePosition(stars[k].id,random(0,145),random(0,95))
		SetSpriteShape(stars[k].id,1)
		SetSpriteDepth(stars[k].id,9)
		stars[k].state=0
	next
	
	if GetFileExists("lvl/l"+str(currentLevel)+".fld")=0 then currentLevel=1
	LoadLevel("lvl/l"+str(currentLevel)+".fld")
	//LoadLevel("lvl//video/v"+str(currentLevel)+".fld")
	player.state=levelPar
	
	if lightColours
		for k=1 to 3
			starPart[k]=CreateParticles(GetSpriteX(stars[k].id),GetSpriteY(stars[k].id))
			SetParticlesDirection(starPart[k],0,-3)
			SetParticlesAngle(starPart[k],10)
			SetParticlesFrequency(starPart[k],6)
			SetParticlesImage(starPart[k],img.circleFull)
			SetParticlesLife(starPart[k],3)
			SetParticlesStartZone(starPart[k],1,1,5,5)
			SetParticlesDepth(starPart[k],13)
			SetParticlesSize(starPart[k],0.5)
			SetParticlesMax(starPart[k],-1)
			SetParticlesVelocityRange(starPart[k],0.8,1.4)
			FixParticlesToScreen(starPart[k],0)
			
			
			AddParticlesColorKeyFrame(starPart[k],0,0,0,0,0)
			AddParticlesColorKeyFrame(starPart[k],0.5,0,0,0,255)
			AddParticlesColorKeyFrame(starPart[k],1,255,255,255,255)
			AddParticlesColorKeyFrame(starPart[k],2,255,255,255,255)
			AddParticlesColorKeyFrame(starPart[k],3,0,0,0,0)
			
			AddParticlesScaleKeyFrame(starPart[k],0.0,0)
			AddParticlesScaleKeyFrame(starPart[k],0.5,1)
			AddParticlesScaleKeyFrame(starPart[k],2,1)
			AddParticlesScaleKeyFrame(starPart[k],3.0,0.2)
		next
		portalPart=CreateParticles(GetSpriteX(portal.id),GetSpriteY(portal.id))
		SetParticlesDirection(portalPart,0,-3)
		SetParticlesAngle(portalPart,10)
		SetParticlesFrequency(portalPart,0)
		SetParticlesImage(portalPart,img.circleFull)
		SetParticlesLife(portalPart,3)
		SetParticlesStartZone(portalPart,1,1,13,13)
		SetParticlesDepth(portalPart,13)
		SetParticlesSize(portalPart,0.5)
		SetParticlesMax(portalPart,-1)
		SetParticlesVelocityRange(portalPart,0.8,1.4)
		FixParticlesToScreen(portalPart,0)
		
		
		AddParticlesColorKeyFrame(portalPart,0,0,0,0,0)
		AddParticlesColorKeyFrame(portalPart,0.5,0,0,0,255)
		AddParticlesColorKeyFrame(portalPart,1,255,255,255,255)
		AddParticlesColorKeyFrame(portalPart,2,255,255,255,255)
		AddParticlesColorKeyFrame(portalPart,3,0,0,0,0)
		
		AddParticlesScaleKeyFrame(portalPart,0.0,0)
		AddParticlesScaleKeyFrame(portalPart,0.5,1)
		AddParticlesScaleKeyFrame(portalPart,2,1)
		AddParticlesScaleKeyFrame(portalPart,3.0,0.2)
	endif
    
    //these functions must be called before starBar is figured out
    InitTut() //will create tutorial on correct levels
	//InitTrials()
	
	
    starBarC=player.state
    if player.state=21 then starBarC=0
	for k=1 to starBarC
		starBar[k].id=CreateSprite(img.bar)
		SetSpriteSize(starBar[k].id,8,1.5)
		FixSpriteToScreen(starBar[k].id,1)
		SetSpritePosition(starBar[k].id,2+((k-1)*10),2)
		SetSpriteDepth(starBar[k].id,1) //HUD
		SetSpriteColor(starBar[k].id,255,255,255,0)
		if lightColours then SetSpriteColor(starBar[k].id,0,0,0,0)
	next
	
	//calculate zoom
	SetViewZoom(0.85)
	
    
    
    restartT as integer
    restartable as integer
    restartable=0
    restartT=CreateText("Tap Here to Restart")
    SetTextAlignment(restartT,1)
    SetTextSize(restartT,8)
    SetTextPosition(restartT,75,0)
    FixTextToScreen(restartT,1)
    SetTextColor(restartT,170,205,15,0)
    SetTextSpacing(restartT,-0.1)
    SetTextFont(restartT,gravityFONT)
    
    cancelS as integer
    global cancelable as integer
    cancelable=0
    cancelS=CreateSprite(img.cross)
    SetSpriteSize(cancelS,10,10)
    SetSpritePosition(cancelS,sbR-10-3-10-3,sbT+3)
    
    //SetSpritePosition(cancelS,75-16,1)
    FixSpriteToScreen(cancelS,1)
    SetSpriteDepth(cancelS,1)
    SetSpriteColor(cancelS,255,255,255,0)
    
    
    
	global game as tGame
	outofbounds as integer //if the player has gone off the screen
	player.aiming=0
	game.state=1
	game.portalState=0
	
	//global Godmode=1
	frameon=1
    
	global ox as float
	global oy as float
	global nx as float[10]
	global ny as float[10]
	global prevx as float
	global prevy as float
	global fineness as float
	fineness=1
	global lastplayerfinalposx as float
	global lastplayerfinalposy as float
	lastplayerfinalposx=GetSpriteX(player.id)
	lastplayerfinalposy=GetSpriteY(player.id)
	zoom as float
	zoomc as float
	
	gametimetotalstart as float
	global gametimetotal as float
	gametimetotalstart=timer()
	
    do
		//print("FPS: " + str(ScreenFPS()))
		//print("Godmode: " + str(Godmode))
		//if GetRawKeyReleased(36) then Godmode=1-Godmode
		//print(timer()-gametimetotalstart)
		//gametimetotal=timer()-gametimetotalstart
		
		SetSpritePhysicsDamping( player.id, player.damping)
		SetSpritePhysicsAngularDamping( player.id, player.angledamping)
		SetSpritePhysicsRestitution( player.id, player.restitution)
		
		//SetViewOffset(0-((75-GetSpriteX(player.id))/5),0-((50-GetSpriteY(player.id))/5))
		
		if player.restitution>0.7 then player.restitution=player.restitution-0.001
		if player.restitution<0.7 then player.restitution=player.restitution+0.01
		if player.damping<0.3 then player.damping=player.damping+0.0025
		if player.angledamping<0.5 then player.angledamping=player.angledamping+0.005
		if player.sticking>0
			player.restitution=0.05
			player.damping=15
			player.angledamping=1
		elseif player.sticking<0
			player.restitution=0.7
			player.damping=0.3
			player.angledamping=0.5
		endif
		
		if GetPointerPressed()
			for k=1 to 10
				nx[k]=ScreenToWorldX(GetPointerX())
				ny[k]=ScreenToWorldY(GetPointerY())
			next
			lastplayerfinalposx=GetSpriteX(player.id)
			lastplayerfinalposy=GetSpriteY(player.id)
			fineness=1.0
		endif
		
		if fineness<1.0
			nx[10]=nx[10]+((ScreenToWorldX(GetPointerX())-prevx)*fineness)
			ny[10]=ny[10]+((ScreenToWorldY(GetPointerY())-prevy)*fineness)
		else
			nx[10]=ScreenToWorldX(GetPointerX())
			ny[10]=ScreenToWorldY(GetPointerY())
		endif
		
		//prevx=ScreenToWorldX(GetPointerX()) //these lines are done later before sync but after DoAim
		//prevy=ScreenToWorldY(GetPointerY())
		
		for k=1 to 9
			nx[k]=nx[k+1]
			ny[k]=ny[k+1]
		next
		
		
		
		//debug()
		if ScreenFPS()<45 and flagfordecrease=0 then flagfordecrease=100
		if flagfordecrease=100
			inc upframe,1
			if upframe>2
				upframe=2
			else
				SaveProgress()	
			endif
		endif
		if flagfordecrease>0 then dec flagfordecrease,1
		
		//TEMP
		/*
		if player.aiming=0
			SetSpriteVisible(cursor,1)
			if GetPointerState()
				SetSpriteSize(cursor,6,6)
			else
				SetSpriteSize(cursor,8,8)
			endif
			SetSpritePositionByCenter(cursor,p.wx,p.wy)
		else
			SetSpriteVisible(cursor,0)
		endif
		*/
		
		if starVol<100 then starVol=starVol+1
		
		
		for k=1 to starBarC
			if k<>1 or player.state<>1
				if k>player.state
					a=GetSpriteColorAlpha(starBar[k].id)
					a=a-15
					if a<0 then a=0
					SetSpriteColorAlpha(starBar[k].id,a)
				else
					a=GetSpriteColorAlpha(starBar[k].id)
					a=a+8
					if a>255 then a=255
					SetSpriteColorAlpha(starBar[k].id,a)
				endif
			endif
			if k=1 and player.state=1
				a=GetSpriteColorAlpha(starBar[k].id)
				if ((a/2)*2)=a //if even number
					a=a+6
					if a>255 then a=255
				else
					a=a-6
					if a<0 then a=0
				endif
				
				SetSpriteColorAlpha(starBar[k].id,a)
			endif
		next
		
		lp#=levelPar
		ps#=player.state
		amt#=((lp#-ps#)/lp#)
		
		SetSpriteColorAlpha(player.id,(1-(amt#*amt#))*255) //basic cubic interpolation
		SetSpriteColorAlpha(player.id4,(1-(amt#*amt#))*255) //basic cubic interpolation
		
		SetParticlesFrequency(trail,rtrailfreq)
		df#=abs(rtrailfreq-ttrailfreq)/4
		if player.state=0 then ttrailfreq=0
		if rtrailfreq<ttrailfreq-10-(df#) then rtrailfreq=rtrailfreq+10+(df#)
		if rtrailfreq>ttrailfreq+10+(df#) then rtrailfreq=rtrailfreq-10-(df#)
		if rtrailfreq>ttrailfreq-10-(df#) and rtrailfreq<ttrailfreq+10+(df#) then rtrailfreq=ttrailfreq
		
		for k=1 to STARCOUNT
			SetSpriteAngle(stars[k].id,GetSpriteAngle(stars[k].id)+0.1)
		next
		
		//player.state=1
		SetParticlesPosition(trail,GetSpriteX(player.id)+2.5,GetSpriteY(player.id)+2.5)
		
		if portal.state=0 //portal animation must be independent of game.state, hence this code is above main clause
			
			if lightColours then SetParticlesFrequency(portalPart,6)
			if game.state=1
				if GetSpriteCollision(player.id,portal.id2)
					game.state=2
					PlaySound(sfx.boom)
				endif
			endif
			//portalSize#=GetSpriteWidth(portal.id)
			SetSpriteAngle(portal.id2,GetSpriteAngle(portal.id2)+0.05)
			
			if portalSize#<7
				portalSize#=portalSize#+0.25
				SetSpriteSize(portal.id,14-portalSize#,14-portalSize#)
				SetSpriteSize(portal.id2,14-1.4+((portalSize#/10)*2),14-1.4+((portalSize#/10)*2))
				SetSpritePositionByCenter(portal.id,portal.pos.x,portal.pos.y)
				SetSpritePositionByCenter(portal.id2,portal.pos.x,portal.pos.y)
				SetSpriteColorAlpha(portal.id,portalSize#*36)
				SetSpriteColorAlpha(portal.id2,portalSize#*36)
				SetSpriteAngle(portal.id,(portalSize#*2)-28)
			endif
		endif
		for k=1 to STARCOUNT
			if stars[k].state=0
				if game.state=1
					//if abs(GetSpriteXByCenter(player.id)-GetSpriteXByCenter(stars[k].id))<8 and abs(GetSpriteYByCenter(player.id)-GetSpriteYByCenter(stars[k].id))<8
						//SetSpritePosition(stars[k].id,GetSpriteX(stars[k].id)+((GetSpriteXByCenter(player.id)-GetSpriteXByCenter(stars[k].id))*0.15),GetSpriteY(stars[k].id)+((GetSpriteYByCenter(player.id)-GetSpriteYByCenter(stars[k].id))*0.15))
					//endif
						
					//if GetSpriteCollision(player.id,stars[k].id)
					if abs(GetSpriteXByCenter(player.id)-GetSpriteXByCenter(stars[k].id))<7 and abs(GetSpriteYByCenter(player.id)-GetSpriteYByCenter(stars[k].id))<7
						stars[k].state=1
						
						tmp=TrySound(sfx.sparkly)
						SetSoundInstanceVolume(tmp, starVol) //set volume based on power
						
						//SetParticlesFrequency(trail,20)
						//for i=1 to 10
							//UpdateParticles(trail,0.1)
							//UpdateParticles(trail,0.1)
						//next
						//SetParticlesFrequency(trail,5+(player.state*2))
						rtrailfreq=starVol*2 //ranges from 20-100
						ttrailfreq=5+(player.state*2)
						dec portal.state,1
						
						starVol=20 //rapidly increase back to 100 in main loop
					endif
				endif
			elseif stars[k].state=1
				SetSpritePosition(stars[k].id,GetSpriteX(stars[k].id)+((GetSpriteXByCenter(player.id)-GetSpriteXByCenter(stars[k].id))*0.1),GetSpriteY(stars[k].id)+((GetSpriteYByCenter(player.id)-GetSpriteYByCenter(stars[k].id))*0.1))
				t=GetSpriteColorAlpha(stars[k].id)
				t=t-5
				if t<0 then t=0
				s#=GetSpriteWidth(stars[k].id)-0.2
				if s#<0 then s#=0
				SetSpriteColorAlpha(stars[k].id,t)
				SetSpriteAngle(stars[k].id,GetSpriteAngle(stars[k].id)-2)
				SetSpritePosition(stars[k].id,GetSpriteX(stars[k].id)+0.1,GetSpriteY(stars[k].id)+0.1)
				SetSpriteSize(stars[k].id,s#,s#)
				if lightColours
					SetParticlesFrequency(starPart[k],0)
				endif
				if t=0 then stars[k].state=2
			endif
		next
		
		if restartable=1
			cancelable=0 //can never cancel when able to restart mate
			if game.state=1
				for k=0 to len(GetTextString(restartT))
					if k<>0
						f=GetTextCharColorAlpha(restartT,k-1)
						if f>10
							a=GetTextCharColorAlpha(restartT,k)
							if a<255
								a=a+10
								y#=GetTextCharY(restartT,k)
								y#=y#+0.01
								SetTextCharY(restartT,k,y#)
							endif
							SetTextCharColorAlpha(restartT,k,a)
							if k=len(GetTextString(restartT))-1
								alph=alph+5
								if alph>255 then alph=255
							endif
						endif
					else
						a=GetTextCharColorAlpha(restartT,k)
						if a<250
							a=a+10
							y#=GetTextCharY(restartT,k)
							y#=y#+0.01
							SetTextCharY(restartT,k,y#)
						endif
						SetTextCharColorAlpha(restartT,k,a)
					endif
				next
				
				if GetPointerState()
					if GetTextHitTest(restartT,ScreenToWorldX(GetPointerX()),ScreenToWorldY(GetPointerY()))
						//SetTextColor(restartT,185*0.5,220*0.5,20*0.5,GetTextColorAlpha(restartT))
						SetTextColorRed(restartT,245)
						SetTextColorGreen(restartT,245)
						SetTextColorBlue(restartT,255)
					else
						SetTextColorRed(restartT,185)
						SetTextColorGreen(restartT,220)
						SetTextColorBlue(restartT,20)
					endif
				else
					
				endif
				if GetPointerReleased()
					if GetTextHitTest(restartT,ScreenToWorldX(GetPointerX()),ScreenToWorldY(GetPointerY()))
						TrySound(sfx.bop)
						playmode=_game
						dontshowloading=1
					endif
				endif
			else
				SetTextColorAlpha(restartT,0)
			endif
		else
			SetTextColorAlpha(restartT,0)
		endif
		
		if cancelable
			a=GetSpriteColorAlpha(cancelS)
			a=a+15 : if a>255 then a=255
    
    
			if p.x>sbR-26+5-8 and p.x<sbR-26+5+8 and p.y<sbT+3+10+3 and p.y>sbT
				SetSpriteColor(cancelS,205,20,5,a)
				cancelable=2
			else
				SetSpriteColor(cancelS,255,255,255,a)
				cancelable=1
			endif
			if player.aiming=0 then cancelable=0
		else
			SetSpriteColorAlpha(cancelS,0)
			if player.aiming=1 then cancelable=1
		endif
		
		
		if game.state=1
			if(GetRawKeyState(13)) then portal.state=0 //skip level
			
			if GetSpriteX(player.id)<-7 or GetSpriteX(player.id)>152 or GetSpriteY(player.id)>102
				restartable=1
				outofbounds=1
			endif
			if outofbounds=1
				if GetSpriteX(player.id)>-7 and GetSpriteX(player.id)<152 and GetSpriteY(player.id)<102
					restartable=0
				endif
			endif
			
			if state(pauseButton)=2
				buts[pauseButton].a=0
				pause()
				buts[pauseButton].a=1
			endif
			if GetRawKeyReleased(27)
				buts[pauseButton].a=0
				pause()
				buts[pauseButton].a=1
			endif
			
			if player.state
				if abs(GetSpritePhysicsVelocityX(player.id))<1 and abs(GetSpritePhysicsVelocityY(player.id))<1 //update freq if not moving
					ttrailfreq=0
				else
					ttrailfreq=5+(player.state*2)
				endif
				
				if GetPointerPressed()
					ox=ScreenToWorldX(GetPointerX())
					oy=ScreenToWorldY(GetPointerY())
					if ox>GetScreenBoundsLeft()+5 and ox<GetScreenBoundsRight()-5 and oy>GetScreenBoundsTop()+5 and oy<GetScreenBoundsBottom()-5 //only if in bounds
						aim=CreateAim(50)
						aimLine=CreateLineAim(10)
						player.aiming=1
						TrySound(sfx.click2)
						crosshair=CreateSprite(img.aim)
						SetSpriteSize(crosshair,8,8)
						SetSpriteDepth(crosshair,3)
						SetSpritePositionByCenter(crosshair,p.x,p.y)
						SetSpriteColor(crosshair,0,255,0,0)
						//FixSpriteToScreen(crosshair,1)
					endif
				endif
				if GetPointerState()
					if player.aiming
						inc frameon,1
						if frameon>=upframe then frameon=0
						if frameon=0 then DrawAim(aim,nx[6],ny[6],ox,oy)
							
						
						DrawAimLine(aimLine,pwCoor, ox,oy,10)
						a=GetSpriteColorAlpha(crosshair)
						if a<255 then a=a+15
						if cancelable=2
							SetSpriteColor(crosshair,50,50,50,a)
						else
							SetSpriteColor(crosshair,0,255,0,a)
						endif
						
						w#=(abs(ox-nx[6])+abs(oy-ny[6]))/5
						if w#>12 then w#=12
						if w#<4 then w#=4
						SetSpriteSize(crosshair,w#,w#)
						SetSpritePositionByCenter(crosshair,ox,oy)
						player.damping=0.8
						player.angledamping=1.2
						player.restitution=0.2
					endif
				endif
				if GetPointerReleased()
					if player.aiming
						if cancelable<>2 and (abs(ox-nx[7])>2 or abs(oy-ny[7])>2)
							player.damping=0
							player.angledamping=0
							player.restitution=0.8
							SetSpritePhysicsDamping( player.id, player.damping)
							SetSpritePhysicsAngularDamping( player.id, player.angledamping)
							SetSpritePhysicsRestitution( player.id, player.restitution)
							
							if (abs(ox-nx[1])<1 or abs(oy-ny[1])<1) //if they shot really quick, use a more recent frame
								ShootSprite(player.id,nx[8],ny[8],ox,oy,shootSpritePower)
							else
								ShootSprite(player.id,nx[1],ny[1],ox,oy,shootSpritePower)
							endif
							
							v#=(abs(ox-nx[6])+abs(oy-ny[6]))*2
							if v#>100 then v#=100
							if v#<25 then v#=25
							
							tmp=PlaySound(sfx.whoosh)
							SetSoundInstanceVolume(tmp, v#) //set volume based on power
							
							//if Godmode=0 
								dec player.state,1
								//SetParticlesFrequency(trail,20)
								//for i=1 to 10
									//UpdateParticles(trail,0.1)
								//next
								//SetParticlesFrequency(trail,5+(player.state*2))
								rtrailfreq=v#*1.5
								ttrailfreq=5+(player.state*2)
								if player.state=0
									rtrailfreq=0
									ttrailfreq=0
								endif
							//endif
						endif
						
						
						DeleteAim(aim)
						DeleteAim(aimLine)
						if GetSpriteExists(crosshair) then DeleteSprite(crosshair)
						crosshair=0
						player.aiming=0
						player.damping=0
						player.angledamping=0
						player.restitution=0.8
					endif
				endif
			endif
			
			if player.state=0 and player.kill=0
				restartable=1
				if abs(GetSpritePhysicsVelocityX(player.id))<1 and abs(GetSpritePhysicsVelocityY(player.id))<1
					player.kill=timer()
					player.i4=PlaySound(sfx.beeping)
					
					player.id2=CreateSprite(0)
					SetSpriteSize(player.id2,0,0.75)
					SetSpriteDepth(player.id2,1)
					FixSpriteToScreen(player.id2,1)
					SetSpritePosition(player.id2,sbL,sbT)
				endif
			endif
			
			
			
			if player.dead=0
				if player.kill<>0
					if timer()-player.kill>2
						DeleteSprite(player.id2)
						player.dead=1
					else
						SetSpriteSize(player.id2,sbW*((timer()-player.kill)/2),0.75)
						
						if abs(GetSpritePhysicsVelocityX(player.id))>1.5 and abs(GetSpritePhysicsVelocityY(player.id))>1.5 //stop killing
							StopSound(player.i4)
							DeleteSprite(player.id2)
							player.kill=0
						endif
						//Insert flashing animation here
					endif
				endif
			elseif player.dead=1
				DeleteAim(aim)
				if GetSpriteExists(crosshair) then DeleteSprite(crosshair)
				crosshair=0
				DeleteAim(aimLine)
				
				restartable=1
				PlaySound(sfx.explode)
				
				for k=1 to 50
					confetti[k]=CreateSprite(0)
					siz#=random(20,100)
					siz#=siz#/100
					SetSpriteSize(confetti[k],siz#,siz#)
					SetSpriteShape(confetti[k],2)
					if lightcolours then SetSpriteColor(confetti[k],0,0,0,255)
					px#=random(0,500)-250
					py#=random(0,500)-250
					SetSpritePosition(confetti[k],GetSpriteX(Player.id)+(px#/50),GetSpriteY(Player.id)+(py#/50))
					SetSpritePhysicsOn(confetti[k],2)
					SetSpritePhysicsMass(confetti[k],5)
					pvx#=GetSpritePhysicsVelocityX(player.id)
					pvy#=GetSpritePhysicsVelocityY(player.id)
					for i=1 to 20
						pvx#=pvx#*0.95
						pvy#=pvy#*0.95
					next
					SetSpritePhysicsVelocity(confetti[k],pvx#+random(0,200)-100,pvy#+random(0,200)-120)
					SetSpritePhysicsRestitution(confetti[k],0.5)
				next
				
				rtrailfreq=0
				ttrailfreq=0
				SetSpriteVisible(player.id,0)
				SetSpriteVisible(player.id3,0)
				SetSpriteVisible(player.id4,0)
				SetSpritePhysicsOff(player.id)
				player.dead=2
			elseif player.dead=2
				
			endif
			
			if GetRawMouseRightPressed() then portal.state=0
		elseif game.state=2
			shaking=1
			game.state=3
			
			
			
			if player.aiming
				DeleteAim(aim)
				DeleteAim(aimLine)
				if GetSpriteExists(crosshair) then DeleteSprite(crosshair)
				crosshair=0
				player.aiming=0
				player.damping=0
				player.angledamping=0
				player.restitution=0.8
			endif
			lastLevel=currentLevel
			/*if timeTrialOn
				trialUnlocked[currentLevel]=1
				SaveProgress()
			endif*/
			if skippedLevels[currentLevel]=1
				skippedLevels[currentLevel]=0
				SaveProgress()
			endif
			if currentLevel+1>maxLevel
				maxLevel=currentLevel+1 //unlock next level if necessary
				
				if maxLevel=11
					`FirebaseLogEvent("completed_level_10")
				endif
				if maxLevel=21
					`FirebaseLogEvent("completed_level_20")
				endif
				if maxLevel=41
					`FirebaseLogEvent("completed_level_40")
				endif
				if maxLevel=51 and FullVersionUnlocked=0
					playStory=1
				endif
				if maxLevel=100
					`FirebaseLogEvent("completed_game")
					playStory=1
				endif
				SaveProgress()
			endif
			SetSpriteVisible(bo,1)
			SetParticlesActive(whiteout,1)
			rtrailfreq=0
			ttrailfreq=0
		elseif game.state=3
			a=GetSpriteColorAlpha(bo)
			a=a*10
			if a>255 then a=255
			SetSpriteColorAlpha(player.id,255-a)
			SetSpriteColorAlpha(player.id3,255-a)
			SetSpriteColorAlpha(player.id4,255-a)
			
			a=GetSpriteColorAlpha(bo)
			a=a+3
			if tut.v3=-32
				a#=a
				SetSoundInstanceVolume(tut.v2,100-(a#/2.55))
			endif
			if tut.v3=-53
				a#=a
				SetSoundInstanceVolume(tut.v2,100-(a#/2.55))
			endif
			if tut.v5=-60
				a#=a
				SetSoundInstanceVolume(tut.v2,100-(a#/2.55))
				if tut.f5<musicvol then tut.f5=tut.f5+1+(musicvol/10)
				SetMusicSystemVolumeOGG(tut.f5)
			endif
			if a>255 then a=255
			SetSpriteColorAlpha(bo,a)
			
			
			if a=255
				t#=timer()
				game.state=4
			endif
		elseif game.state=4
			if timer()-t#>0.15
				SetParticlesActive(whiteout,0)
				SetParticlesActive(trail,0)
				lastLevel=currentLevel
				playmode=_next
			endif
			
		elseif game.state=10 //died
			t#=timer()
			game.state=11
		elseif game.state=11
			if timer()-t#>1
				clr=0
				SetSpriteVisible(bo,1)
				game.state=12
				t#=timer()
			endif
		elseif game.state=12
			clr=clr+1
			if clr>255 then clr=255
			SetSpriteColor(bo,0,0,0,clr)
			
			if clr=255
				t#=timer()
				game.state=13
			endif
		elseif game.state=13
			playmode=_game
		endif
		
        `
        if playmode<>0 then exit
		prevx=ScreenToWorldX(GetPointerX())
		prevy=ScreenToWorldY(GetPointerY())
		
        DoTut() //will handle different tutorials for different levels
        //DoTrials()
        DoArti() //will handle artifacts
        DoSync()
        DoWalls()
    loop
    DeleteParticles(whiteout)
    DeleteParticles(trail)
    
    if tut.v3=-32
		DeleteParticles(tut.v1)
		StopSoundInstance(tut.v2)
	endif
    if tut.v3=-53
		DeleteParticles(tut.v1)
		StopSoundInstance(tut.v2)
	endif
	if tut.v5=-60
		StopSoundInstance(tut.v4)
		SetMusicSystemVolumeOGG(musicvol)
	endif
	
    if lightColours
		for k=1 to 3
			DeleteParticles(starPart[k])
		next
		DeleteParticles(portalPart)
	endif
    
	player.id3=0
	player.id4=0
	
	//SetRawMouseVisible(1) //TEMP
endfunction

function ShootSprite(id,x1#,y1#,x2#,y2#,power#)
	centerX#=GetSpriteX(id)+(GetSpriteWidth(id)/2.0)
	centerY#=GetSpriteY(id)+(GetSpriteHeight(id)/2.0)
	magX#=(x2#-x1#)*power#
	magY#=(y2#-y1#)*power#
	
	SetSpritePhysicsImpulse(id,centerX#,centerY#,magX#,magY#)
endfunction

function CreateAim(count as float)
	if count>99 then count=99
	asdf as tAim
	asdf.active=1
	ratio#=175.0/count
	icount as integer
	icount=count
	
	alpha=255
	
	for k=1 to icount
		if icount-k<25
			alpha=alpha-10
			if alpha<0 then alpha=0
		endif
		
		asdf.id[k]=CreateSprite(img.circlefull)
		SetSpriteSize(asdf.id[k],2,2)
		SetSpriteColor(asdf.id[k],25,0,0,alpha)
		SetSpriteDepth(asdf.id[k],13)
	next
endfunction asdf

function CreateLineAim(count as float)
	if count>99 then count=99
	asdf as tAim
	asdf.active=1
	ratio#=255.0/count
	icount as integer
	icount=count
	
	for k=0 to icount
		fk#=count-k
		asdf.id[k]=CreateSprite(img.circlefull)
		SetSpriteSize(asdf.id[k],1.5,1.5)
		SetSpriteColor(asdf.id[k],50,255,50,(fk#*ratio#))
		SetSpriteDepth(asdf.id[k],13)
	next
endfunction asdf

function DeleteAim(asdf ref as tAim)
	asdf.active=0
	
	for k=0 to 99
		if GetSpriteExists(asdf.id[k]) then DeleteSprite(asdf.id[k])
		asdf.id[k]=0
		asdf.pos[k].x=0
		asdf.pos[k].y=0
	next
endfunction

function HideAim(asdf ref as tAim)
	for k=0 to 99
		if GetSpriteExists(asdf.id[k]) then SetSpriteColorAlpha(asdf.id[k],0)
	next
endfunction

function DrawAimLine(asdf ref as tAim, startX as float, startY as float, endX as float, endY as float, count)
	if startX=-10 and startY=-10
		for k=0 to count
			SetSpritePosition(asdf.id[k],-20,-20)
		next
	else
		incX as float
		incY as float
		
		offset as float
		m as float //gradient
		offset=timer()
		
		while offset>1
			dec offset,1
		endwhile
		
		
		incX=(startX-endX)/10
		incY=(startY-endY)/10
		m=(endY-startY)/(endX-startX)

		ratio#=255.0/count
		if abs(ox-nx[1])>5 or abs(oy-ny[1])>5
			for k=0 to count-1
				amt#=(4.5-k-offset+0.5)
				if amt#*amt#>asdf# then asdf#=amt#*amt#
				amt#=(25-(amt#*amt#))/25 //((count*0.5)+0.5)*((count*0.5)+0.5)=25
				
				if cancelable=2
					SetSpriteColor(asdf.id[k],50,50,50,amt#*255)
				else
					SetSpriteColor(asdf.id[k],50,255,50,amt#*255)
				endif
			next
		else
			for k=0 to count
				fk#=count-k
				if cancelable=2
					SetSpriteColor(asdf.id[k],50,50,50,(fk#*ratio#))
				else
					SetSpriteColor(asdf.id[k],50,255,25,(fk#*ratio#))
				endif
				
			next
		endif
		
		
		for k=0 to count
			SetSpritePosition(asdf.id[k],endX+(incX*k)+(incX*offset)-0.75,endY+(incY*k)+(incY*offset)-0.75)
		next
	endif
endfunction
	
function DrawAim(asdf ref as tAim,x1#,y1#,x2#,y2#)
	player.pos.x=GetSpriteX(player.id)
	player.pos.y=GetSpriteY(player.id)
	player.pos.z=GetSpriteAngle(player.id)
	player.vel.x=GetSpritePhysicsVelocityX(player.id)
	player.vel.y=GetSpritePhysicsVelocityY(player.id)
	player.vel.z=GetSpritePhysicsAngularVelocity(player.id)


	for k=1 to 299
		if walls[k].active=1
			if walls[k].typ=w_dynamic
				walls[k].pos.x=GetSpriteX(walls[k].id)
				walls[k].pos.y=GetSpriteY(walls[k].id)
				walls[k].pos.z=GetSpriteAngle(walls[k].id)
			endif
			if walls[k].typ=w_spin
				walls[k].pos.x=GetSpriteX(walls[k].id)
				walls[k].pos.y=GetSpriteY(walls[k].id)
				walls[k].pos.z=GetSpriteAngle(walls[k].id)
			endif
			if walls[k].typ=w_door
				walls[k].pos.x=GetSpriteX(walls[k].id)
				walls[k].pos.y=GetSpriteY(walls[k].id)
				walls[k].pos.z=GetSpriteAngle(walls[k].id)
			endif
			if walls[k].typ=w_laser
				SetParticlesActive(walls[k].id4,0)
			endif
			if walls[k].typ=w_fan
				SetParticlesActive(walls[k].id4,0)
			endif
			if walls[k].typ=w_dynamic
				walls[k].vel.x=GetSpritePhysicsVelocityX(walls[k].id)
				walls[k].vel.y=GetSpritePhysicsVelocityY(walls[k].id)
				walls[k].vel.z=GetSpritePhysicsAngularVelocity(walls[k].id)
			endif
		else
			k=300
		endif
	next
	
	tDamp#=0
	taDamp#=0
	tRest#=0.8
	SetSpritePhysicsDamping( player.id, tDamp#)
	SetSpritePhysicsAngularDamping( player.id, taDamp#)
	SetSpritePhysicsRestitution( player.id, tRest#)
	
	ShootSprite(player.id,x1#,y1#,x2#,y2#,shootSpritePower)
	distance as float
	distance=dist(x1#,y1#,x2#,y2#)
	
	distance=distance/8
	if distance<1 then distance=1
	if distance>2 then distance=2
	
	
	SetParticlesActive(trail,0)
	if tut.v3=-32
		SetParticlesActive(tut.v1,0)	
	endif
	if tut.v3=-53
		SetParticlesActive(tut.v1,0)	
	endif
	if lightColours
		for k=1 to 3
			SetParticlesActive(starPart[k],0)
		next
		SetParticlesActive(portalPart,0)
	endif
	
	alpha=255
	for k=1 to 50
		if 50-k<25
			alpha=alpha-10
			if alpha<0 then alpha=0
		endif
		SetSpritePhysicsDamping( player.id, tDamp#)
		SetSpritePhysicsAngularDamping( player.id, taDamp#)
		SetSpritePhysicsRestitution( player.id, tRest#)
		
		if tRest#>0.7 then tRest#=tRest#-0.001
		if tRest#<0.7 then tRest#=tRest#+0.01
		if tDamp#<0.3 then tDamp#=tDamp#+0.0025
		if taDamp#<0.5 then taDamp#=taDamp#+0.005
		
		
		DoFansPreview()
		update(0.016) //60 FPS
		SetSpriteSize(asdf.id[k],distance,distance)
		asdf.pos[k].x=GetSpriteX(player.id)+2
		asdf.pos[k].y=GetSpriteY(player.id)+2
		SetSpritePositionByCenter(asdf.id[k],asdf.pos[k].x,asdf.pos[k].y)
		
		if k=50
			if abs(lastplayerfinalposx-GetSpriteX(player.id))>8 or abs(lastplayerfinalposy-GetSpriteY(player.id))>8
				if abs(ScreenToWorldX(GetPointerX())-prevx)<0.5 and abs(ScreenToWorldY(GetPointerY())-prevy)<0.5
					if abs(player.vel.x)<1.5 and abs(player.vel.y)<1.5
						fineness=0.2
					endif
				endif
			else
				if lastplayerfinalposx-GetSpriteX(player.id)<>0 and lastplayerfinalposy-GetSpriteY(player.id)<>0
					if fineness<1 then fineness=fineness+0.2
				endif
				if abs(ScreenToWorldX(GetPointerX())-prevx)>1.0 or abs(ScreenToWorldY(GetPointerY())-prevy)>1.0 
					fineness=1.0
				endif
			endif
			lastplayerfinalposx=GetSpriteX(player.id)
			lastplayerfinalposy=GetSpriteY(player.id)
		endif
		
		if cancelable=2
			SetSpriteColor(asdf.id[k],20,20,20,alpha/2)
		else
			SetSpriteColor(asdf.id[k],30,0,0,alpha)
		endif
	next
	SetParticlesActive(trail,1)
	if lightColours
		for k=1 to 3
			SetParticlesActive(starPart[k],1)
		next
		SetParticlesActive(portalPart,1)
	endif
	if tut.v3=-32
		SetParticlesActive(tut.v1,1)	
	endif
	if tut.v3=-53
		SetParticlesActive(tut.v1,1)	
	endif
	SetSpritePositionByVector(player.id,player.pos)
	SetSpritePhysicsByVector(player.id,player.vel)
	SetSpritePhysicsDamping( player.id, player.damping)
	SetSpritePhysicsRestitution( player.id, player.restitution)
	for k=1 to 299
		if walls[k].active=1
			if walls[k].typ=w_dynamic
				SetSpritePositionByVector(walls[k].id,walls[k].pos)
			endif
			if walls[k].typ=w_spin
				SetSpritePositionByVector(walls[k].id,walls[k].pos)
			endif
			if walls[k].typ=w_door
				SetSpritePositionByVector(walls[k].id,walls[k].pos)
			endif
			if walls[k].typ=w_laser
				SetParticlesActive(walls[k].id4,1)
			endif
			if walls[k].typ=w_fan
				SetParticlesActive(walls[k].id4,1)
			endif
			if walls[k].typ=w_dynamic
				SetSpritePhysicsByVector(walls[k].id,walls[k].vel)
			endif
		else
			k=300
		endif
	next
	
	SetSpritePhysicsDamping( player.id, player.damping)
	SetSpritePhysicsAngularDamping( player.id, player.angledamping)
	SetSpritePhysicsRestitution( player.id, player.restitution)
endfunction

function pause()
	overlay=CreateSprite(0)
    SetSpriteSize(overlay,sbW,sbH)
    SetSpritePosition(overlay,sbL,sbT)
    FixSpriteToScreen(overlay,1)
    SetSpriteColor(overlay,0,0,0,150)
    SetSpriteDepth(overlay,2)
    
	pT2=CreateText("Paused")
    SetTextAlignment(pT2,1)
    SetTextSize(pT2,16)
    SetTextPosition(pT2,75+0.5,5+0.5)
    FixTextToScreen(pT2,1)
    SetTextColor(pT2,10,10,10,100)
    SetTextSpacing(pT2,0.2)
    SetTextFont(pT2,gravityFONT)
    SetTextDepth(pT2,1)
	pT=CreateText("Paused")
    SetTextAlignment(pT,1)
    SetTextSize(pT,16)
    SetTextPosition(pT,75,5)
    FixTextToScreen(pT,1)
    SetTextColor(pT,185,225,20,255)
    SetTextSpacing(pT,0.2)
    SetTextFont(pT,gravityFONT)
    SetTextDepth(pT,1)
    
    textB2=CreateText("Current Level:  "+str(currentLevel))
    SetTextAlignment(textB2,1)
    SetTextPosition(textB2,75+0.25,100-10+0.25)
    SetTextSize(textB2,8)
    SetTextSpacing(textB2,-0.1)
    SetTextFont(textB2,gravityFONT)
    SetTextColor(textB2,0,0,0,100)
    SetTextDepth(textB2,1)
    FixTextToScreen(textB2,1)
    text2=CreateText("Current Level:  "+str(currentLevel))
    SetTextAlignment(text2,1)
    SetTextPosition(text2,75,100-10)
    SetTextSize(text2,8)
    SetTextSpacing(text2,-0.1)
    SetTextFont(text2,gravityFONT)
    SetTextColor(text2,150,150,150,255)
    SetTextDepth(text2,1)
    FixTextToScreen(text2,1)
    
    if currentLevel=0
		SetTextString(textB2,"Tutorial Level")
		SetTextString(text2,"Tutorial Level")
	endif
	
    
    
    
    startb=MakeButton(75-20,30,40,15,img.bNext1,img.bNext2)
    startbt=MakeTendrils(75,30+7.5,38,20,startb,1)
    skipb=MakeButton(75-20,66,40,15,img.bSkip1,img.bSkip2)
    skipbt=MakeTendrils(75,66+7.5,38,20,skipb,1)
    
    restartb=MakeButton(75+20-12,50,12,12,img.bRestart1,img.bRestart2)
    restartbt=MakeTendrils(75+20-12+6,50+6,14,8,restartb,2)
    menub=MakeButton(75-20,50,12,12,img.bMenu1,img.bMenu2)
    menubt=MakeTendrils(75-20+6,50+6,14,8,menub,2)
    selectb=MakeButton(75-6,50,12,12,img.bLevelS1,img.bLevelS2)
    selectbt=MakeTendrils(75-6+6,50+6,14,8,selectb,2)
    
    
    
    
    
    SetSpriteDepth(buts[startb].id,1)
    SetSpriteDepth(buts[skipb].id,1)
    SetSpriteDepth(buts[menub].id,1)
    SetSpriteDepth(buts[restartb].id,1)
    SetSpriteDepth(buts[selectb].id,1)
    SetSpriteDepth(tens[menubt].id,2)
    SetSpriteDepth(tens[startbt].id,2)
    SetSpriteDepth(tens[restartbt].id,2)
    SetSpriteDepth(tens[selectbt].id,2)
    SetSpriteDepth(tens[skipbt].id,2)
    
    SetSpriteColorAlpha(tens[menubt].id,0)
    SetSpriteColorAlpha(tens[startbt].id,0)
    SetSpriteColorAlpha(tens[skipbt].id,0)
    SetSpriteColorAlpha(tens[restartbt].id,0)
    SetSpriteColorAlpha(tens[selectbt].id,0)
    /*
    
    */
    alpha as float
    for k=1 to 10
		alpha=easeInOutQuad(k,0,1,10)
		
		
		SetTextColorAlpha(pT,255*alpha)
		SetTextColorAlpha(text2,255*alpha)
		SetTextColorAlpha(pT2,100*alpha)
		SetTextColorAlpha(textB2,100*alpha)
		SetSpriteColorAlpha(overlay,150*alpha)
		SetSpriteColorAlpha(buts[startb].id,255*alpha)
		SetSpriteColorAlpha(buts[skipb].id,255*alpha)
		SetSpriteColorAlpha(buts[menub].id,255*alpha)
		SetSpriteColorAlpha(buts[restartb].id,255*alpha)
		SetSpriteColorAlpha(buts[selectb].id,255*alpha)
		
		Render()
		Swap()
	next
	SetSpriteColorAlpha(tens[menubt].id,255)
    SetSpriteColorAlpha(tens[startbt].id,255)
    SetSpriteColorAlpha(tens[skipbt].id,255)
    SetSpriteColorAlpha(tens[restartbt].id,255)
    SetSpriteColorAlpha(tens[selectbt].id,255)
    
    tempf as float[299]
    for kk=1 to 299
		tempf[kk]=0
		if walls[kk].typ=w_timer
			tempf[kk]=timer()
			//walls[k].f1=timer() //will reset timer after pause
		endif
	next
    
    playmode=0
    l=0
    repeat
		if GetRawKeyReleased(27) then l=1
		
		if state(startb)=2 then l=1
		if state(menub)=2
			lastLevel=currentLevel
			playmode=_menu
			l=1
		endif
		if state(restartb)=2
			playmode=_game
			dontshowloading=1
			l=1
		endif
		if state(skipb)=2
			playmode=_game
			
			currentLevel=currentLevel+1
			
			if currentLevel>maxLevel
				skippedLevels[currentLevel-1]=1
				maxLevel=currentLevel //unlock next level if necessary
				SaveProgress()
			endif
			
			
			if currentLevel=101
				lastLevel=currentLevel
				playmode=_select
			endif
			
			dontshowloading=1
			l=1
		endif
		if state(selectb)=2
			lastLevel=currentLevel
			playmode=_select
			l=1
		endif
		
		DoButtons()
		DoTouch()
		DoTendrils()
		DoArti()
		render()
		swap() //dont do physics bruh
	until l
	
	
	if playmode=0
		SetSpriteColorAlpha(tens[menubt].id,0)
		SetSpriteColorAlpha(tens[startbt].id,0)
		SetSpriteColorAlpha(tens[restartbt].id,0)
		SetSpriteColorAlpha(tens[selectbt].id,0)
		SetSpriteColorAlpha(tens[skipbt].id,0)
		for k=1 to 10
			alpha=1.0-easeInOutQuad(k,0,1,10)
			
			SetTextColorAlpha(pT,255*alpha)
			SetTextColorAlpha(text2,255*alpha)
			SetTextColorAlpha(pT2,100*alpha)
			SetTextColorAlpha(textB2,100*alpha)
			SetSpriteColor(overlay,0,0,0,150*alpha)
			SetSpriteColorAlpha(buts[startb].id,255*alpha)
			SetSpriteColorAlpha(buts[skipb].id,255*alpha)
			SetSpriteColorAlpha(buts[menub].id,255*alpha)
			SetSpriteColorAlpha(buts[restartb].id,255*alpha)
			SetSpriteColorAlpha(buts[selectb].id,255*alpha)
			
			Render()
			Swap()
		next
	endif
	
    for k=1 to 299
		if walls[k].typ=w_timer
			walls[k].f1=walls[k].f1+(timer()-tempf[k])
		endif
	next
	
	DeleteText(pT)
	DeleteText(text2)
	DeleteText(pT2)
	DeleteText(textB2)
	DeleteButton(menub)
	DeleteButton(startb)
	DeleteButton(restartb)
	DeleteButton(selectb)
	DeleteButton(skipb)
	DeleteTendril(menubt)
	DeleteTendril(startbt)
	DeleteTendril(restartbt)
	DeleteTendril(selectbt)
	DeleteTendril(skipbt)
	DeleteSprite(overlay)
endfunction

