function RunTutorial()
	tplaymode=0
	playmode=0
	tplaymode=_next
	
	tutorialMode=1
	Reset()
	
	while(tutorialMode<4)
		currentLevel=0
		gameFunction():Reset()
		if playmode=_game
			if currentLevel=0
				playmode=0
				dec tutorialMode,1 //repeat
			else
				tplaymode=_game
				exit
			endif
		elseif playmode=_select
			`FirebaseLogEvent("did_not_complete_tutorial")
			tplaymode=_select
			exit
		elseif playmode=_menu
			`FirebaseLogEvent("did_not_complete_tutorial")
			tplaymode=_menu
			exit
		endif
		inc tutorialMode,1
	endwhile
	
	playmode=tplaymode
endfunction

function InitTut()
	tut.v1=0
	tut.v2=0
	tut.v3=0
	tut.v4=0
	tut.v5=0
	tut.v6=0
	tut.v7=0
	tut.v8=0
	tut.v9=0
	tut.f1=0
	tut.f2=0
	tut.f3=0
	tut.t1=0
	tut.t2=0
	tut.t3=0
	tut.t4=0
	tut.t5=0
	tut.state=0
	tut.text=0
	tut.text2=0
	
	select currentLevel
		case 0
			if timeTrialOn=0
				tut.text2=CreateText("Tutorial "+str(tutorialMode)+"/3"+chr(10)+"Stage 1/4")
				SetTextColor(tut.text2,255,255,255,255)
				SetTextPosition(tut.text2,113,2)
				SetTextFont(tut.text2,hackedFONT)
				SetTextSize(tut.text2,5)
				SetTextSpacing(tut.text2,-0.1)
				SetTextDepth(tut.text2,3)
				FixTextToScreen(tut.text2,1)
				
				select tutorialMode
					case 1
						tut.clicker=CreateSprite(img.click)
						SetSpriteSize(tut.clicker,12,12)
						SetSpritePosition(tut.clicker,130,70)
						SetSpriteDepth(tut.clicker,3)
						SetSpriteColor(tut.clicker,255,255,255,0)
						if lightColours then SetSpriteColor(tut.clicker,0,0,0,0)
						
						tut.text=CreateText("Tap, drag, and release to shoot")
						SetTextAlignment(tut.text,1)
						tut.texta=0
						SetTextColor(tut.text,15,15,15,tut.texta)
						SetTextMaxWidth(tut.text,145)
						if lightColours then SetTextColor(tut.text,60,60,60,tut.texta)
						SetTextPosition(tut.text,75,73)
						SetTextFont(tut.text,hackedFONT)
						SetTextSize(tut.text,9)
						SetTextSpacing(tut.text,-0.1)
						SetTextDepth(tut.text,3)
						
						tut.initshots=player.state
						tut.changed=0
						tut.state=0
						tut.part=0
						tut.textIn=1
						tut.v1=0
						tut.v2=0
						tut.v3=0
						
						for k=1 to 3
							stars[k].state=2 //unavailable so far
							SetSpriteSize(stars[k].id,0,0)
							SetSpriteVisible(stars[k].id,0)
							if lightColours
								SetParticlesFrequency(starPart[k],0)
							endif
						next
						
						tut.aimer2=CreateAim(50)
						tut.aimer=CreateLineAim(10)
						DrawAimLine(tut.aimer,-10,-10,-10,-10,10) //off screen
						
						tut.tween1=CreateTweenSprite(1.5)
						SetTweenSpriteX(tut.tween1,100,70,TweenEaseIn1())
						SetTweenSpriteY(tut.tween1,50,60,TweenEaseIn1())
						SetTweenSpriteAlpha(tut.tween1,0,255,TweenEaseIn1())
						
						tut.tween2=CreateTweenSprite(1.5)
						SetTweenSpriteX(tut.tween2,130,125,TweenBounce())
						SetTweenSpriteY(tut.tween2,48,40,TweenBounce())
						SetTweenSpriteAlpha(tut.tween2,0,255,TweenSmooth2())
						tut.tween3=CreateTweenSprite(1.5)
						SetTweenSpriteX(tut.tween3,120,125,TweenBounce())
						SetTweenSpriteY(tut.tween3,52,57,TweenBounce())
						SetTweenSpriteAlpha(tut.tween3,0,255,TweenSmooth2())
					endcase
					
					
					
					
					case 2
						tut.clicker=CreateSprite(img.point)
						SetSpriteSize(tut.clicker,7,7)
						SetSpritePosition(tut.clicker,130,70)
						SetSpriteDepth(tut.clicker,3)
						SetSpriteFlip(tut.clicker,1,1)
						SetSpriteColor(tut.clicker,255,255,255,0)
						if lightColours then SetSpriteColor(tut.clicker,0,0,0,0)
						
						tut.text=CreateText("To open the portal, you must smash the vials"+chr(10)+"by launching into them")
						SetTextAlignment(tut.text,1)
						tut.texta=0
						SetTextColor(tut.text,15,15,15,tut.texta)
						SetTextMaxWidth(tut.text,145)
						if lightColours then SetTextColor(tut.text,60,60,60,tut.texta)
						SetTextPosition(tut.text,75,73)
						SetTextFont(tut.text,hackedFONT)
						SetTextSize(tut.text,8.2)
						SetTextSpacing(tut.text,-0.1)
						SetTextDepth(tut.text,3)
						
						tut.initshots=player.state
						tut.changed=0
						tut.state=0
						tut.part=0
						tut.textIn=1
						tut.v1=0
						tut.v2=0
						tut.v3=0
						
						tut.f1=0
						tut.f2=0.5
						
						
						tut.tween1=CreateTweenSprite(1)
						SetTweenSpriteX(tut.tween1,GetSpriteX(stars[1].id)-10,GetSpriteX(stars[1].id)-5,TweenSmooth2())
						SetTweenSpriteY(tut.tween1,GetSpriteY(stars[1].id)-10,GetSpriteY(stars[1].id)-5,TweenSmooth2())
						SetTweenSpriteAlpha(tut.tween1,0,255,TweenSmooth2())
						tut.tween2=CreateTweenSprite(1)
						SetTweenSpriteX(tut.tween2,GetSpriteX(stars[2].id)-10,GetSpriteX(stars[2].id)-5,TweenSmooth2())
						SetTweenSpriteY(tut.tween2,GetSpriteY(stars[2].id)-10,GetSpriteY(stars[2].id)-5,TweenSmooth2())
						SetTweenSpriteAlpha(tut.tween2,0,255,TweenSmooth2())
						tut.tween3=CreateTweenSprite(1)
						SetTweenSpriteX(tut.tween3,GetSpriteX(stars[3].id)-10,GetSpriteX(stars[3].id)-5,TweenSmooth2())
						SetTweenSpriteY(tut.tween3,GetSpriteY(stars[3].id)-10,GetSpriteY(stars[3].id)-5,TweenSmooth2())
						SetTweenSpriteAlpha(tut.tween3,0,255,TweenSmooth2())
						
					endcase
					case 3
						tut.clicker=CreateSprite(img.point)
						SetSpriteSize(tut.clicker,10,10)
						SetSpritePosition(tut.clicker,130,70)
						SetSpriteDepth(tut.clicker,3)
						SetSpriteColor(tut.clicker,255,255,255,0)
						if lightColours then SetSpriteColor(tut.clicker,0,0,0,0)
						FixSpriteToScreen(tut.clicker,1)
						
						tut.text=CreateText("This time, you have limted shots"+chr(10)+"to complete the level")
						SetTextAlignment(tut.text,1)
						tut.texta=0
						SetTextColor(tut.text,15,15,15,tut.texta)
						SetTextMaxWidth(tut.text,145)
						if lightColours then SetTextColor(tut.text,60,60,60,tut.texta)
						SetTextPosition(tut.text,75,73)
						SetTextFont(tut.text,hackedFONT)
						SetTextSize(tut.text,9)
						SetTextSpacing(tut.text,-0.1)
						SetTextDepth(tut.text,3)
						
						tut.initshots=player.state
						tut.changed=0
						tut.state=0
						tut.part=0
						tut.textIn=1
						tut.v1=0
						tut.v2=0
						tut.v3=0
						
						
						tut.tween1=CreateTweenSprite(1)
						SetTweenSpriteX(tut.tween1,20,15,TweenSmooth2())
						SetTweenSpriteY(tut.tween1,10,5,TweenSmooth2())
						SetTweenSpriteAlpha(tut.tween1,0,255,TweenSmooth2())
						
					endcase
				endselect
			endif
		endcase
		case 2
			if timeTrialOn=0
				tut.text=CreateText("Check how many shots you have"+chr(10)+"at the start of each level")
				SetTextAlignment(tut.text,1)
				tut.texta=0
				SetTextColor(tut.text,15,15,15,tut.texta)
				SetTextMaxWidth(tut.text,145)
				if lightColours then SetTextColor(tut.text,60,60,60,tut.texta)
				SetTextPosition(tut.text,75,20)
				SetTextFont(tut.text,hackedFONT)
				SetTextSize(tut.text,10)
				SetTextSpacing(tut.text,-0.1)
				SetTextDepth(tut.text,3)
				
				tut.textIn=1
				
				tut.clicker=CreateSprite(img.point)
				SetSpriteSize(tut.clicker,10,10)
				SetSpritePosition(tut.clicker,130,70)
				SetSpriteDepth(tut.clicker,3)
				SetSpriteColor(tut.clicker,255,255,255,0)
				if lightColours then SetSpriteColor(tut.clicker,0,0,0,0)
				FixSpriteToScreen(tut.clicker,1)
				
				tut.tween1=CreateTweenSprite(1)
				SetTweenSpriteX(tut.tween1,20,15,TweenSmooth2())
				SetTweenSpriteY(tut.tween1,10,5,TweenSmooth2())
				SetTweenSpriteAlpha(tut.tween1,0,255,TweenSmooth2())
			endif
		endcase
		case 3
			if timeTrialOn=0
				tut.text=CreateText("Careful, you only have 2 shots!")
				SetTextAlignment(tut.text,1)
				tut.texta=0
				SetTextColor(tut.text,15,15,15,tut.texta)
				SetTextMaxWidth(tut.text,145)
				if lightColours then SetTextColor(tut.text,60,60,60,tut.texta)
				SetTextPosition(tut.text,75,80)
				SetTextFont(tut.text,hackedFONT)
				SetTextSize(tut.text,10)
				SetTextSpacing(tut.text,-0.1)
				SetTextDepth(tut.text,3)
				
				tut.textIn=1
				
				tut.clicker=CreateSprite(img.point)
				SetSpriteSize(tut.clicker,10,10)
				SetSpritePosition(tut.clicker,130,70)
				SetSpriteDepth(tut.clicker,3)
				SetSpriteColor(tut.clicker,255,255,255,0)
				if lightColours then SetSpriteColor(tut.clicker,0,0,0,0)
				FixSpriteToScreen(tut.clicker,1)
				
				tut.tween1=CreateTweenSprite(1)
				SetTweenSpriteX(tut.tween1,15,10,TweenSmooth2())
				SetTweenSpriteY(tut.tween1,10,5,TweenSmooth2())
				SetTweenSpriteAlpha(tut.tween1,0,255,TweenSmooth2())
			endif
		endcase
		case 4
			if timeTrialOn=0
				tut.text=CreateText("Remember: You can skip levels that are too hard from the pause menu")
				SetTextAlignment(tut.text,1)
				tut.texta=0
				SetTextColor(tut.text,255,255,255,tut.texta)
				SetTextMaxWidth(tut.text,145)
				if lightColours then SetTextColor(tut.text,60,60,60,tut.texta)
				SetTextPosition(tut.text,75,80)
				SetTextFont(tut.text,hackedFONT)
				SetTextSize(tut.text,7)
				SetTextSpacing(tut.text,-0.1)
				SetTextDepth(tut.text,3)
				
				tut.textIn=1
			endif
		endcase
		case 9
			if timeTrialOn=0
				tut.text=CreateText("You slow down much faster while aiming."+chr(10)+"Use this to your advantage!")
				SetTextAlignment(tut.text,1)
				tut.texta=0
				SetTextColor(tut.text,120,120,120,tut.texta)
				SetTextMaxWidth(tut.text,145)
				if lightColours then SetTextColor(tut.text,60,60,60,tut.texta)
				for k=40 to len(GetTextString(tut.text))
					SetTextCharColor(tut.text,k,180,180,180,tut.texta)
					if lightColours then SetTextCharColor(tut.text,k,20,20,20,tut.texta)
				next
				SetTextPosition(tut.text,75,80)
				SetTextFont(tut.text,hackedFONT)
				SetTextSize(tut.text,8)
				SetTextSpacing(tut.text,-0.1)
				SetTextDepth(tut.text,3)
				FixTextToScreen(tut.text,1)
				SetTextMaxWidth(tut.text,140)
				
				tut.textIn=1
			endif
		endcase
		case 27
			if timeTrialOn=0
				tut.text=CreateText("Tap and hold to stop on platforms"+chr(10)+"You don't bounce as much while aiming")
				SetTextAlignment(tut.text,1)
				tut.texta=0
				SetTextColor(tut.text,120,120,120,tut.texta)
				SetTextMaxWidth(tut.text,145)
				if lightColours then SetTextColor(tut.text,60,60,60,tut.texta)
				for k=34 to len(GetTextString(tut.text))
					SetTextCharColor(tut.text,k,180,180,180,tut.texta)
					if lightColours then SetTextCharColor(tut.text,k,20,20,20,tut.texta)
				next
				SetTextPosition(tut.text,75,80)
				SetTextFont(tut.text,hackedFONT)
				SetTextSize(tut.text,8)
				SetTextSpacing(tut.text,-0.1)
				SetTextDepth(tut.text,3)
				FixTextToScreen(tut.text,1)
				SetTextMaxWidth(tut.text,140)
				
				tut.textIn=1
			endif
		endcase
		case 32
			//RAIN EFFECT
			SetSpriteColor(b,170,170,220,255)
			tut.v3=-32
			
			tut.v6=CreateSprite(img.portal)
			SetSpriteSize(tut.v6,90,90)
			SetSpriteColor(tut.v6,0,0,0,60)
			SetSpritePosition(tut.v6,-30,-30)
			SetSpriteAngle(tut.v6,45)

			tut.v1=CreateParticles(-20,0)
			SetParticlesActive(tut.v1,1)
			SetParticlesAngle(tut.v1,5)
			SetParticlesDepth(tut.v1,9)
			SetParticlesDirection(tut.v1,12,80)
			SetParticlesFaceDirection(tut.v1,1)
			SetParticlesImage(tut.v1,img.rain)
			tut.f1=5.0
			SetParticlesFrequency(tut.v1,round(tut.f1))
			SetParticlesLife(tut.v1,15)
			FixParticlesToScreen(tut.v1,1)
			//SetParticlesMax(rain
			SetParticlesSize(tut.v1,1.75)
			SetParticlesStartZone(tut.v1,0,-1,190,1)
			AddParticlesColorKeyFrame(tut.v1,0,150,150,170,255)
			AddParticlesColorKeyFrame(tut.v1,0.9,150,150,170,255)
			AddParticlesColorKeyFrame(tut.v1,1.4,240,240,255,0)
			AddParticlesScaleKeyFrame(tut.v1,0,1)
			AddParticlesScaleKeyFrame(tut.v1,0.7,1)
			AddParticlesScaleKeyFrame(tut.v1,1.2,0.5)
			AddParticlesForce(tut.v1,0.1,1.5,12,10)
			tut.v2=PlaySound(sfx.raining,100,1)
		endcase
		case 53
			//RAIN EFFECT
			SetSpriteColor(b,170,170,220,255)
			tut.v3=-53

			tut.v1=CreateParticles(-20,0)
			SetParticlesActive(tut.v1,1)
			SetParticlesAngle(tut.v1,5)
			SetParticlesDepth(tut.v1,9)
			SetParticlesDirection(tut.v1,12,80)
			SetParticlesFaceDirection(tut.v1,1)
			SetParticlesImage(tut.v1,img.rain)
			tut.f1=5.0
			SetParticlesFrequency(tut.v1,round(tut.f1))
			SetParticlesLife(tut.v1,15)
			FixParticlesToScreen(tut.v1,1)
			//SetParticlesMax(rain
			SetParticlesSize(tut.v1,1.75)
			SetParticlesStartZone(tut.v1,0,-1,190,1)
			AddParticlesColorKeyFrame(tut.v1,0,150,150,170,255)
			AddParticlesColorKeyFrame(tut.v1,0.9,150,150,170,255)
			AddParticlesColorKeyFrame(tut.v1,1.4,240,240,255,0)
			AddParticlesScaleKeyFrame(tut.v1,0,1)
			AddParticlesScaleKeyFrame(tut.v1,0.7,1)
			AddParticlesScaleKeyFrame(tut.v1,1.2,0.5)
			AddParticlesForce(tut.v1,0.1,1.5,12,10)
			tut.v2=PlaySound(sfx.raining,100,1)
		endcase
		case 38
			SetPhysicsGravity(0,0)
		endcase
		case 60
			SetSpriteColor(b,0,0,0,255)
			tut.f1=timer()
			tut.v1=1
			select random(1,3)
				case 1
					tut.s1="You can't see anything... I wonder why?"
				endcase
				case 2
					tut.s1="The lights aren't working for some reason..."
				endcase
				case 3
					tut.s1="The room goes dark..."
				endcase
			endselect
			tut.v2=CreateSprite(img.scare)
			SetSpriteSize(tut.v2,52,52)
			SetSpritePosition(tut.v2,75-26,50-26)
			SetSpriteColor(tut.v2,255,255,255,0)
			SetSpriteDepth(tut.v2,1)
			tut.v3=0
			tut.v4=PlaySound(sfx.ambient,100,1)
			tut.v5=-60
			tut.f5=musicvol
		endcase
		case 83
			tut.v9=CreateSprite(img.portal)
			SetSpriteSize(tut.v9,90,90)
			SetSpriteColor(tut.v9,0,0,0,60)
			SetSpritePosition(tut.v9,-30,-30)
			SetSpriteAngle(tut.v9,45)
		endcase
		//TIMED LEVEL
		case 95
			tut.f1=timer()
			tut.f2=10 //time to complete the level
			
			tut.v2=CreateSprite(0)
			SetSpriteSize(tut.v2,0,0.75)
			SetSpriteDepth(tut.v2,1)
			FixSpriteToScreen(tut.v2,1)
			SetSpritePosition(tut.v2,sbL,sbT)
			
			player.state=21
		endcase
		//BLACKED OUT LEVEL
		case 98
			tut.v1=CreateSprite(0)
			tut.v2=CreateSprite(0)
			tut.v3=CreateSprite(0)
			tut.v4=CreateSprite(0)
			tut.v5=CreateSprite(0)
			tut.v6=CreateSprite(0)
			SetSpriteColor(tut.v1,0,0,0,255)
			SetSpriteColor(tut.v2,0,0,0,255)
			SetSpriteColor(tut.v3,0,0,0,255)
			SetSpriteColor(tut.v4,0,0,0,255)
			SetSpriteColor(tut.v5,0,0,0,255)
			SetSpriteColor(tut.v6,0,0,0,255)
			SetSpriteDepth(tut.v1,4)
			SetSpriteDepth(tut.v2,4)
			SetSpriteDepth(tut.v3,4)
			SetSpriteDepth(tut.v4,4)
			SetSpriteDepth(tut.v5,4)
			SetSpriteDepth(tut.v6,4)
			FixSpriteToScreen(tut.v1,1)
			FixSpriteToScreen(tut.v2,1)
			FixSpriteToScreen(tut.v3,1)
			FixSpriteToScreen(tut.v4,1)
			FixSpriteToScreen(tut.v5,1)
			FixSpriteToScreen(tut.v6,1)
			
			SetSpritePosition(tut.v1,sbL,0)
			SetSpritePosition(tut.v2,sbL,80)
			SetSpritePosition(tut.v3,sbL,0)
			SetSpritePosition(tut.v4,107,0)
			SetSpritePosition(tut.v5,43,25)
			SetSpritePosition(tut.v6,59,51.5)
			SetSpriteSize(tut.v1,150-sbL,10)
			SetSpriteSize(tut.v2,150-sbL,20)
			SetSpriteSize(tut.v3,43-sbL,100)
			SetSpriteSize(tut.v4,43+sbR-150,100)
			SetSpriteSize(tut.v5,90-43,39-25)
			SetSpriteSize(tut.v6,107-59,65.5-51.5)
			
			tut.t1=CreateSprite(0)
			tut.t2=CreateSprite(0)
			tut.t3=CreateSprite(0)
			tut.t4=CreateSprite(0)
			tut.t5=CreateSprite(0)
			SetSpritePosition(tut.t1,43,10)
			SetSpritePosition(tut.t2,90,25)
			SetSpritePosition(tut.t3,43,39)
			SetSpritePosition(tut.t4,43,51.5)
			SetSpritePosition(tut.t5,59,65.6)
			SetSpriteSize(tut.t1,107-43,25-10)
			SetSpriteSize(tut.t2,107-90,51.5-25)
			SetSpriteSize(tut.t3,90-43,51.5-39)
			SetSpriteSize(tut.t4,59-43,80-51.5)
			SetSpriteSize(tut.t5,107-59,80-65.5)
			
			SetSpriteColor(tut.t1,0,0,0,255)
			SetSpriteColor(tut.t2,0,0,0,255)
			SetSpriteColor(tut.t3,0,0,0,255)
			SetSpriteColor(tut.t4,0,0,0,255)
			SetSpriteColor(tut.t5,0,0,0,255)
			SetSpriteDepth(tut.t1,4)
			SetSpriteDepth(tut.t2,4)
			SetSpriteDepth(tut.t3,4)
			SetSpriteDepth(tut.t4,4)
			SetSpriteDepth(tut.t5,4)
			FixSpriteToScreen(tut.t1,1)
			FixSpriteToScreen(tut.t2,1)
			FixSpriteToScreen(tut.t3,1)
			FixSpriteToScreen(tut.t4,1)
			FixSpriteToScreen(tut.t5,1)
			SetSpriteVisible(tut.t1,0)
			SetSpriteVisible(tut.t2,0)
			SetSpriteVisible(tut.t3,0)
			SetSpriteVisible(tut.t4,0)
			SetSpriteVisible(tut.t5,0)
			
			tut.v9=CreateSprite(img.portal)
			SetSpriteSize(tut.v9,90,90)
			SetSpriteColor(tut.v9,0,0,0,60)
			SetSpritePosition(tut.v9,-30,-30)
			SetSpriteAngle(tut.v9,45)
			
			tut.v8=0
		endcase
	endselect
