SetVirtualResolution(150,100)
//SetWindowSize((GetDeviceHeight()*1.5)/0.75,GetDeviceHeight()/0.75, 0)
SetOrientationAllowed(0,0,1,1)
SetSyncRate(60,1)
SetScissor(0,0,0,0)
SetImmersiveMode(1)

sync()
splashimg=LoadImage("splash.jpg")
loadingimg=LoadImage("splashloading.png")
splash=CreateSprite(splashimg)
SetSpriteSize(splash,150,84)
SetSpritePosition(splash,0,8)
splashloading=CreateSprite(loadingimg)
SetSpriteSize(splashloading,20,5.8)
SetSpritePosition(splashloading,sbL+1,sbB-6.8)
sync()



//SetRawMouseVisible(0) //TEMP

#include "constants.agc"
#include "types.agc"
#include "init.agc"
#include "gui.agc"
#include "misc.agc"
#include "menu.agc"
#include "game.agc"
#include "API.agc"
#include "makewalls.agc"
#include "select.agc"
#include "next.agc"
#include "about.agc"
#include "settings.agc"
#include "tutorial.agc"
#include "artifacts.agc"
#include "story.agc"
#include "trials.agc"

//printn("pirint color etc")
SetPrintColor(240,240,240,255)
SetPrintSize(4)
SetPrintFont(0)
if lightColours=0
	SetClearColor( 0,0,0 ) 
	SetPrintColor(255,255,255)
else
	SetClearColor( 230,230,200) 
	SetPrintColor(0,0,0)
endif

//printn("immseive mode/`Firebase")

gosub init

InAppPurchaseSetKeys ("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0w/F8YOaEUq55SX+OA6A0d6zoMUPtwEdCEG082YXnofCYeYJxlRF9Ez0oI6mQAj2AW7VaoootGX7j6NrGV2FKOb7PQmgbuVoY4OAFZt+Q/XPIn4+r63kivKQdF9habizXnNm9m0YLDCDYmtcqFyUZ2/h13aLL1lvPpttGVIR5YVW36gLRTywlmI7GFv92icRGcz1W1eElqc/GTxOqWfjGJboTcz3szd7p51cN5h/YgwlpNP3Zxqpa32Th80Hwo7sE7zA7oiMIQCpP8EZrikZxQhfEJh5ltQdafRcm1N2zReoo17UiSKirir05Bq8L7LewFsJH80x45HGWXsj3GUBAwIDAQAB","")
InAppPurchaseSetTitle("Na4")
InAppPurchaseAddProductID ("digital.immortal.na4.expansion",0) 
InAppPurchaseSetup() 

//printn("play soundtrack")
PlayMusicOGG(sfx.soundtrack,1)
//SeekMusicOGG( sfx.soundtrack, 73, 0 ) 

//printn("set music/sfx volume")
SetMusicSystemVolumeOGG(musicvol)
SetSoundSystemVolume(sfxvol)

DeleteSprite(splash)
DeleteSprite(splashloading)
DeleteImage(splashimg)
DeleteImage(loadingimg)

//cap()

//printn("START GAEM...")
//lastlevel=32
//maxLevel=66
//saveprogress()
//notifyNewTimeTrials=0

playmode=_menu
currentLevel=maxLevel


do
	if FullVersionUnlocked=0 and currentLevel>50 and playmode=_game then playmode=_select
	
    select playmode
        case exitnow
            exit
        endcase
        case _menu
            menu()
        endcase
        case _game
            gameFunction()
            if lastLevel=99 and playStory=1
				Reset():Story()
			endif
            if lastLevel=50 and playStory=1
				Reset():freepart()
			endif
        endcase
        case _next
            nextLevel()
        endcase
        case _select
            levelSelect()
        endcase
        case _about
            about()
        endcase
        case _artifacts
            artifacts()
        endcase
        case _settings
            settings()
        endcase
        case _tutorial
            RunTutorial()
        endcase
    endselect
    Reset()
loop
end





function cap()
	for l=0 to 99
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
		
		
		 trail=0
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
		 starPart as integer[3]
		 portalPart as integer
		
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
		
		if GetFileExists("lvl/l"+str(l)+".fld")=0 then l=1
		LoadLevel("lvl/l"+str(l)+".fld")
		player.state=levelPar
		if cArti<>0 then SetSpriteColorAlpha(arti[cArti].id,0)
		
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
		
		starBarC=player.state
		if player.state=21 then starBarC=0
		for k=1 to starBarC
			starBar[k].id=CreateSprite(img.bar)
			SetSpriteSize(starBar[k].id,8,1.5)
			FixSpriteToScreen(starBar[k].id,1)
			SetSpritePosition(starBar[k].id,2+((k-1)*10),2)
			SetSpriteDepth(starBar[k].id,1) //HUD
			SetSpriteColor(starBar[k].id,255,255,255,255)
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
		 cancelable as integer
		cancelable=0
		cancelS=CreateSprite(img.cross)
		SetSpriteSize(cancelS,10,10)
		SetSpritePosition(cancelS,sbR-10-3-10-3,sbT+3)
		
		//SetSpritePosition(cancelS,75-16,1)
		FixSpriteToScreen(cancelS,1)
		SetSpriteDepth(cancelS,1)
		SetSpriteColor(cancelS,255,255,255,0)
		
		
		
		 game as tGame
		outofbounds as integer //if the player has gone off the screen
		player.aiming=0
		game.state=1
		game.portalState=0
		
		// Godmode=1
		InitTut() //will create tutorial on correct levels
		
		//SetSpriteColorAlpha(player.id,(1-(amt#*amt#))*255) //basic cubic interpolation
		//SetSpriteColorAlpha(player.id4,(1-(amt#*amt#))*255) //basic cubic interpolation
		
		update(_FRAMETIME)
		SetParticlesFrequency(trail,rtrailfreq)
		SetParticlesPosition(trail,GetSpriteX(player.id)+2.5,GetSpriteY(player.id)+2.5)
		SetSpritePosition(player.id3,GetSpriteX(player.id),GetSpriteY(player.id))
		SetSpritePosition(player.id4,GetSpriteX(player.id)-5,GetSpriteY(player.id)-5)
		
		Render()
		im=GetImage(0,0,150,100) 
		ResizeImage( im, 240,160) 
		SaveImage( im, str(l)+".jpg" ) 
		DeleteImage(im)
		ClearScreen()
		
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
		Reset()
	next
endfunction
