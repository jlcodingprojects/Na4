function settings()
	b=CreateBSprite(img.menu,180,180,180)
	if lightColours then SetSpriteImage(b,img.menul)
    bo=CreatebSprite(0,0,0,0)
    SetSpriteColor(bo,0,0,0,0)
    if lightColours then SetSpriteColor(bo,230,230,200,0)
    
    SetSpriteVisible(bo,0)
    SetSpriteDepth(bo,1)
    
    playmode=0
    tplaymode=0
    
    text as integer
    textB as integer
    
    SetPhysicsGravity(0,0)
    SetPhysicsWallBottom(1)
    SetPhysicsWallLeft(1)
    SetPhysicsWallRight(1)
    SetPhysicsWallTop(1)
    
    mj as integer
    
    textB=CreateText("SETTINGS")
    SetTextAlignment(textB,1)
    SetTextPosition(textB,75+0.75,1+0.75)
    SetTextSize(textB,12)
    SetTextSpacing(textB,0.2)
    SetTextFont(textB,gravityFONTb)
    SetTextColor(textB,0,0,0,100)
    text=CreateText("SETTINGS")
    SetTextAlignment(text,1)
    SetTextPosition(text,75,1)
    SetTextSize(text,12)
    SetTextSpacing(text,0.2)
    SetTextFont(text,gravityFONTb)
    SetTextColor(text,185,225,20,255)
    SetTextDepth(text,2)
    SetTextDepth(textB,2)
    
    
    pad=CreateSprite(0)
    SetSpriteSize(pad,sbW,50)
    SetSpriteColor(pad,0,0,0,50)
    SetSpritePosition(pad,sbL,20)
    
    sliderv1 as float
    sliderv1=musicvol/2
    slider1=CreateSprite(0)
    SetSpriteSize(slider1,50,1)
    SetSpritePosition(slider1,75+2,30)
    SetSpriteColor(slider1,100,100,100,200)
    sliderd1=CreateSprite(img.circlefull)
    SetSpriteSize(sliderd1,3,3)
    SetSpritePosition(sliderd1,75+2+sliderv1,30.5-1.5)
    SetSpriteColor(sliderd1,200,200,200,250)
    slidert1=CreateText("Music Volume: ")
    SetTextSize(slidert1,6)
    SetTextAlignment(slidert1,2)
    SetTextPosition(slidert1,75-2,30.5-4)
    SetTextFont(slidert1,gravityFONT)
    SetTextColor(slidert1,185,220,20,255)
    SetTextSpacing(slidert1,-0.2)
    hitsprite1=CreateSprite(0)
    SetSpriteVisible(hitsprite1,0)
    SetSpriteSize(hitsprite1,60,10)
    SetSpritePosition(hitsprite1,75+2-5,30.5-5)
    
    sliderv2 as float
    sliderv2=sfxvol/2
    slider2=CreateSprite(0)
    SetSpriteSize(slider2,50,1)
    SetSpritePosition(slider2,75+2,40)
    SetSpriteColor(slider2,100,100,100,200)
    sliderd2=CreateSprite(img.circlefull)
    SetSpriteSize(sliderd2,3,3)
    SetSpritePosition(sliderd2,75+2+sliderv2,40.5-1.5)
    SetSpriteColor(sliderd2,200,200,200,250)
    slidert2=CreateText("SFX Volume: ")
    SetTextSize(slidert2,6)
    SetTextAlignment(slidert2,2)
    SetTextPosition(slidert2,75-2,40.5-4)
    SetTextFont(slidert2,gravityFONT)
    SetTextColor(slidert2,185,220,20,255)
    SetTextSpacing(slidert2,-0.2)
    hitsprite2=CreateSprite(0)
    SetSpriteVisible(hitsprite2,0)
    SetSpriteSize(hitsprite2,60,10)
    SetSpritePosition(hitsprite2,75+2-5,40.5-5)
    
    sliderv3 as float
    sliderv3=upframe*25
    slider3=CreateSprite(0)
    SetSpriteSize(slider3,50,1)
    SetSpritePosition(slider3,75+3,50)
    SetSpriteColor(slider3,100,100,100,200)
    sliderd3=CreateSprite(img.circlefull)
    SetSpriteSize(sliderd3,3,3)
    SetSpritePosition(sliderd3,75+2+sliderv3,50.5-1.5)
    SetSpriteColor(sliderd3,200,200,200,250)
    slidert3=CreateText("Aim Skipping [may improve performance]: ")
    SetTextSize(slidert3,6)
    SetTextAlignment(slidert3,2)
    SetTextPosition(slidert3,75-3,50.5-4)
    SetTextFont(slidert3,gravityFONT)
    SetTextColor(slidert3,185,220,20,255)
    SetTextSpacing(slidert3,-0.2)
    hitsprite3=CreateSprite(0)
    SetSpriteVisible(hitsprite3,0)
    SetSpriteSize(hitsprite3,60,10)
    SetSpritePosition(hitsprite3,75+2-5,50.5-5)
    
    sliderv4 as float
    sliderv4=lightColours*50
    slider4=CreateSprite(0)
    SetSpriteSize(slider4,50,1)
    SetSpritePosition(slider4,75+4,60)
    SetSpriteColor(slider4,100,100,100,200)
    sliderd4=CreateSprite(img.circlefull)
    SetSpriteSize(sliderd4,3,3)
    SetSpritePosition(sliderd4,75+2+sliderv4,60.5-1.5)
    SetSpriteColor(sliderd4,200,200,200,250)
    slidert4=CreateText("Bright Mode: ")
    SetTextSize(slidert4,6)
    SetTextAlignment(slidert4,2)
    SetTextPosition(slidert4,75-4,60.5-4)
    SetTextFont(slidert4,gravityFONT)
    SetTextColor(slidert4,185,220,20,255)
    SetTextSpacing(slidert4,-0.2)
    hitsprite4=CreateSprite(0)
    SetSpriteVisible(hitsprite4,0)
    SetSpriteSize(hitsprite4,60,10)
    SetSpritePosition(hitsprite4,75+2-5,60.5-5)
    
    
    
    
    twit=MakeButton(sbcX-6-18,sbB-15-2,12,12,img.bTwitter1,img.bTwitter2)
    MakeTendrils(sbcX-6-18+6,sbB-15-2+6,14,8,twit,2)
    rate=MakeButton(sbcX-7.5,sbB-15-2-2,15,15,img.bRate1,img.bRate2)
    MakeTendrils(sbcX,sbB-15-2-2+7.5,17,9,rate,2)
    fb=MakeButton(sbcX-6+18,sbB-15-2,12,12,img.bFB1,img.bFB2)
    MakeTendrils(sbcX-6+18+6,sbB-15-2+6,14,8,fb,2)
    
    /*
	restore=MakeButton(sbL+2,sbB-2-15,40,15,img.bRestore1,img.bRestore2)
    MakeTendrils(sbL+2+20,sbB-2-7.5,38,28,restore,1)
    */
    
    
    if DisableSounds
		disableT=CreateText("We've detected your system occasioanlly has lag issues when playing sound effects. Some of them have been disabled to ensure an optimum gaming experience")
		SetTextSize(disableT,4.5)
		SetTextAlignment(disableT,1)
		SetTextPosition(disableT,75,65.5)
		SetTextMaxWidth(disableT,140)
		SetTextFont(disableT,gravityFONT)
		SetTextColor(disableT,185,220,20,255)
		SetTextSpacing(disableT,-0.2)
	endif
    
	
    
    backButton=MakeButton(sbL+2,sbT+2,10,10,img.bBack1,img.bBack2)
	MakeTendrils(sbL+2+5,sbT+2+5,12,7, backButton,2) //max possible is about 18
    
    
    
    menuState=0
    
    do
		SetSpritePosition(sliderd1,75+2+sliderv1,30.5-1.5)
		SetSpritePosition(sliderd2,75+2+sliderv2,40.5-1.5)
		SetSpritePosition(sliderd3,75+2+sliderv3,50.5-1.5)
		SetSpritePosition(sliderd4,75+2+sliderv4,60.5-1.5)
		
		if menuState=0
			if state(twit)=1
				SetTextString(text,"Follow on Twitter")
				SetTextString(textB,"Follow on Twitter")
			elseif state(fb)=1
				SetTextString(text,"Like on Facebook")
				SetTextString(textB,"Like on Facebook")
			elseif state(rate)=1
				SetTextString(text,"Rate on Google Play")
				SetTextString(textB,"Rate on Google Play")
			else
				SetTextString(text,"SETTINGS")
				SetTextString(textB,"SETTINGS")
			endif
			
			SetSpriteColor(slider1,100,100,100,200)
			SetSpriteColor(slider2,100,100,100,200)
			SetSpriteColor(slider3,100,100,100,200)
			SetSpriteColor(slider4,100,100,100,200)
			SetTextString(slidert1,"Music Volume: ")
			SetTextString(slidert2,"SFX Volume: ")
			SetTextString(slidert3,"Aim Skipping: ")
			SetTextString(slidert4,"Bright Mode: ")
			
			if GetPointerState()
				if GetSpriteHitTest(hitsprite1,pCoor)
					tx#=GetPointerX()-75-2
					if tx#<0 then tx#=0
					if tx#>50 then tx#=50
					SetSpriteColor(slider1,222,222,222,200)
					
					
					SetTextString(slidert1,str(round(sliderv1*2))+"%")
					musicvol=round(sliderv1*2)
					SetMusicSystemVolumeOGG(musicvol)
					
					if sliderv1>tx#+1
						sliderv1=sliderv1-1-((sliderv1-tx#)/5)
					elseif sliderv1<tx#-1
						sliderv1=sliderv1+1-((sliderv1-tx#)/5)
					else
						sliderv1=tx#
					endif
				endif
				if GetSpriteHitTest(hitsprite2,pCoor)
					tx#=GetPointerX()-75-2
					if tx#<0 then tx#=0
					if tx#>50 then tx#=50
					SetSpriteColor(slider2,222,222,222,200)
					
					
					SetTextString(slidert2,str(round(sliderv2*2))+"%")
					sfxvol=round(sliderv2*2)
					SetSoundSystemVolume(sfxvol)
					if GetSoundInstancePlaying(tmp)=0
						tmp=PlaySound(sfx.whoosh)
					endif
					
					if sliderv2>tx#+1
						sliderv2=sliderv2-1-((sliderv2-tx#)/5)
					elseif sliderv2<tx#-1
						sliderv2=sliderv2+1-((sliderv2-tx#)/5)
					else
						sliderv2=tx#
					endif
				endif
				if GetSpriteHitTest(hitsprite3,pCoor)
					tx#=GetPointerX()-75-2
					if tx#<16.6
						tx#=0
					elseif tx#<33
						tx#=1
					else
						tx#=2
					endif
					if tx#>50 then tx#=50
					SetSpriteColor(slider3,222,222,222,200)
					
					
					SetTextString(slidert3,"May improve performance: "+str(round(tx#)))
					upframe=round(tx#)
				endif
				if GetSpriteHitTest(hitsprite4,pCoor)
					tx#=GetPointerX()-75-2
					if tx#<25
						tx#=0
					else
						tx#=1
					endif
					
					SetSpriteColor(slider4,222,222,222,200)
					
					
					if tx#=1
						SetTextString(slidert4,"On")
					else
						SetTextString(slidert4,"Off")
					endif
					if round(tx#)<>lightColours //swap
						if lightColours //change to the opposite of current
							SetSpriteImage(b,img.menu)
							SetClearColor( 0,0,0 ) 
							SetPrintColor(255,255,255)
							SetSpriteColor(bo,0,0,0,0)
						else
							SetClearColor( 230,230,200)
							SetPrintColor(0,0,0)
							SetSpriteColor(bo,230,230,200,0)
							SetSpriteImage(b,img.menul)
						endif
					endif
					lightColours=round(tx#)
				endif
			endif
			if GetPointerReleased() then SaveProgress()
			
			tx#=upframe*25
			if sliderv3>tx#+1
				sliderv3=sliderv3-1-((sliderv3-tx#)/10)
			elseif sliderv3<tx#-1
				sliderv3=sliderv3+1-((sliderv3-tx#)/10)
			else
				sliderv3=tx#
			endif
			tx#=lightColours*50
			if sliderv4>tx#+1
				sliderv4=sliderv4-1-((sliderv4-tx#)/10)
			elseif sliderv4<tx#-1
				sliderv4=sliderv4+1-((sliderv4-tx#)/10)
			else
				sliderv4=tx#
			endif
			
			if state(rate)=2
				OpenBrowser("https://play.google.com/store/apps/details?id=digital.immortal.na4")
				//RateApp("1253810098")
				`FirebaseLogEvent("rate_google_play")
			endif
			if state(twit)=2
				OpenBrowser("https://twitter.com/immortaldigital")
				`FirebaseLogEvent("follow_twitter")
			endif
			if state(fb)=2
				OpenBrowser("https://www.facebook.com/ImmortalDigital/")
				`FirebaseLogEvent("like_fb")
			endif
			/*
			if state(restore)=2
				InAppPurchaseRestore()
				if GetInAppPurchaseAvailable(0)
					FullVersionUnlocked=1
					SaveProgress()
				endif
			endif
			*/
			if state(backButton)=2
				menuState=1
				tplaymode=_menu
			endif
			if GetRawKeyReleased(27)
				menuState=1
				tplaymode=_menu
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
			if timer()-t#>0.2
				playmode=tplaymode
			endif
		endif
		
        if playmode<>0 then exit
       DoSync()
    loop
endfunction