endfunction

function DoTut()
	if GetTextExists(tut.text)
		if tut.textIn=0
			SetTextColorAlpha(tut.text,tut.texta)
		elseif tut.textIn=1
			SetTextColorAlpha(tut.text,0)
			tut.textIn=2
		elseif tut.textIn=2
			for k=0 to len(GetTextString(tut.text))
				if k<>0
					f=GetTextCharColorAlpha(tut.text,k-1)
					if f>20
						a=GetTextCharColorAlpha(tut.text,k)
						if a<255
							a=a+20
							y#=GetTextCharY(tut.text,k)
							y#=y#+0.01
							SetTextCharY(tut.text,k,y#)
						endif
						SetTextCharColorAlpha(tut.text,k,a)
						if k=len(GetTextString(tut.text))-1
							alph=alph+5
							if alph>255 then alph=255
						endif
						if k=len(GetTextString(tut.text))
							tut.textIn=0
							tut.texta=255
						endif
					endif
				else
					a=GetTextCharColorAlpha(tut.text,k)
					if a<250
						a=a+20
						y#=GetTextCharY(tut.text,k)
						y#=y#+0.01
						SetTextCharY(tut.text,k,y#)
					endif
					SetTextCharColorAlpha(tut.text,k,a)
				endif
			next
		endif
	endif
	
	select currentLevel
		case 0
			if timeTrialOn=0
				cancelable=0
				//SetTextColorAlpha(tut.text2,tut.texta)
				
				select tutorialMode
					case 1
						if tut.state=0
							if tut.part=0
								//PlayTweenSprite(tut.tween1,tut.clicker,0.5)
								inc tut.v3,1
								if tut.v3=45 //half second delay
									tut.part=1
									tut.v3=0
								endif
								SetSpritePosition(tut.clicker,100,50)
								SetTextString(tut.text2,"Tutorial "+str(tutorialMode)+"/3"+chr(10)+"Stage 1/3")
								tut.f1=0.2
								tut.f2=0.1
							elseif tut.part=1
								a=GetSpriteColorAlpha(tut.clicker)
								x#=GetSpriteX(tut.clicker) //original 100
								y#=GetSpriteY(tut.clicker) //and 50
								a=a+15
								if a>255 then a=255
								if tut.v2=0
									x#=x#-0.5
									y#=y#+0.35
									if x#<75 then tut.v2=1
								elseif tut.v2=1
									x#=x#+tut.f1*2
									y#=y#+tut.f1
									if x#>75
										tut.f1=tut.f1-0.005
									else
										tut.f1=tut.f1+0.005
									endif
								endif
								
								SetSpritePosition(tut.clicker,x#,y#)
								SetSpriteColorAlpha(tut.clicker,a)
								
								
								if player.aiming
									SetSpriteColorAlpha(tut.clicker,0)
									//StopTweenSprite(tut.tween1,tut.clicker)
									DeleteAim(tut.aimer)
									DeleteAim(tut.aimer2)
									tut.part=2
									
									tut.texta=tut.texta-15
									if tut.texta<100 then tut.texta=100
								else
									DrawAimLine(tut.aimer,GetSpriteX(tut.clicker)+2, GetSpriteY(tut.clicker)+2,100+2,50+2,10)
									DrawAim(tut.aimer2,GetSpriteX(tut.clicker)+2, GetSpriteY(tut.clicker)+2,100+2,50+2)
								endif
							elseif tut.part=2
								if player.aiming
									tut.texta=tut.texta-15
									if tut.texta<100 then tut.texta=100
								endif
								if player.state=7
									inc tut.v1,1
									if tut.v1=1
										SetTextString(tut.text,"Take a few shots and get the hang of it"+chr(10)+"It's best to drag from the middle of the screen")
										SetTextColorAlpha(tut.text,0)
										SetTextString(tut.text2,"Tutorial "+str(tutorialMode)+"/3"+chr(10)+"Stage 2/3")
										tut.textIn=1
									endif
									//if tut.v1=3
										//SetTextString(tut.text,"The further you drag, the more power you have")
										//SetTextColorAlpha(tut.text,0)
										//tut.textIn=1
									//endif
									if tut.v1>1
										tut.v1=0
										tut.state=2
										portal.state=0
										DeleteAim(tut.aimer)
										tut.part=0
									endif
								endif
							endif
						elseif tut.state=2
							if tut.part=0
								SetTextString(tut.text,"To complete the level, launch into the portal!")
								SetTextString(tut.text2,"Tutorial "+str(tutorialMode)+"/3"+chr(10)+"Stage 3/3")
								SetSpriteImage(tut.clicker,img.point)
								SetSpriteColorAlpha(tut.clicker,0)
								SetSpriteFlip(tut.clicker,1,1)
								SetSpritePhysicsVelocity(player.id,0,0)
								SetSpritePhysicsAngularVelocity(player.id,0)
								if GetSpriteX(player.id)>GetSpriteX(portal.id)-15 then SetSpritePosition(player.id,GetSpriteX(portal.id)-15-10, GetSpriteY(player.id))
								if GetTweenSpritePlaying(tut.tween2,tut.clicker) then StopTweenSprite(tut.tween2,tut.clicker)
								PlayTweenSprite(tut.tween3,tut.clicker,0.0)
								if GetTweenSpritePlaying(tut.tween3,tut.clicker) then tut.part=1
								tut.texta=0
								tut.textIn=1
							elseif tut.part=1
								
								if player.aiming
									tut.texta=tut.texta-15
									if tut.texta<100 then tut.texta=100
								endif
								
								if game.state>1
									tut.state=3
									tut.part=0
								endif
							endif
						elseif tut.state=3
							if tut.part=0
								SetTextString(tut.text,"Awesome!")
								SetSpriteColorAlpha(tut.clicker,0)
								if GetTweenSpritePlaying(tut.tween3,tut.clicker) then StopTweenSprite(tut.tween3,tut.clicker)
								tut.part=1
								tut.texta=0
								tut.textIn=1
							elseif tut.part=1
								
							endif
						endif
						
						
						player.state=8
					endcase
					
					
					
					
					
					
					case 2
						
						tut.f1=tut.f1+tut.f2
						if tut.f1>0
							tut.f2=tut.f2-0.02
						else
							tut.f2=tut.f2+0.02
						endif
						
						SetSpriteAngle(tut.clicker,tut.f1*4)
						
						
						if tut.state=0
							if tut.part=0
								PlayTweenSprite(tut.tween1,tut.clicker,0.25)
								if GetSpriteColorAlpha(tut.clicker)>1 then tut.part=1
								SetTextString(tut.text2,"Tutorial "+str(tutorialMode)+"/3"+chr(10)+"Stage 1/4")
								tut.v1=1
							elseif tut.part=1
								flag=3
								
								for k=1 to 3
									if stars[k].state=2 then dec flag,1
								next
								if stars[1].state=1
									StopTweenSprite(tut.tween1,tut.clicker)
									SetSpriteColorAlpha(tut.clicker,0)
								elseif stars[1].state=0
									PlayTweenSprite(tut.tween1,tut.clicker,0)
									
								elseif stars[2].state=1
									StopTweenSprite(tut.tween2,tut.clicker)
									SetSpriteColorAlpha(tut.clicker,0)
								elseif stars[2].state=0
									PlayTweenSprite(tut.tween2,tut.clicker,0)
									
								elseif stars[3].state=1
									StopTweenSprite(tut.tween3,tut.clicker)
									SetSpriteColorAlpha(tut.clicker,0)
								elseif stars[3].state=0
									PlayTweenSprite(tut.tween3,tut.clicker,0)
									
								else
									StopTweenSprite(tut.tween1,tut.clicker)
									StopTweenSprite(tut.tween2,tut.clicker)
									StopTweenSprite(tut.tween3,tut.clicker)
									SetSpriteVisible(tut.clicker,0)
								endif
								
								if flag=2
									if tut.v2=0
										tut.v2=1
										SetTextString(tut.text,"Each level has 3 vials")
										SetTextPosition(tut.text,75,80)
										SetTextString(tut.text2,"Tutorial "+str(tutorialMode)+"/3"+chr(10)+"Stage 2/4")
										tut.textIn=1
									endif
								endif
								if flag=1
									if tut.v2=1
										tut.v2=2
										SetTextString(tut.text,"You can get them in any order")
										SetTextString(tut.text2,"Tutorial "+str(tutorialMode)+"/3"+chr(10)+"Stage 3/4")
										tut.textIn=1
									endif
								endif
								
								
								if player.aiming
									DrawAimLine(tut.aimer,-10,-10,-10,-10,10) //off screen
									
									tut.texta=tut.texta-15
									if tut.texta<100 then tut.texta=100
								endif
								if portal.state=0
									inc tut.v1,1
									if tut.v1>2
										tut.v1=0
										tut.state=2
										tut.part=0
										StopTweenSprite(tut.tween1,tut.clicker)
										StopTweenSprite(tut.tween2,tut.clicker)
										StopTweenSprite(tut.tween3,tut.clicker)
										SetSpriteVisible(tut.clicker,0)
									endif
								endif
							endif
						elseif tut.state=2
							if tut.part=0
								SetTextString(tut.text,"Exit through the portal to finish   ")
								SetTextString(tut.text2,"Tutorial "+str(tutorialMode)+"/3"+chr(10)+"Stage 4/4")
								tut.texta=0
								tut.textIn=1
							elseif tut.part=1
								
								if player.aiming
									tut.texta=tut.texta-15
									if tut.texta<100 then tut.texta=100
								endif
								
								if game.state>1
									tut.state=3
									tut.part=0
								endif
							endif
						elseif tut.state=3
							if tut.part=0
								SetTextString(tut.text,"Awesome!")
								SetSpriteColorAlpha(tut.clicker,0)
								if GetTweenSpritePlaying(tut.tween3,tut.clicker) then StopTweenSprite(tut.tween3,tut.clicker)
								tut.part=1
								tut.texta=0
								tut.textIn=1
							elseif tut.part=1
								
							endif
						endif
						
						
						player.state=8
					endcase
					
					
					
					
					
					
					case 3
						if tut.state=0
							if tut.part=0
								PlayTweenSprite(tut.tween1,tut.clicker,0.25)
								if GetSpriteColorAlpha(tut.clicker)>1 then tut.part=1
								tut.v1=1
							elseif tut.part=1							
								if player.state=0
									if tut.f2=0 then tut.f2=timer()
									if timer()-tut.f2>2 and timer()-tut.f2<2.1
										SetTextString(tut.text,"Normally you would have to restart,"+chr(10)+"But I'll let you finish it")
										player.state=-1
										SetTextColorAlpha(tut.text,0)
										tut.textIn=1
									endif
									if tut.v8=0
										`FirebaseLogEvent("ran_out_of_shots_tutorial_stage_three")
										tut.v8=1
									endif
								endif
								if tut.v7=1 and player.aiming=0
									if player.state=1
										SetTextString(tut.text,"Last shot")
										SetTextString(tut.text2,"Tutorial "+str(tutorialMode)+"/3"+chr(10)+"Stage 4/4")
										SetTextColorAlpha(tut.text,0)
										tut.textIn=1
									elseif player.state=6
										SetTextString(tut.text,"Each level will have a different number")
										SetTextString(tut.text2,"Tutorial "+str(tutorialMode)+"/3"+chr(10)+"Stage 3/4")
										SetTextColorAlpha(tut.text,0)
										tut.textIn=1
									endif
								endif
								tut.v7=player.aiming
								
								if player.state<3
									a=GetSpriteColorAlpha(tut.clicker)-15
									if a<0 then a=0
									SetSpriteColorAlpha(tut.clicker,a)
								endif
								
								if player.aiming
									DrawAimLine(tut.aimer,-10,-10,-10,-10,10) //off screen
									
									tut.texta=tut.texta-15
									if tut.texta<100 then tut.texta=100
								endif
								if portal.state=0
									if tut.v1>2
										tut.v1=0
										tut.state=2
										tut.part=0
										SetSpriteVisible(tut.clicker,0)
									endif
								endif
							endif
							
							if game.state>1
								tut.state=3
								tut.part=0
							endif
						elseif tut.state=3
							if tut.part=0
								SetTextString(tut.text,"Awesome!")
								SetSpriteColorAlpha(tut.clicker,0)
								if GetTweenSpritePlaying(tut.tween3,tut.clicker) then StopTweenSprite(tut.tween3,tut.clicker)
								tut.part=1
								tut.texta=0
								tut.textIn=1
							elseif tut.part=1
								
							endif
						endif
					endcase
				endselect
			endif
		endcase
		case 2
			if timeTrialOn=0
				if player.state<2
					a=GetSpriteColorAlpha(tut.clicker)
					a=a-15
					if a<0 then a=0
					SetSpriteColorAlpha(tut.clicker,a)
				endif
				if player.aiming
					tut.texta=tut.texta-15
					if tut.texta<100 then tut.texta=100
				endif
					
				if tut.part=0
					PlayTweenSprite(tut.tween1,tut.clicker,0.25)
					if GetSpriteColorAlpha(tut.clicker)>1 then tut.part=1
					tut.part=1
				elseif tut.part=1
					if game.state>1 then tut.part=2
					
					if player.state=1 and tut.v1=0
						tut.v1=1
						SetTextString(tut.text,"One more shot")
						tut.textIn=1
					endif
					if player.state=0
						SetTextColorAlpha(tut.text,0)
					endif
				elseif tut.part=2
					SetSpriteColorAlpha(tut.clicker,0)
					SetTextString(tut.text,"Awesome!")
					tut.textIn=1
					tut.part=3
				elseif tut.part=3
					
				endif
			endif
		endcase
		case 3
			if timeTrialOn=0
				if player.state<2
					a=GetSpriteColorAlpha(tut.clicker)
					a=a-15
					if a<0 then a=0
					SetSpriteColorAlpha(tut.clicker,a)
				endif
				if player.aiming
					tut.texta=tut.texta-15
					if tut.texta<100 then tut.texta=100
				endif
					
				if tut.part=0
					PlayTweenSprite(tut.tween1,tut.clicker,0.25)
					if GetSpriteColorAlpha(tut.clicker)>1 then tut.part=1
					tut.part=1
				elseif tut.part=1
					if game.state>1 then tut.part=2
				elseif tut.part=2
					SetSpriteColorAlpha(tut.clicker,0)
					SetTextString(tut.text,"Awesome!")
					tut.textIn=1
					tut.part=3
				elseif tut.part=3
					
				endif
			endif
		endcase
		case 9
			if timeTrialOn=0
				if player.aiming
					tut.texta=tut.texta-15
					if tut.texta<100 then tut.texta=100
				endif
					
				if tut.part=0
					tut.part=1
				elseif tut.part=1
					if player.state=3 and tut.v1=0
						tut.v1=1
						SetTextString(tut.text,"Use it to stop on platforms so you don't fall off the edge")
						SetTextColor(tut.text,160,160,160,tut.texta)
						if lightColours then SetTextColor(tut.text,60,60,60,tut.texta)
						tut.textIn=1
					endif
					
					if game.state>1 then tut.part=2
				elseif tut.part=2
					SetTextString(tut.text,"Awesome!")
					tut.textIn=1
					tut.part=3
				elseif tut.part=3
					
				endif
			endif
		endcase
		case 32
			//MAKE RAIN
			if tut.f1<100 then tut.f1=tut.f1+0.1
			SetParticlesFrequency(tut.v1,round(tut.f1))
			SetSpriteAngle(tut.v6,GetSpriteAngle(tut.v6)+0.05)
		endcase
		case 53
			//MAKE RAIN
			if tut.f1<100 then tut.f1=tut.f1+0.1
			SetParticlesFrequency(tut.v1,round(tut.f1))
		endcase
		case 38
			for k=1 to 299
				if vines[k].active=1
					if vines[k].typ=6 or vines[k].typ=3
						x#=GetSpriteX(vines[k].id)
						y#=GetSpriteY(vines[k].id)
						a#=GetSpriteAngle(vines[k].id)
						x#=x#+cos(vines[k].pos.z)*0.05
						y#=y#+sin(vines[k].pos.z)*0.05
						lx=ScreenToWorldX(-10)
						rx=ScreenToWorldX(161)
						ty=ScreenToWorldY(-10)
						by=ScreenToWorldY(101)
						if x#>rx then x#=lx
						if x#<lx then x#=rx
						if y#>by then y#=ty
						if y#<ty then y#=by
						a#=a#+0.5
						SetSpriteAngle(vines[k].id,a#)
						SetSpritePosition(vines[k].id,x#,y#)
					endif
				endif
			next
		endcase
		case 60
			SetMusicSystemVolumeOGG(tut.f5)
			if tut.f5>0 then tut.f5=tut.f5-1
			
			if tut.v1<len(tut.s1) and tut.v1>0
				if timer()-tut.f1>0.01
					tut.f1=timer()
					inc tut.v1,1
				endif
			else
				if tut.v1>0
					tut.f1=timer()
					tut.v1=0
				elseif tut.v1=0
					if timer()-tut.f1>3
						tut.v1=-1
						tut.f1=timer()
					endif
				elseif tut.v1<0 and -tut.v1<len(tut.s1)
					
					if timer()-tut.f1>0.01
						tut.f1=timer()
						dec tut.v1,1
					endif
				endif
			endif
			
			if tut.v1>0
				print("")
				print("")
				print("")
				print("")
				if game.state=1 then print(mid(tut.s1,1,tut.v1))
			elseif tut.v1=0
				print("")
				print("")
				print("")
				print("")
				if game.state=1 then print(tut.s1)
			elseif tut.v1<0
				print("")
				print("")
				print("")
				print("")
				if game.state=1 then print(mid(tut.s1,1,len(tut.s1)+tut.v1))
			endif
			
			if game.state=3
				if tut.v3=0
					SetSpriteColorAlpha(tut.v2,255)
					PlaySound(sfx.growl)
					tut.v3=1
					SetSpriteImage(b,0)
					SetSpriteColor(b,255,255,255,255)
				else
					a=GetSpriteColorRed(b)
					a=a-15-((255/a)*0.1)
					if a<1 then a=1
					SetSpriteColor(b,a,a,a,255)
					a=GetSpriteColorAlpha(tut.v2)
					a=a-2-((255-a)/100)
					if a<0 then a=0
					SetSpriteColorAlpha(tut.v2,a)
				endif
			endif
		endcase
		case 83
			SetSpriteAngle(tut.v9,GetSpriteAngle(tut.v9)+0.05)
		endcase
		case 95
			//print(timer()-tut.f1)
			
			if tut.state=0
				SetSpriteSize(tut.v2,sbW*((timer()-tut.f1)/tut.f2),0.75)
				if (timer()-tut.f1)+2>tut.f2
					PlaySound(sfx.beeping)
					tut.state=1
				endif
			elseif tut.state=1
				SetSpriteSize(tut.v2,sbW*((timer()-tut.f1)/tut.f2),0.75)
				if (timer()-tut.f1)>tut.f2
					tut.state=2
				endif
			elseif tut.state=2
				DeleteSprite(tut.v2)
				player.dead=1
				player.state=0
				tut.state=3
			endif
		endcase
		case 98
			if tut.v8=0
				if walls[13].teleporting=1 //13 is the ID of the teleporter in level 98
					tut.v8=1
				endif
			elseif tut.v8=1 //flip this frame
				tut.v8=2
				FlipLevel98()
			elseif tut.v8=2
				if walls[13].teleporting=0 //no longer teleporting, reset
					tut.v8=0
				endif
			endif
			SetSpriteAngle(tut.v9,GetSpriteAngle(tut.v9)+0.05)
		endcase
	endselect
	UpdateAllTweens(GetFrameTime())
endfunction

function FlipLevel98()
	if GetSpriteVisible(tut.t1)
		SetSpriteVisible(tut.v1,1)
		SetSpriteVisible(tut.v2,1)
		SetSpriteVisible(tut.v3,1)
		SetSpriteVisible(tut.v4,1)
		SetSpriteVisible(tut.v5,1)
		SetSpriteVisible(tut.v6,1)
		
		SetSpriteVisible(tut.t1,0)
		SetSpriteVisible(tut.t2,0)
		SetSpriteVisible(tut.t3,0)
		SetSpriteVisible(tut.t4,0)
		SetSpriteVisible(tut.t5,0)
	else
		SetSpriteVisible(tut.v1,0)
		SetSpriteVisible(tut.v2,0)
		SetSpriteVisible(tut.v3,0)
		SetSpriteVisible(tut.v4,0)
		SetSpriteVisible(tut.v5,0)
		SetSpriteVisible(tut.v6,0)
		
		SetSpriteVisible(tut.t1,1)
		SetSpriteVisible(tut.t2,1)
		SetSpriteVisible(tut.t3,1)
		SetSpriteVisible(tut.t4,1)
		SetSpriteVisible(tut.t5,1)
	endif
endfunction
