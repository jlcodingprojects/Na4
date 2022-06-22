function Menu()
    b=CreateBSprite(img.menu,255,255,255)
    if lightColours then SetSpriteImage(b,img.menul)
    bo=CreatebSprite(0,0,0,0)
    SetSpriteColor(bo,0,0,0,0)
    if lightColours then SetSpriteColor(bo,230,230,200,0)
    SetSpriteVisible(bo,0)
    SetSpriteDepth(bo,1)
    
    playmode=0
    tplaymode=0
    
    
    SetPhysicsGravity(0,100)
    SetViewOffset(0,0)
    
    
    
    
    loveButton=MakeButton(sbR-10-3,sbT+3,10,10,img.bLove1,img.bLove2)
	MakeTendrils(sbR-10-3+5,sbT+3+5,11,6, loveButton,2) //max possible is about 18
    settingsButton=MakeButton(sbR-10-3-13,sbT+3,10,10,img.bSettings1,img.bSettings2)
	MakeTendrils(sbR-10-3+5-13,sbT+3+5,11,6, settingsButton,2) //max possible is about 18
    artifactsButton=MakeButton(sbR-10-3-26,sbT+3,10,10,img.bArtifacts1,img.bArtifacts2)
	MakeTendrils(sbR-10-3+5-26,sbT+3+5,11,6, artifactsButton,2) //max possible is about 18

    start=MakeButton(sbR-40-5,sbB-15-5,40,15,img.bNext1,img.bNext2)
    MakeTendrils(sbR-40-5+20,sbB-15-5+7.5,38,28,start,1)
    
    level=MakeButton(sbL+5,sbB-15-5,40,15,img.bLevel1,img.bLevel2)
    MakeTendrils(sbL+5+20,sbB-15-5+7.5,38,28,level,1)
    
    prog=CreateSprite(0)
    SetSpritePosition(prog,sbL,sbT)
    SetSpriteSize(prog,maxLevel*(sbW/100.0),0.8)
    SetSpriteColorAlpha(prog,200)
    
    
    menuState=0
    
    do
		if menuState=0
			if state(start)=2
				menuState=1
				tplaymode=_game
			endif
			if state(level)=2
				menuState=1
				tplaymode=_select
			endif
			if state(settingsButton)=2
				menuState=1
				tplaymode=_settings
			endif
			if state(loveButton)=2
				menuState=1
				tplaymode=_about
			endif
			if state(artifactsButton)=2
				menuState=1
				tplaymode=_artifacts
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
		
		if GetRawKeyPressed(27) then playmode=-1
        if playmode<>0 then exit
       DoSync()
    loop
    
    if playmode=_game and maxLevel=1 then RunTutorial()
endfunction
