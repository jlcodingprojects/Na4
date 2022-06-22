init:
    global playmode
    playmode=_menu
    
    global playStory=0

    global upframe as integer
    global lightColours as integer
    upframe=0
    lightColours=0
    
    global DisableSounds=0
    
    global FullVersionUnlocked as integer
	
    global tCount
    global lastTouchCount
    global t_mode=_pc `Pointer
    
    global flagfordecrease=0
    if GetKeyBoardExists()=2 then t_mode=_phone `Touch
    
    global gravityFONT as integer
    global gravityFONTb as integer
    global hackedFONT as integer
    //printn("loading fonts")
    gravityFONT=LoadFont("gravity.ttf")
    hackedFONT=LoadFont("hacked.ttf")
    gravityFONTb=LoadFont("gravityb.ttf")
    
    
    global p as pointer
    global img as images
    global sfx as sounds
    
    global b as integer //background sprite
    
    global shaking as integer
    global shaks as shakeT
    
    global levelPar as integer
    
    global tut as tutorial
    global tutorialMode as integer
    //global ttrial as timetrials
    //global trialUnlocked as integer[99]
    global notifyNewTimeTrials=0
    
    global sfxvol
    global musicvol
    sfxvol=100
    musicvol=70
    
    
    /*global game as tObjects
    game.maxW=99
    game._device=t_mode
    game.physicsSpeed=1*/
    
    global aim as tAim
    global aimLine as tAim
    global crosshair as integer
    
	global dontshowloading
    
    
    global player as tObject
    global confetti as integer[50]
    global portal as tObject
    global starBar as tObject[10]
    global stars as tObject[3]
    global walls as tWall[299]
    global vines as tVine[299]
    global vineRatios as float[9]
    global vineDefaultWidth as float[9]
    global vineCount as integer
    global arti as artifacts[99]
    global cArti as integer //current Artifact
    
    global cAnimate as integer
    global cAnimateT as float
    global cAnimateID1 as integer
    global cAnimateID2 as integer
    global cAnimateID3 as integer
    global cAnimateID3B as integer
    
    global fansEnum as integer[99]
    global fansEnumC as integer
    vineCount=9
    
    global currentLevel as integer
    global maxLevel as integer
    global lastLevel as integer
    global skippedLevels as integer[99]
    currentLevel=1
    maxLevel=1
    global timeTrialOn as integer
    timeTrialOn=0
    
    
    gosub loadimg
    gosub loadsfx
    
    LoadProgress()
    
    
						
    //following lines must be AFTER gosub loadimg
    for k=0 to vineCount
		vineRatios[k]=GetImageHeight(img.vine[k])/GetImageWidth(img.vine[k])
	next
	
	vineDefaultWidth[0]=6
	vineDefaultWidth[1]=6
	vineDefaultWidth[2]=12
	vineDefaultWidth[3]=7
	vineDefaultWidth[4]=20
	vineDefaultWidth[5]=17
	vineDefaultWidth[6]=16
	vineDefaultWidth[7]=5
	vineDefaultWidth[8]=32
	vineDefaultWidth[9]=50

    dim buts[199] as button
    dim tens[199] as tendrilsT
    global param1,param2
return


