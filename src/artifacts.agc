function artifacts()
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
    
    SetPhysicsGravity(0,0)
    SetPhysicsWallBottom(1)
    SetPhysicsWallLeft(1)
    SetPhysicsWallRight(1)
    SetPhysicsWallTop(1)
    
    mj as integer
    
    textB=CreateText("ARTIFACTS")
    SetTextAlignment(textB,1)
    SetTextPosition(textB,75+0.75,2+0.75)
    SetTextSize(textB,12)
    SetTextSpacing(textB,-0.2)
    SetTextFont(textB,gravityFONT)
    SetTextColor(textB,0,0,0,100)
    text=CreateText("ARTIFACTS")
    SetTextAlignment(text,1)
    SetTextPosition(text,75,2)
    SetTextSize(text,12)
    SetTextSpacing(text,-0.2)
    SetTextFont(text,gravityFONT)
    SetTextColor(text,185,225,20,255)
    SetTextDepth(text,2)
    SetTextDepth(textB,2)
    
    tyt=CreateText("Gotta collect them all!")
    SetTextAlignment(tyt,1)
    SetTextPosition(tyt,75,100-10)
    SetTextSize(tyt,4.3)
    SetTextMaxWidth(tyt,145)
    SetTextSpacing(tyt,0.2)
    SetTextFont(tyt,gravityFONT)
    SetTextColor(tyt,185,225,20,240)
    SetTextDepth(tyt,2)
    
    tpad=CreateSprite(0)
    SetSpriteColor(tpad,0,0,0,100)
    SetSpriteSize(tpad,150,14)
    SetSpritePosition(tpad,0,0)
    tpad=CreateSprite(0)
    SetSpriteColor(tpad,0,0,0,100)
    SetSpriteSize(tpad,150,10)
    SetSpritePosition(tpad,0,100-10)
    
    
    art as integer[6,3]
    tpad1 as integer[6,3]
    tpad2 as integer[6,3]
    strs as string[18]
    selected=0
    c=0
    for y=1 to 3
		for x=1 to 6
			inc c,1
			tpad1[x,y]=CreateSprite(0)
			SetSpriteColor(tpad1[x,y],0,0,0,100)
			SetSpriteSize(tpad1[x,y],18,18)
			SetSpritePosition(tpad1[x,y],15+(x*20)-20,22+(y*20)-20)
			
			if arti[c].unlocked
				art[x,y]=CreateSprite(img.art[c])
				SetSpriteSize(art[x,y],18,18)
				SetSpritePosition(art[x,y],15+(x*20)-20,22+(y*20)-20)
				SetSpriteColor(art[x,y],255,255,255,280)
				//if lightColours then SetSpriteColor(art[x,y],0,0,0,280)
			endif
			
			tpad2[x,y]=CreateSprite(0)
			SetSpriteColor(tpad2[x,y],0,0,0,150)
			SetSpriteSize(tpad2[x,y],18,2)
			SetSpritePosition(tpad2[x,y],15+(x*20)-20,22+(y*20)-20+16)
		next
	next
	
	strs[1]="It was this boat that caused the issue in the first place, when it was stolen from the Global Order"
	strs[2]="These belonged to Chancellor Vale. He was executed shortly after a boat under his command was stolen"
	strs[3]="He looks like a fun guy, you remark to yourself"
	strs[4]="The TV stations were the first to be taken. The Global Order didn't like people disagreeing with their instructions"
	strs[5]="This is symbolic of the cleanup undertaken by Chancellor Vale. He reduced crime to zero overnight. Nobody asked how"
	strs[6]="After the war, fruit started to die. Only apple trees survived the polution. That doesn't mean you wanted to eat the apples however"
	strs[7]="Spiders thrived and mutated in the nuclear fallout. It wasn't uncommon to see spiders the size of a cat"
	strs[8]="Time was ticking away. The Global Order was falling apart. War was inevitable"
	strs[9]="Ooh! I love presents. I wonder that's in it?"
	strs[10]="This ring would have been worth thousands before the war. Now you'd trade something like this for a loaf of bread"
	strs[11]="Acid rain is a problem, you should never ever go outside without an umbrella"
	strs[12]="Dolphins were seen as a symbol of freedom and hope by the people"
	strs[13]="This guy was assigned to intelligence work before the war. You wonder how intelligent he can be if he hasn't figured out the war ended already..."
	strs[14]="Armed only with hand guns, the rebels stormed the Global Order HQ and executed Supreme Chancellor Rox. It was too late to stop the war though"
	strs[15]="Helicopters dropped bombs on outlying cities. It was catastrophic. Nothing remained"
	strs[16]="While the people suffered, the Global Order continued to live their life of luxury. "
	strs[17]="The rebel leader was buried here, unlike Supreme Chancellor Rox who was fed to the chickens"
	strs[18]="All this bloodshed and death. All of it over one crystal. You wonder to yourself why the Global Order kept this crystal so close. You reach out to touch it..."
    
    
    backButton=MakeButton(sbL+2,sbT+2,10,10,img.bBack1,img.bBack2)
	MakeTendrils(sbL+2+5,sbT+2+5,12,7, backButton,2) //max possible is about 18
    
    
    taps=0
    menuState=0
    
    do
		if menuState=0
			
			c=0
			
			for y=1 to 3
				for x=1 to 6
					inc c,1
					if arti[c].unlocked //ignore unlocked squares completely
						if GetPointerPressed()
							if GetSpriteHitTest(art[x,y],GetPointerX(),GetPointerY())
								SetTextString(tyt,strs[c])
								if selected<>c then PlaySound(sfx.bop)
								selected=c
							endif
						endif
						
						if c=selected
							a=GetSpriteColorAlpha(art[x,y])
							a=a+10
							if a>240 then a=240
							SetSpriteColorAlpha(art[x,y],a)
							
							col=GetSpriteColorRed(tpad2[x,y])
							col=col+10
							if col>240 then col=240
							SetSpriteColor(tpad2[x,y],col,col,col,150)
						else
							a=GetSpriteColorAlpha(art[x,y])
							a=a-10
							if a<180 then a=180
							SetSpriteColorAlpha(art[x,y],a)
							
							col=GetSpriteColorRed(tpad2[x,y])
							col=col-15
							if col<00 then col=0
							SetSpriteColor(tpad2[x,y],col,col,col,150)
						endif
						
						if c=9
							SetSpritePosition(art[x,y],15+(x*20)-20,22+(y*20)-20)
							
							if GetPointerPressed() and GetSpriteHitTest(art[x,y],GetPointerX(),GetPointerY())
							//if c=9
								inc taps,1
								
								if taps<6
									SetSpritePosition(art[x,y],15+(x*20)-20+random(0,3)-1.5,22+(y*20)-20+random(0,3)-1.5)
								elseif taps=6
									SetSpriteImage(art[x,y],img.scare)
									SetTextString(tyt,"Ohhh.....")
									PlaySound(sfx.growl)
								elseif taps=7
									SetSpriteImage(art[x,y],img.art[c])
									SetTextString(tyt,strs[c])
									taps=0
								endif
							endif
						endif
						if c=18
							SetSpritePosition(art[x,y],15+(x*20)-20,22+(y*20)-20)
							
							if GetPointerPressed() and GetSpriteHitTest(art[x,y],GetPointerX(),GetPointerY())
								inc taps,1
								
								if taps<15
									SetSpritePosition(art[x,y],15+(x*20)-20+random(0,1)-0.5,22+(y*20)-20+random(0,1)-0.5)
								elseif taps=<25
									SetTextString(tyt,"Stop, you're gonna break it")
									SetSpritePosition(art[x,y],15+(x*20)-20+random(0,1)-0.5,22+(y*20)-20+random(0,1)-0.5)
								elseif taps=<35
									SetTextString(tyt,"You feel a strange sensation...")
									SetSpritePosition(art[x,y],15+(x*20)-20+random(0,1)-0.5,22+(y*20)-20+random(0,1)-0.5)
								elseif taps=<50
									SetTextString(tyt,"Actually that was just your finger hurting from hitting it so hard")
									SetSpritePosition(art[x,y],15+(x*20)-20+random(0,1)-0.5,22+(y*20)-20+random(0,1)-0.5)
								elseif taps=51
									SetTextString(tyt,"Suddenly the room goes dark. You hear the voice of Supreme Chancellor Rox saying 'I hate sand'")
									SetSpritePosition(art[x,y],15+(x*20)-20+random(0,1)-0.5,22+(y*20)-20+random(0,1)-0.5)
								elseif taps=52
									SetTextString(tyt,strs[c])
									taps=0
								endif
							endif
						endif
					endif
				next
			next
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
			a=a+20
			if a>255 then a=255
			SetSpriteColorAlpha(bo,a)
			if a=255
				t#=timer()
				menuState=3
			endif
		elseif menuState=3
			if timer()-t#>0.1
				playmode=tplaymode
			endif
		endif
		
        if playmode<>0 then exit
       DoSync()
    loop
endfunction


