/*
function InitTrials()
	if timeTrialOn and maxLevel>(round(currentLevel/15)*15)+14 and currentLevel<>0
		ttrial.time=timer()
		ttrial.maxtime=100 //time to complete the level
		
		
		ttrial.spriteID=CreateSprite(0)
		SetSpriteSize(ttrial.spriteID,sbW,0.75)
		SetSpriteDepth(ttrial.spriteID,1)
		FixSpriteToScreen(ttrial.spriteID,1)
		SetSpritePosition(ttrial.spriteID,sbL,sbT)
		
		ttrial.state=0
		player.state=21
	else
		ttrial.state=0
		ttrial.spriteID=0
		timeTrialOn=0
	endif
endfunction

function DoTrials()
	if timeTrialOn
		if ttrial.state=0
			player.state=21
			SetSpriteScissor(ttrial.spriteID,sbL,sbT,sbL+(sbW*((timer()-ttrial.time)/ttrial.maxtime)),sbT+0.75)
			if (timer()-ttrial.time)+2>ttrial.maxtime
				PlaySound(sfx.beeping)
				ttrial.state=1
			endif
		elseif ttrial.state=1
			SetSpriteScissor(ttrial.spriteID,sbL,sbT,sbL+(sbW*((timer()-ttrial.time)/ttrial.maxtime)),sbT+0.75)
			if (timer()-ttrial.time)>ttrial.maxtime
				ttrial.state=2
			endif
		elseif ttrial.state=2
			DeleteSprite(ttrial.spriteID)
			player.dead=1
			player.state=0
			ttrial.state=3
		endif
	endif
endfunction

*/