loadimg:
	`img.*=LoadImage("*.png")
	//printn("bg.png to pu1.ong")
	img.back=LoadImage("bg.jpg")
	img.backL=LoadImage("bgl.jpg")
	img.menu=LoadImage("menu.jpg")
	img.menuL=LoadImage("menul.jpg")
	img.bar=LoadImage("bar.png")
	img.circleFull=LoadImage("circleFull.png")
	img.circle=LoadImage("circle.png")
	img.glow=LoadImage("glow.png")
	img.player=LoadImage("player.png")
	img.portal=LoadImage("bio.png")
	img.tele=LoadImage("tele.png")
	img.aim=LoadImage("aim.png")
	img.cross=LoadImage("cross.png")
	img.pu[1]=LoadImage("pu1.png")
	img.pu[2]=LoadImage("pu2.png")
	img.pu[3]=LoadImage("pu3.png")
	
	//printn("tendrils.png to scare.png")
	img.tendrils=LoadImage("tendrils.png")
	img.tendrilsbox=LoadImage("tendrilsbox.png")
	img.tendrils151=LoadImage("tendrils151.png")
	img.static1=LoadImage("static1.png")
	img.static2=LoadImage("static2.png")
	img.scare=LoadImage("scare.png")
	
	//printn("grass to vines")
	img.grass=LoadImage("grass.png")
	for k=0 to vineCount
		img.vine[k]=LoadImage("vine"+str(k)+".png")
	next
	//printn("artifacts")
	for k=1 to 18
		img.art[k]=LoadImage("artifacts/"+str(k)+".png")
	next
	for k=0 to 99
		img.previews[k]=LoadImage("previews/"+str(k)+".jpg")
	next
    
    //printn("grass files")
    img.g4l=LoadImage("grassleft.png")
	img.g4r=LoadImage("grassright.png")
	img.g2=LoadImage("grasstiny.png")
	img.g81=LoadImage("grassmedium1.png")
	img.g82=LoadImage("grassmedium2.png")
	img.g121=LoadImage("grassmid1.png")
	img.g122=LoadImage("grassmid2.png")
	
	//printn("loading buttons")
	img.bLevel1=LoadImage("bLevel1.png")
	img.bLevel2=LoadImage("bLevel2.png")
	img.bLevelS1=LoadImage("bLevelS1.png")
	img.bLevelS2=LoadImage("bLevelS2.png")
	img.bBack1=LoadImage("bBack1.png")
	img.bBack2=LoadImage("bBack2.png")
	img.bSettings1=LoadImage("bSettings1.png")
	img.bSettings2=LoadImage("bSettings2.png")
	img.bLove1=LoadImage("bLove1.png")
	img.bLove2=LoadImage("bLove2.png")
	img.bNext1=LoadImage("bNext1.png")
	img.bNext2=LoadImage("bNext2.png")
	img.bMenu1=LoadImage("bMenu1.png")
	img.bMenu2=LoadImage("bMenu2.png")
	img.bPause1=LoadImage("bPause1.png")
	img.bPause2=LoadImage("bPause2.png")
	img.bRestart1=LoadImage("bRestart1.png")
	img.bRestart2=LoadImage("bRestart2.png")
	img.bBlank1=LoadImage("bBlank1.png")
	img.bBlank2=LoadImage("bBlank2.png")
	img.bArtifacts1=LoadImage("bArtifacts1.png")
	img.bArtifacts2=LoadImage("bArtifacts2.png")
	img.bTwitter1=LoadImage("bTwitter1.png")
	img.bTwitter2=LoadImage("bTwitter2.png")
	img.bFB1=LoadImage("bFB1.png")
	img.bFB2=LoadImage("bFB2.png")
	img.bRate1=LoadImage("bRate1.png")
	img.bRate2=LoadImage("bRate2.png")
	img.bSkip1=LoadImage("bSkip1.png")
	img.bSkip2=LoadImage("bSkip2.png")
	img.bUnlock1=LoadImage("bUnlock1.png")
	img.bUnlock2=LoadImage("bUnlock2.png")
	img.bRestore1=LoadImage("bRestore1.png")
	img.bRestore2=LoadImage("bRestore2.png")
	
	img.lbase1=LoadImage("lbase1.png")
	img.lbase2=LoadImage("lbase2.png")
	img.lever=LoadImage("lever.png")
	
	img.click=LoadImage("click.png")
	img.point=LoadImage("point.png")
	img.timetrial=LoadImage("timetrial.png")
	img.notify=LoadImage("notify.png")
	
	
	img.laserblock=LoadImage("LaserBlock.png")
	img.laserbeam1=LoadImage("LaserBeam1.png")
	img.laserbeam2=LoadImage("LaserBeam2.png")
	img.flare=LoadImage("flare.png")
	img.sunburst=LoadImage("sunburst.png")
	img.rain=LoadImage("rain.png")
	img.fan=LoadImage("fan.png")
	//printn("finished loading images")
	`img.player=LoadImage("player.png")
	`img.spike=LoadImage("spike.png")
return





loadsfx:
	//printn("soundtrack.ogg")
	sfx.soundtrack=LoadMusicOGG("soundtrack.ogg")
	//printn("bop.wav")
	sfx.bop=LoadSound("sfx/bop.wav")
	sfx.click2=LoadSound("sfx/click2.wav")
	sfx.click=LoadSound("sfx/click.wav")
	sfx.explode=LoadSound("sfx/explode.wav")
	sfx.whoosh=LoadSound("sfx/whoosh.wav")
	sfx.beeping=LoadSound("sfx/beeping.wav")
	sfx.sparkly=LoadSound("sfx/sparkly.wav")
	//printn("boom.wav")
	sfx.boom=LoadSound("sfx/boom.wav")
	sfx.hit=LoadSound("sfx/hit.wav")
	sfx.raining=LoadSound("sfx/rain.wav")
	sfx.ambient=LoadSound("sfx/ambient.wav")
	//printn("growl.wav")
	sfx.growl=LoadSound("sfx/growl.wav")
	sfx.achieve=LoadSound("sfx/achieve.wav")
	//printn("finished loading sfx")
return
