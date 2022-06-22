function nextLevel()
    b=CreateBSprite(img.menu,255,255,255)
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
    
    text2 as integer
    textB2 as integer
    
    r=random(1,100)
    if r<10
		st="Awesome!"
	
	elseif r<20
		st="Great Job!"
	
	elseif r<30
		st="Excellent!"
	
	elseif r<40
		st="Fantastic!"
	
	elseif r<50
		st="Amazing!"
	
	elseif r<55
		st="Stunning!"
	
	elseif r<60
		st="Perfect!"
	
	elseif r<65
		st="Outstanding!"
	
	elseif r<70
		st="Incredible!"
	
	elseif r<75
		st="Magnificent!"
	
	elseif r<79
		st="Inconceivable!"
	
	elseif r<83
		st="Exquisite!"
	
	elseif r<87
		st="Rockin' it!"
		
	elseif r<91
		st="Splendid!"
	
	elseif r<93
		st="Wonderful!"
	
	elseif r<95
		st="Flawless!"
	
	elseif r<97
		st="Superb!"
	
	elseif r<99
		st="Sublime!"
	else
		st="Legendary!"
	endif
    
    st as string
    
    
    textB=CreateText(st)
    SetTextAlignment(textB,1)
    SetTextPosition(textB,75+0.75,5+0.5)
    SetTextSize(textB,15)
    SetTextSpacing(textB,-0.1)
    SetTextFont(textB,gravityFONT)
    SetTextColor(textB,0,0,0,100)
    text=CreateText(st)
    SetTextAlignment(text,1)
    SetTextPosition(text,75,5)
    SetTextSize(text,15)
    SetTextSpacing(text,-0.1)
    SetTextFont(text,gravityFONT)
    SetTextColor(text,185,225,20,255)
    
    textB2=CreateText("Level  "+str(currentLevel)+"  Complete")
    SetTextAlignment(textB2,1)
    SetTextPosition(textB2,75+0.75,20+0.5)
    SetTextSize(textB2,8)
    SetTextSpacing(textB2,-0.1)
    SetTextFont(textB2,gravityFONT)
    SetTextColor(textB2,0,0,0,100)
    text2=CreateText("Level  "+str(currentLevel)+"  Complete")
    SetTextAlignment(text2,1)
    SetTextPosition(text2,75,20)
    SetTextSize(text2,8)
    SetTextSpacing(text2,-0.1)
    SetTextFont(text2,gravityFONT)
    SetTextColor(text2,185,220,20,255)
    
    if currentLevel=0
		SetTextString(textB2,"Tutorial Complete!")
		SetTextString(text2,"Tutorial Complete!")
	endif
	
	
    
    nextl=MakeButton(sbR-40-5,sbB-15-5,40,15,img.bNext1,img.bNext2)
    MakeTendrils(sbR-40-5+20,sbB-15-5+7.5,38,20,nextl,1)
    
    again=MakeButton(sbL+5,sbB-15-2,12,12,img.bRestart1,img.bRestart2)
    MakeTendrils(sbL+5+6,sbB-15-2+6,14,8,again,2)
    menu=MakeButton(sbL+5+15,sbB-15-2,12,12,img.bMenu1,img.bMenu2)
    MakeTendrils(sbL+5+15+6,sbB-15-2+6,14,8,menu,2)
    bselect=MakeButton(sbL+5+30,sbB-15-2,12,12,img.bLevelS1,img.bLevelS2)
    MakeTendrils(sbL+5+30+6,sbB-15-2+6,14,8,bselect,2)
    
    
    for k=1 to 255 step 15
		SetSpriteColorAlpha(bo,255-k)
		DoSync()
	next
	SetSpriteVisible(bo,0)
    
    
    menuState=0
    do
		if menuState=0
			if state(nextl)=2
				menuState=1
				inc currentLevel,1
				tplaymode=_game
				if currentLevel>99 then tplaymode=_select
			endif
			if state(again)=2
				menuState=1
				tplaymode=_game
			endif
			if state(menu)=2
				menuState=1
				tplaymode=_menu
			endif
			if state(bselect)=2
				menuState=1
				tplaymode=_select
				if maxLevel=currentLevel+1 and mod(maxLevel,15)=0
					lastLevel=lastLevel-1
				endif
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
endfunction

