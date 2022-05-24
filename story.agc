function story()
	b=CreateBSprite(img.menu,70,70,70)
    bo=CreatebSprite(0,0,0,0)
    SetSpriteColor(bo,0,0,0,0)
    SetSpriteDepth(bo,1)
    
    playmode=0
    tplaymode=0
    
    playStory=0
    
	
	text as string[10]
	text[1]="     You did it!     "+chr(10)+chr(10)+"Thanks for playing!   I hope you enjoyed completing Na4 as much as I enjoyed making it.   Be sure to follow me on Facebook and Twitter (@ImmortalDigital) for the latest updates on my new projects.   Have a great day, see you next time :)"+chr(10)+chr(10)+"- Some Random Dev"
	text[2]=""
	text[3]=""
	
	txt as string
	txt=text[1]
	
	
	
	tid=CreateText(txt)
	SetTextFont(tid,gravityFONT)
	SetTextPosition(tid,75,5)
	SetTextSize(tid,7)
	SetTextMaxWidth(tid,150)
	SetTextSpacing(tid,0)
	SetTextColor(tid,205,255,30,0)
	SetTextAlignment(tid,1)
	
	artiC=0
	
	for k=1 to 18
		if arti[k].unlocked then inc artiC,1
	next
	
	tid2=CreateText("      ARTIFACTS FOUND: " + str(artiC)+"/18")
	SetTextFont(tid2,gravityFONT)
	SetTextPosition(tid2,75,85)
	SetTextSize(tid2,10)
	SetTextMaxWidth(tid2,150)
	SetTextSpacing(tid2,0)
	SetTextColor(tid2,185,220,20,0)
	SetTextAlignment(tid2,1)
	
	art=CreateSprite(img.art[18])
	SetSpriteSize(art,10,10)
	SetSpritePosition(art,21,83.4)
	SetSpriteColor(art,185,220,20,0)
	
	
	
	timeout as float
	timek as integer
	timeout=timer()
	currentLetter=0
	spd as float
	spd=0.1
	
	
	playmode=0
	sT as float
	storyState=0
	
	do
		if storyState=0
			for k=0 to len(txt)
				if k<=currentLetter
					a=GetTextCharColorAlpha(tid,k)
					a=a+5
					//if spd=0.025 then a=a+10
					if a>255 then a=255
					if a<255
						a#=255-a
						newy#=a#/5000.0
						newy#=GetTextCharY(tid,k)-newy#
						SetTextCharY(tid,k,newy#)
					endif
					SetTextCharColorAlpha(tid,k,a)
				endif
			next
			
			if currentLetter>295
				a=GetTextColorAlpha(tid2)
				a=a+5
				if a>255 then a=255
				SetTextColorAlpha(tid2,a)
				SetSpriteColorAlpha(art,a)
			endif
			
			if GetPointerState() and currentLetter<265
				spd=0.015
			else
				spd=0.05
			endif
			
			if timer()-timeout>spd
				inc currentLetter,1
				timeout=timer()
			endif
			
			if currentLetter>305 and GetPointerReleased()
				storyState=1
			endif
			
		elseif storyState=1
			SetSpriteVisible(bo,1)
			storyState=2
		elseif storyState=2
			a=GetSpriteColorAlpha(bo)
			a=a+15
			if a>255 then a=255
			SetSpriteColorAlpha(bo,a)
			if a=255
				t#=timer()
				storyState=3
			endif
		elseif storyState=3
			if timer()-t#>0.15
				playmode=_menu
			endif
		endif
		
		if playmode<>0 then exit
		sync()
	loop
	
	DeleteText(tid)
	DeleteText(tid2)
	DeleteSprite(b)
	DeleteSprite(bo)
endfunction


function freepart()
	b=CreateBSprite(img.menu,70,70,70)
    bo=CreatebSprite(0,0,0,0)
    SetSpriteColor(bo,0,0,0,0)
    SetSpriteDepth(bo,1)
    
    playmode=0
    tplaymode=0
    
    playStory=0
    
	
	text as string[10]
	text[1]="     You've finished the free part of Na4!     "+chr(10)+chr(10)+"I hope you had fun playing my game."+chr(10)+"You can unlock the expansion pack to gain access to another 50 levels"+chr(10)+chr(10)+"- Some Random Dev"
	
	txt as string
	txt=text[1]
	
	
	
	tid=CreateText(txt)
	SetTextFont(tid,gravityFONT)
	SetTextPosition(tid,75,5)
	SetTextSize(tid,7)
	SetTextMaxWidth(tid,150)
	SetTextSpacing(tid,0)
	SetTextColor(tid,205,255,30,0)
	SetTextAlignment(tid,1)
	
	
	
	timeout as float
	timek as integer
	timeout=timer()
	currentLetter=0
	spd as float
	spd=0.1
	
	
	playmode=0
	sT as float
	storyState=0
	
	do
		if storyState=0
			for k=0 to len(txt)
				if k<=currentLetter
					a=GetTextCharColorAlpha(tid,k)
					a=a+5
					//if spd=0.025 then a=a+10
					if a>255 then a=255
					if a<255
						a#=255-a
						newy#=a#/5000.0
						newy#=GetTextCharY(tid,k)-newy#
						SetTextCharY(tid,k,newy#)
					endif
					SetTextCharColorAlpha(tid,k,a)
				endif
			next
			
			if GetPointerState()
				spd=0.005
			else
				spd=0.03
			endif
			
			if timer()-timeout>spd
				inc currentLetter,1
				timeout=timer()
			endif
			
			if currentLetter>len(txt) and GetPointerReleased()
				storyState=1
			endif
			
		elseif storyState=1
			SetSpriteVisible(bo,1)
			storyState=2
		elseif storyState=2
			a=GetSpriteColorAlpha(bo)
			a=a+15
			if a>255 then a=255
			SetSpriteColorAlpha(bo,a)
			if a=255
				t#=timer()
				storyState=3
			endif
		elseif storyState=3
			if timer()-t#>0.15
				playmode=_select
			endif
		endif
		
		if playmode<>0 then exit
		sync()
	loop
	
	DeleteText(tid)
	DeleteSprite(b)
	DeleteSprite(bo)
endfunction

