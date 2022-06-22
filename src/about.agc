function about()
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
    
    SetPhysicsGravity(0,10)
    
    a=CreateSprite(0)
    SetSpriteSize(a,sbW,1)
    SetSpritePosition(a,sbL,sbT-1)
    SetSpritePhysicsOn(a,1)
    b=CreateSprite(0)
    SetSpriteSize(b,sbW,1)
    SetSpritePosition(b,sbL,sbB)
    SetSpritePhysicsOn(b,1)
    c=CreateSprite(0)
    SetSpriteSize(c,1,sbH)
    SetSpritePosition(c,sbL-1,sbT)
    SetSpritePhysicsOn(c,1)
    d=CreateSprite(0)
    SetSpriteSize(d,1,sbH)
    SetSpritePosition(d,sbR+1,sbT)
    SetSpritePhysicsOn(d,1)
    
    mj as integer
    
    textB=CreateText("Credits:")
    SetTextAlignment(textB,1)
    SetTextPosition(textB,75+0.75,2+0.75)
    SetTextSize(textB,15)
    SetTextSpacing(textB,0.2)
    SetTextFont(textB,gravityFONT)
    SetTextColor(textB,0,0,0,100)
    text=CreateText("Credits:")
    SetTextAlignment(text,1)
    SetTextPosition(text,75,2)
    SetTextSize(text,15)
    SetTextSpacing(text,0.2)
    SetTextFont(text,gravityFONT)
    SetTextColor(text,185,225,20,255)
    SetTextDepth(text,2)
    SetTextDepth(textB,2)
    
    tytB=CreateText("Thanks for Playing!")
    SetTextAlignment(tytB,1)
    SetTextPosition(tytB,75+0.75,100-14+0.75)
    SetTextSize(tytB,12)
    SetTextSpacing(tytB,0.2)
    SetTextFont(tytB,gravityFONT)
    SetTextColor(tytB,0,0,0,100)
    SetTextDepth(tytB,2)
    tyt=CreateText("Thanks for Playing!")
    SetTextAlignment(tyt,1)
    SetTextPosition(tyt,75,100-14)
    SetTextSize(tyt,12)
    SetTextSpacing(tyt,0.2)
    SetTextFont(tyt,gravityFONT)
    SetTextColor(tyt,185,225,20,240)
    SetTextDepth(tyt,2)
    
    
    //creditst=CreateText("Brought to you by IMMORTAL.DIGITAL"+chr(10)+"'Industrial Cinematic', 'Killers', 'Mistake the Getaway' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0"+chr(10)+"'Vial', 'Syringe', by sbed (game-icons.net) Licensed under CC BY 3.0"+chr(10)+"'Pill', 'Alien skull', 'Wooden sign', 'Radioactive', 'Biohazard', by Lorc (game-icons.net) Licensed under CC BY 3.0"+chr(10)+"'Hearts', by Skoll (game-icons.net) Licensed under CC BY 3.0"+chr(10)+"'Gravity' typeface, by Vincenzo Vuono (www.vincenzovuono.com) Licensed under CC BY 4.0"+chr(10)+"Vector Design by Vecteezy.com"+chr(10)+"CC BY 4.0 http://creativecommons.org/licenses/by/4.0/"+chr(10)+"CC BY 3.0 http://creativecommons.org/licenses/by/3.0/")
    creditstB=CreateText("Brought to you by IMMORTAL.DIGITAL"+chr(10)+"'Industrial Cinematic', 'Mistake the Getaway' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0"+chr(10)+"Icons by sbed, Lorc, Skoll, Delapouite, faithtoken (game-icons.net) CC BY 3.0"+chr(10)+"'Gravity' typeface, by Vincenzo Vuono (www.vincenzovuono.com) CC BY 4.0"+chr(10)+"HACKED typeface by David Libeau (dafont.com)"+chr(10)+"Sunburst designed by Freepik.com"+chr(10)+"SFX from Benboncan, klankbeeld (freesound.org)"+chr(10)+"Vector Design by Vecteezy.com"+chr(10)+"CC BY 4.0  http://creativecommons.org/licenses/by/4.0/"+chr(10)+"CC BY 3.0  http://creativecommons.org/licenses/by/3.0/")
    
    SetTextAlignment(creditstB,1)
    SetTextPosition(creditstB,75+0.25,15+0.25)
    SetTextMaxWidth(creditstB,145)
    SetTextLineSpacing(creditstB,1)
    SetTextSize(creditstB,5)
    SetTextSpacing(creditstB,-0.2)
    SetTextFont(creditstB,gravityFONT)
    SetTextColor(creditstB,0,0,0,200)
    SetTextDepth(creditstB,2)
    
    creditst=CreateText("Brought to you by IMMORTAL.DIGITAL"+chr(10)+"'Industrial Cinematic', 'Mistake the Getaway' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0"+chr(10)+"Icons by sbed, Lorc, Skoll, Delapouite, faithtoken (game-icons.net) CC BY 3.0"+chr(10)+"'Gravity' typeface, by Vincenzo Vuono (www.vincenzovuono.com) CC BY 4.0"+chr(10)+"HACKED typeface by David Libeau (dafont.com)"+chr(10)+"Sunburst designed by Freepik.com"+chr(10)+"SFX from Benboncan, klankbeeld (freesound.org)"+chr(10)+"Vector Design by Vecteezy.com"+chr(10)+"CC BY 4.0  http://creativecommons.org/licenses/by/4.0/"+chr(10)+"CC BY 3.0  http://creativecommons.org/licenses/by/3.0/")
    
    SetTextAlignment(creditst,1)
    SetTextPosition(creditst,75,15)
    SetTextMaxWidth(creditst,145)
    SetTextLineSpacing(creditst,1)
    SetTextSize(creditst,5)
    SetTextSpacing(creditst,-0.2)
    SetTextFont(creditst,gravityFONT)
    SetTextColor(creditst,185,225,20,255)
    SetTextDepth(creditst,2)
    
	player.id=CreateSprite(img.player)
	SetSpriteSize(player.id,sbL+5,sbT+5)
	SetSpriteColor(player.id,234,234,225,255)
	SetSpritePosition(player.id,5,5) //behind play button
	if lightColours
		SetSpriteColor(player.id,0,0,0,255)
	endif
	player.pos.x=sbL+5
	player.pos.y=sbT+5
	player.vel.x=0
	player.vel.y=0
	
	trail = CreateParticles(0,0)
	SetParticlesDirection(trail,1,0)
	SetParticlesAngle(trail,360)
	SetParticlesFrequency(trail,5)
	SetParticlesImage(trail,img.circleFull)
	SetParticlesLife(trail,1)
	SetParticlesStartZone(trail,-2.5,-2.5,2.5,2.5)
	SetParticlesDepth(trail,10)
	SetParticlesSize(trail,0.5)
	SetParticlesMax(trail,-1)
	SetParticlesVelocityRange(trail,0.8,1.1)
	FixParticlesToScreen(trail,0)
	AddParticlesColorKeyFrame(trail,0,255,255,255,0)
	AddParticlesColorKeyFrame(trail,0.1,255,255,255,255)
	AddParticlesColorKeyFrame(trail,1,255,255,255,0)
	tfreq=5
	ttfreq=5
    
    alpha=255
    for k=0 to len(GetTextString(creditst))
		//SetTextCharColor(creditst,k,185+random(0,5)-10,225+random(0,20)-10,20+random(0,20)-10,255)
		if mid(GetTextString(creditst),k,1)=chr(10)
			alpha=alpha+40
			if alpha>255 then alpha=180
		endif
		SetTextCharColorAlpha(creditst,k,alpha)
	next
    
    backButton=MakeButton(sbL+2,sbT+2,10,10,img.bBack1,img.bBack2)
	MakeTendrils(sbL+2+5,sbT+2+5,12,7, backButton,2) //max possible is about 18
    
    
    
    menuState=0
    
    do
		SetParticlesPosition(trail,GetSpriteX(player.id)+2.5,GetSpriteY(player.id)+2.5)
		SetParticlesFrequency(trail,ttfreq)
		
		
		tfreq=5
		if ttfreq>50 then ttfreq=50
		if ttfreq<tfreq-1
			ttfreq=ttfreq+5
		elseif ttfreq>tfreq+5
			ttfreq=ttfreq-5
		else
			ttfreq=tfreq
		endif
		
		SetSpritePosition(player.id,player.pos.x,player.pos.y)
		player.pos.x=player.pos.x+player.vel.x
		player.pos.y=player.pos.y+player.vel.y
		player.vel.x=player.vel.x*0.995
		player.vel.y=player.vel.y*0.995
		
		if player.pos.x<GetScreenBoundsLeft()
			player.pos.x=GetScreenBoundsLeft()
			player.vel.x=player.vel.x*-0.9
			
			SetParticlesPosition(player.id,player.pos.x+5,player.pos.y+2.5)
			ttfreq=500
		endif
		if player.pos.x>GetScreenBoundsRight()-5
			player.pos.x=GetScreenBoundsRight()-5
			player.vel.x=player.vel.x*-0.9
			
			SetParticlesPosition(player.id,player.pos.x,player.pos.y+2.5)
			ttfreq=500
		endif
		if player.pos.y<GetScreenBoundsTop()
			player.pos.y=GetScreenBoundsTop()
			player.vel.y=player.vel.y*-0.9
			
			SetParticlesPosition(player.id,player.pos.x+2.5,player.pos.y)
			ttfreq=500
		endif
		if player.pos.y>GetScreenBoundsBottom()-5
			player.pos.y=GetScreenBoundsBottom()-5
			player.vel.y=player.vel.y*-0.9
			
			SetParticlesPosition(player.id,player.pos.x+2.5,player.pos.y+5)
			ttfreq=500
		endif
		
		if GetPointerState() and state(backButton)=0
			tfreq=20
			player.vel.x=player.vel.x + ( (p.x-player.pos.x)/500.0 )
			player.vel.y=player.vel.y + ((p.y-player.pos.y)/500.0)
		endif
		
		
		if menuState=0
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
				pvx#=player.vel.x
				pvy#=player.vel.y
				for i=1 to 9
					pvx#=pvx#*1.5
					pvy#=pvy#*1.5
				next
				SetSpritePhysicsVelocity(confetti[k],pvx#+random(0,200)-100,pvy#+random(0,200)-120)
				SetSpritePhysicsRestitution(confetti[k],0.5)
			next
			
			SetParticlesFrequency(trail,0) //turn trail off first
			ttfreq=0
			tfreq=0
			SetSpriteVisible(player.id,0)
			SetSpritePhysicsOff(player.id)
		elseif menuState=2
			tfreq=0
			ttfreq=0
			a=GetSpriteColorAlpha(bo)
			a=a+5
			if a>255 then a=255
			SetSpriteColorAlpha(bo,a)
			if a=255
				t#=timer()
				menuState=3
			endif
		elseif menuState=3
			tfreq=0
			ttfreq=0
			if timer()-t#>0.15
				playmode=tplaymode
			endif
		endif
		
        if playmode<>0 then exit
       DoSync()
    loop
    DeleteParticles(trail)
endfunction
