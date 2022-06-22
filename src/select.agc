function levelSelect()
    b=CreateBSprite(img.menu,255,255,255)
    if lightColours then SetSpriteImage(b,img.menul)
    bo=CreatebSprite(0,0,0,0)
    SetSpriteColor(bo,0,0,0,0)
    if lightColours then SetSpriteColor(bo,230,230,200,0)
    SetSpriteVisible(bo,0)
    SetSpriteDepth(bo,1)
    
    playmode=0
    playmode=0
    
    if lastlevel>99 then lastlevel=99
    
    //lastlevel=13
    
    
    
    backButton as integer
    text as integer
    textB as integer
    
    /*
    trialAvailable as integer
    trialSize as float
    trialAlpha as float
    trialSize=5
    trialAlpha=0
    trialAvailable=0
    trial=CreateSprite(img.timetrial)
    SetSpriteSize(trial,trialSize,trialSize)
    SetSpritePositionByCenter(trial,sbR-5,sbB-5)
    SetSpriteColorAlpha(trial,0)
    
    
    if notifyNewTimeTrials=0 and maxLevel>14 //never notified before
		lastlevel=1 //make sure they can see it all
		notifyNewTimeTrials=1
		
		SaveProgress()
		
		PopupBox()
	endif
	*/
	
	text=CreateText("Select LeveL")
    SetTextAlignment(text,1)
    SetTextPosition(text,75,2)
    SetTextSize(text,15)
    SetTextSpacing(text,-0.32)
    SetTextFont(text,gravityFONT)
    SetTextColor(text,185,225,20,255)
    
    /*
    trials=CreateText("Time Trial Mode: Off")
    SetTextAlignment(trials,1)
    SetTextPosition(trials,75,80)
    //SetTextSpacing(trials,-0.32)
    SetTextFont(trials,hackedFONT)
    SetTextSize(trials,trialSize)
    SetTextColor(trials,60,60,60,trialAlpha)
    for k=17 to 19
		SetTextCharColor(trials,k,120,120,120,trialAlpha)
	next
	*/
    
    
    
    backButton=MakeButton(sbL+2,sbT+2,10,10,img.bBack1,img.bBack2)
	MakeTendrils(sbL+2+5,sbT+2+5,12,7, backButton,2) //max possible is about 18
	
	previewSize as float
	previewActive as integer
	previewAnchor as vector
	previewImage=CreateSprite(img.previews[lastlevel])
	SetSpriteSize(previewImage,25,25/1.5)
	SetSpritePositionByCenter(previewImage,0,0)
	previewSize=0
	SetSpriteSize(previewImage,previewSize*1.5,previewSize)
	SetSpriteDepth(previewImage,1)
	//start=MakeButton(sbR-29,sbB-20,27,18,img.bBlank2,img.bBlank2)
	//MakeTendrils(sbR-29+13.5,sbB-20+9,24,18,start,3)
	
    
    
    selectedLevel=lastlevel
    YOFFSET as float
    YSPACING as float
    
    YOFFSET=20
    YSPACING=18.5
    blvl as integer[7,6,5] //page, row, column
    tlvl as integer[7,6,5]
    dlvl as integer[7]
    xof as float
    txof as float
    xspd as float
    pos as integer
    cantap as integer
    xc as float //xcurrent
    yzone as integer //xcurrent
    xl as float //xlast
    xs as float //xstart
    xof=-5
    xspd=2
    pos=0 //first block
    pos=ceil((lastLevel)/20)
    
    xof=-5-(pos*145)
    
    
    FullVersionUnlocked=0
    maxLevel=48
    
    if FullVersionUnlocked=0
		unlockButton=MakeButton(25+(1*20)+(3*150)+xof,YOFFSET+fo#+(4*YSPACING),95,15,img.bUnlock1,img.bUnlock2)
	endif
    
    c=-1
    for page=0 to 4
		for y=0 to 3
			for x=0 to 4
				inc c,1
				if c<51
					t$=str(c)
					fo#=0
					if c=0
						t$="TUT"
						fo#=1
					endif
					blvl[page,x,y]=MakeButton2(25+(x*20)+(page*150)+xof,YOFFSET+fo#+(y*YSPACING),15,15,t$)
					if c=0 then SetTextSize(buts[blvl[page,x,y]].tid,7)
					tlvl[page,x,y]=MakeTendrils(25+(x*20)+(page*150)+xof+7.5,YOFFSET+fo#+(y*YSPACING)+7.5,17,9,blvl[page,x,y],2)
					
					if c>maxLevel
						buts[blvl[page,x,y]].a=2
						SetSpriteColor(buts[blvl[page,x,y]].id,100,100,100,255)
						SetTextColor(buts[blvl[page,x,y]].tid,75,85,10,255)
					else
						if skippedLevels[c]=0
							SetTextColor(buts[blvl[page,x,y]].tid,185+(c/2),220,20,255)
						else
							SetTextColor(buts[blvl[page,x,y]].tid,225,90,20,255)
						endif
					endif
				else //expansion pack
					t$=str(c)
					fo#=0
					blvl[page,x,y]=MakeButton2(25+(x*20)+(page*150)+xof,YOFFSET+fo#+(y*YSPACING),15,15,t$)
					tlvl[page,x,y]=MakeTendrils(25+(x*20)+(page*150)+xof+7.5,YOFFSET+fo#+(y*YSPACING)+7.5,17,9,blvl[page,x,y],2)
					
					
					if FullVersionUnlocked=1
						if c>maxLevel
							buts[blvl[page,x,y]].a=2
							SetSpriteColor(buts[blvl[page,x,y]].id,100,100,100,255)
							SetTextColor(buts[blvl[page,x,y]].tid,75,85,10,255)
						else
							if skippedLevels[c]=0
								SetTextColor(buts[blvl[page,x,y]].tid,185+(c/2),220,20,255)
							else
								SetTextColor(buts[blvl[page,x,y]].tid,225,90,20,255)
							endif
						endif
					else
						buts[blvl[page,x,y]].a=2
						SetSpriteColor(buts[blvl[page,x,y]].id,0,0,0,0)
						SetSpriteColor(tens[tlvl[page,x,y]].id,0,0,0,0)
						SetTextColor(buts[blvl[page,x,y]].tid,0,0,0,0)
					endif
				endif
			next
		next
		
		dlvl[page]=CreateSprite(img.circlefull)
		SetSpriteSize(dlvl[page],2,2)
		SetSpritePosition(dlvl[page],25+(page*20)-1+7.5,sbB-4)
		SetSpriteColor(dlvl[page],150,150,150,150)
		if page=pos then SetSpriteColor(dlvl[page],255,255,255,255)
	next
	
    
    
    menuState=0
    tplaymode=0
    
    do
		if previewActive
			tempf#=previewSize-10 //More negative=faster early
			previewSize=previewSize+(tempf#*0.075)+0.85
		else
			previewSize=previewSize-(tempf#*0.075)-0.85
		endif
		
		if previewSize<10 then previewSize=10
		if previewSize>18 then previewSize=18
		SetSpriteSize(previewImage,previewSize*1.5,previewSize)
		SetSpriteColorAlpha(previewImage,(previewSize-10)*(255/8))
		txof=xof
		while(txof<-100)
			txof=txof+150
		endwhile
		
		SetSpritePositionByCenter(previewImage,25+(previewAnchor.x*20)+(0)+txof+7.5,YOFFSET+fo#+(previewAnchor.y*YSPACING)-9)
		
		/*
		if maxLevel>14+(pos*15)
			trialAvailable=1
		else
			trialAvailable=0
		endif
		
		if trialAvailable
			tempf#=trialSize-4 //More negative=faster early
			trialSize=trialSize+(tempf#*0.025)+0.5
			//sleep(100)
		else
			trialSize=trialSize-(tempf#*0.025)-0.5
			//sleep(100)
		endif
		if trialSize<5 then trialSize=5
		if trialSize>8 then trialSize=8
		trialAlpha=(trialSize-5)*(255/3)
		
		
		SetSpriteSize(trial,trialSize,trialSize)
		SetSpritePositionByCenter(trial,sbR-5,sbB-5)
		
		//SetSpriteColorAlpha(trial,trialAlpha)
		if timeTrialOn
			SetSpriteColor(trial,255,255,255,trialAlpha)
			//if notifyNewTimeTrials=1 then SetSpriteColor(showTrial,255,255,255,trialAlpha)
		else
			SetSpriteColor(trial,60,60,60,trialAlpha)
			//if notifyNewTimeTrials=1 then SetSpriteColor(showTrial,255,255,255,trialAlpha)
		endif
		*/
		
		/*
		if trialAvailable
			tempf#=trialSize-5 //More negative=faster early
			trialSize=trialSize+(tempf#*0.025)+0.5
			//sleep(100)
		else
			trialSize=trialSize-(tempf#*0.025)-0.5
			//sleep(100)
		endif
		if trialSize<7 then trialSize=7
		if trialSize>10 then trialSize=10
		trialAlpha=(trialSize-7)*(255/3)
		SetTextPosition(trials,75,80+((10-trialSize)*0.5))
		SetTextSize(trials,trialSize)
		SetTextColor(trials,60,60,60,trialAlpha)
		if timeTrialOn
			SetTextString(trials,"Time Trial Mode: On ")
			for k=17 to 19
				SetTextCharColor(trials,k,180,180,180,trialAlpha)
			next
		else
			SetTextString(trials,"Time Trial Mode: Off")
			for k=17 to 19
				SetTextCharColor(trials,k,40,40,40,trialAlpha)
			next
		endif
		*/
		
		if menuState=0
			if GetPointerPressed()
				xc=GetPointerX()
				xs=xc
				xl=xc
				cantap=1
				if GetPointerY()<YOFFSET+(0*YSPACING)
					cantap=0
				elseif GetPointerY()<YOFFSET+(1*YSPACING)
					yzone=0
				elseif GetPointerY()<YOFFSET+(2*YSPACING)
					yzone=1
				elseif GetPointerY()<YOFFSET+(3*YSPACING)
					yzone=2
				elseif GetPointerY()<YOFFSET+(4*YSPACING)
					yzone=3
				else
					cantap=0
				endif
				/*
				if trialAvailable
					if GetSpriteHitTest(trial,p.x,p.y)
						trialSize=6
						timeTrialOn=1-timeTrialOn
					endif
				endif*/
			endif
			if GetPointerState()
				xl=xc
				xc=GetPointerX()
				
				xof=xof+(xc-xl)
				
				if abs(xc-xs)>5 then cantap=0
				if GetPointerY()<YOFFSET+(yzone*YSPACING) or GetPointerY()>YOFFSET+((yzone+1)*YSPACING)
					cantap=0
				endif
			else
				xof=xof+xspd
				xspd=xspd*0.73
				for k=0 to 4
					if pos=k
						if xof<-(k*150)
							xspd=xspd+(1*(diff(-(k*150),xof))/25)
						elseif xof>-(k*150)
							xspd=xspd-(1*(diff(-(k*150),xof))/25)
						endif
					endif
				next
			endif
			if GetPointerReleased()
				xspd=(xc-xl)
				if xs-xc>25 then inc pos,1
				if xs-xc<-25 then dec pos,1
				if pos<0 then pos=0
				
				if FullVersionUnlocked=0
					
					if pos>2 then pos=2
				else
					if pos>4 then pos=4
				endif
			endif
			if GetRawMouseRightPressed() then pos=pos+1
			
			if FullVersionUnlocked=0
				SetSpritePosition(buts[unlockButton].id,25+(0*20)+(2*150)+xof,YOFFSET+fo#+(3*YSPACING))
			endif
			
			if cantap=1
				if buts[unlockButton].a=0 then buts[unlockButton].a=1
				
				if state(unlockButton)=2
					InAppPurchaseActivate(0)
					do
						if GetInAppPurchaseState()=1
							exit
						endif
						sync()
					loop
					if GetInAppPurchaseAvailable(0)
						FullVersionUnlocked=1
						SaveProgress()
						DeleteButton(unlockButton)
					endif
				endif
			else
				if buts[unlockButton].a=1 then buts[unlockButton].a=0
			endif
			
			c=(xof/(-(6*150)))*50
			if c<0 then c=0
			if c>51 then c=51
			if c>maxLevel then c=maxLevel
			SetTextColor(text,185+(c/2),220-(c/2),20,255)
			
			previewActive=0
			c=-1
			for page=0 to 4
				for y=0 to 3
					for x=0 to 4
						inc c,1
						//t$=str(c+1)
						//if c=0 then t$="Tut"
						if c<51
							fo#=0
							if c=0
								fo#=0.25
							endif
							SetSpritePosition(buts[blvl[page,x,y]].id,25+(x*20)+(page*150)+xof,YOFFSET+(y*YSPACING))
							SetTextPosition(buts[blvl[page,x,y]].tid,25+(x*20)+(page*150)+xof+7.5,YOFFSET+fo#+(y*YSPACING)+3)
							tens[tlvl[page,x,y]].x=25+(x*20)+(page*150)+xof+7.5
							tens[tlvl[page,x,y]].y=YOFFSET+(y*YSPACING)+7.5
							
							if c>maxLevel
								buts[blvl[page,x,y]].a=2
								SetSpriteColor(buts[blvl[page,x,y]].id,100,100,100,255)
								SetTextColor(buts[blvl[page,x,y]].tid,50,50,50,255)
							else
								if skippedLevels[c]=0
									buts[blvl[page,x,y]].a=3
									SetSpriteColor(buts[blvl[page,x,y]].id,255,255,255,255)
									SetSpriteColor(tens[tlvl[page,x,y]].id,255,255,255,255)
									SetTextColor(buts[blvl[page,x,y]].tid,185+(c/2),220-(c/2),20,255)
								else
									buts[blvl[page,x,y]].a=3
									SetSpriteColor(buts[blvl[page,x,y]].id,255,255,255,255)
									SetSpriteColor(tens[tlvl[page,x,y]].id,255,255,255,255)
									SetTextColor(buts[blvl[page,x,y]].tid,225,90,20,255)
								endif
							endif
							
							if cantap=1
								if buts[blvl[page,x,y]].a=0 then buts[blvl[page,x,y]].a=1
								
								
								if state(blvl[page,x,y])=1
									previewActive=1
									previewAnchor.x=x
									previewAnchor.y=y
									SetSpriteImage(previewImage,img.previews[c])
								endif
								
								if state(blvl[page,x,y])=2
									if c=0
										tplaymode=_tutorial
										`FirebaseLogEvent("reopened_tutorial")
										menuState=1
									else
										currentLevel=c
										tplaymode=_game
										menuState=1
									endif
								endif
							else
								if buts[blvl[page,x,y]].a=1 then buts[blvl[page,x,y]].a=0
								if buts[blvl[page,x,y]].a=3 then buts[blvl[page,x,y]].a=2
							endif
						else
							fo#=0
							if c=0
								fo#=0.25
							endif
							SetSpritePosition(buts[blvl[page,x,y]].id,25+(x*20)+(page*150)+xof,YOFFSET+(y*YSPACING))
							SetTextPosition(buts[blvl[page,x,y]].tid,25+(x*20)+(page*150)+xof+7.5,YOFFSET+fo#+(y*YSPACING)+3)
							tens[tlvl[page,x,y]].x=25+(x*20)+(page*150)+xof+7.5
							tens[tlvl[page,x,y]].y=YOFFSET+(y*YSPACING)+7.5
							
							
							if FullVersionUnlocked=1
								if c>maxLevel
									buts[blvl[page,x,y]].a=2
									SetSpriteColor(buts[blvl[page,x,y]].id,100,100,100,255)
									SetTextColor(buts[blvl[page,x,y]].tid,50,50,50,255)
								else
									if skippedLevels[c]=0
										buts[blvl[page,x,y]].a=3
										SetSpriteColor(buts[blvl[page,x,y]].id,255,255,255,255)
										SetSpriteColor(tens[tlvl[page,x,y]].id,255,255,255,255)
										SetTextColor(buts[blvl[page,x,y]].tid,20+(c/2),200-(c/2),225,255)
									else
										buts[blvl[page,x,y]].a=3
										SetSpriteColor(buts[blvl[page,x,y]].id,255,255,255,255)
										SetSpriteColor(tens[tlvl[page,x,y]].id,255,255,255,255)
										SetTextColor(buts[blvl[page,x,y]].tid,225,90,20,255)
									endif
								endif
								
								if cantap=1
									if buts[blvl[page,x,y]].a=0 then buts[blvl[page,x,y]].a=1
									
									
									if state(blvl[page,x,y])=1
										previewActive=1
										previewAnchor.x=x
										previewAnchor.y=y
										SetSpriteImage(previewImage,img.previews[c])
									endif
									
									if state(blvl[page,x,y])=2
										if c=0
											tplaymode=_tutorial
											`FirebaseLogEvent("reopened_tutorial")
											menuState=1
										else
											currentLevel=c
											tplaymode=_game
											menuState=1
										endif
									endif
								else
									if buts[blvl[page,x,y]].a=1 then buts[blvl[page,x,y]].a=0
									if buts[blvl[page,x,y]].a=3 then buts[blvl[page,x,y]].a=2
								endif
							else
								//if buts[blvl[page,x,y]].a=1 then buts[blvl[page,x,y]].a=0
								//if buts[blvl[page,x,y]].a=3 then buts[blvl[page,x,y]].a=2
							endif
						endif
					next
				next
				
				
				SetSpriteColor(dlvl[page],100,100,100,200)
				if page=pos then SetSpriteColor(dlvl[page],255,255,255,255)
			next
			
			if state(backButton)=2
				tplaymode=_menu
				menuState=1
			endif
		elseif menuState=1
			tens[1].tsize=25
			SetSpriteVisible(bo,1)
			menuState=2
		elseif menuState=2
			a=GetSpriteColorAlpha(bo)
			a=a+15
			if a>255 then a=255
			SetSpriteColorAlpha(bo,a)
			if a=255
				t#=timer()
				menuState=3
			endif
		elseif menuState=3
			if timer()-t#>0.15
				playmode=tplaymode
			endif
		endif
		
		if GetRawKeyReleased(27) then playmode=_menu
        if playmode<>0 then exit
       DoSync()
    loop
    /*
    if notifyNewTimeTrials=1
		notifyNewTimeTrials=2
		SaveProgress()
	endif*/
endfunction


function PopupBox()
	msgbD=CreateSprite(0)
	SetSpriteColor(msgbD,0,0,0,100)
	SetSpriteSize(msgbD,sbW,sbH)
	SetSpritePosition(msgbD,sbL,sbT)
	SetSpriteDepth(msgbD,1)
	
	msgsiz as float
	msgsiz=80
	msgAlpha as integer
	
	
	msgbS=CreateSprite(img.bBlank2)
	SetSpriteSize(msgbS,msgsiz,msgsiz*0.66)
	SetSpritePositionByCenter(msgbS,75,50)
	SetSpriteColorAlpha(msgbS,msgAlpha)
	SetSpriteDepth(msgbS,1)
	
	showTrial=CreateSprite(img.timetrial)
	SetSpriteSize(showTrial,10,10)
	SetSpritePositionByCenter(showTrial,75,60)
	SetSpriteColorAlpha(showTrial,msgAlpha)
	SetSpriteDepth(showTrial,1)
	
	msgbT1=CreateText("TIME TRIAL MODE UNLOCKED!")
	SetTextAlignment(msgbT1,1)
	SetTextSize(msgbT1,8.3)
	SetTextMaxWidth(msgbT1,87)
	SetTextPosition(msgbT1,75,24)
	SetTextFont(msgbT1,hackedFONT)
	SetTextColor(msgbT1,185,220,20,msgAlpha)
	SetTextDepth(msgbT1,1)
	msgbT2=CreateText("tap the icon in the bottom right to activate")
	SetTextAlignment(msgbT2,1)
	SetTextSize(msgbT2,5)
	SetTextMaxWidth(msgbT2,85)
	SetTextPosition(msgbT2,75,34)
	SetTextFont(msgbT2,hackedFONT)
	SetTextColor(msgbT2,255,255,255,msgAlpha)
	SetTextDepth(msgbT2,1)
	msgbT3=CreateText("You get unlimited shots!")
	SetTextAlignment(msgbT3,1)
	SetTextSize(msgbT3,4.5)
	SetTextMaxWidth(msgbT3,85)
	SetTextPosition(msgbT3,75,72)
	SetTextFont(msgbT3,hackedFONT)
	SetTextColor(msgbT3,150,150,150,msgAlpha)
	SetTextDepth(msgbT3,1)
	
	PlaySound(sfx.achieve)
	
	screenstate=0
	
	do
		if screenstate=0
			tempf#=msgsiz-85 //More negative=faster early
			msgsiz=msgsiz+(tempf#*0.05)+0.75
			if msgsiz>90 then msgsiz=90
			
			SetSpriteSize(msgbS,msgsiz,msgsiz*0.66)
			SetSpritePositionByCenter(msgbS,75,50)
			msgAlpha=(msgsiz-80)*25.5
			
			SetSpriteColorAlpha(msgbD,msgAlpha/2)
			SetSpriteColorAlpha(msgbS,msgAlpha)
			SetSpriteColorAlpha(showTrial,msgAlpha)
			SetTextPosition(msgbT1,75,24)
			SetTextPosition(msgbT2,75,34)
			SetTextPosition(msgbT3,75,72)
			SetTextColorAlpha(msgbT1,msgAlpha)
			SetTextColorAlpha(msgbT2,msgAlpha)
			SetTextColorAlpha(msgbT3,msgAlpha)
			SetTextSize(msgbT1,5.8+((msgsiz-85.0)*0.5))
			SetTextSize(msgbT2,2.5+((msgsiz-85.0)*0.5))
			SetTextSize(msgbT3,2.0+((msgsiz-85.0)*0.5))
			
			if GetPointerReleased() then screenstate=1
			if GetRawKeyReleased(27) then screenstate=1
		elseif screenstate=1
			tempf#=msgsiz-80 //More negative=faster early
			msgsiz=msgsiz-(tempf#*0.05)-0.75
			if msgsiz<80 then msgsiz=80
			
			SetSpriteSize(msgbS,msgsiz,msgsiz*0.66)
			SetSpritePositionByCenter(msgbS,75,50)
			msgAlpha=(msgsiz-80)*25.5
			
			SetSpriteColorAlpha(msgbD,msgAlpha/2)
			SetSpriteColorAlpha(msgbS,msgAlpha)
			SetSpriteColorAlpha(showTrial,msgAlpha)
			SetTextPosition(msgbT1,75,24)
			SetTextPosition(msgbT2,75,34)
			SetTextPosition(msgbT3,75,72)
			SetTextColorAlpha(msgbT1,msgAlpha)
			SetTextColorAlpha(msgbT2,msgAlpha)
			SetTextColorAlpha(msgbT3,msgAlpha)
			SetTextSize(msgbT1,5.8+((msgsiz-85.0)*0.5))
			SetTextSize(msgbT2,2.5+((msgsiz-85.0)*0.5))
			SetTextSize(msgbT3,2.0+((msgsiz-85.0)*0.5))
			if msgsiz=80 then screenstate=2
		elseif screenstate=2
			exit
		endif
		sync()
	loop
	
	
	for i=1 to 10
		k=11-i
		SetSpriteColor(msgbD,0,0,0,k*15)
		SetSpriteColorAlpha(msgbS,k*25.5)
		SetSpriteSize(msgbS,GetSpriteWidth(msgbS)+1,(GetSpriteWidth(msgbS)+1)*0.66)
		SetSpritePositionByCenter(msgbS,75,50)
		SetSpriteColorAlpha(showTrial,k*25.5)
		SetTextColor(msgbT1,150,150,150,k*25.5)
		SetTextColor(msgbT2,150,150,150,k*25.5)
		SetTextColor(msgbT3,150,150,150,k*25.5)
		//sync()
	next
	DeleteSprite(msgbD)
	DeleteSprite(msgbS)
	DeleteSprite(showtrial)
	DeleteText(msgbT1)
	DeleteText(msgbT2)
	DeleteText(msgbT3)
endfunction
