function MakeButton(x,y,xs,ys,i1,i2)
    for k=1 to 199
        if buts[k].e=0
            i=k
            exit
        endif
    next
    buts[i].id=CreateSprite(i1)
    SetSpritePosition(buts[i].id,x,y)
    SetSpriteSize(buts[i].id,xs,ys)
    SetSpriteDepth(buts[i].id,2)
    FixSpriteToScreen(buts[i].id,1)
    buts[i].i1=i1
    buts[i].i2=i2
    //buts[i].tid=CreateText(s$)
    //SetTextAlignment(buts[i].tid,1)
    //SetTextPosition(buts[i].tid,x+(xs)/2,y-9)
    //SetTextSize(buts[i].tid,8)
    //SetTextSpacing(buts[i].tid,1)
    buts[i].e=1
    buts[i].textAlpha=0
    buts[i].a=1
    buts[i].s=0
endfunction i

function MakeButton2(x,y,xs,ys,s$)
    for k=1 to 199
        if buts[k].e=0
            i=k
            exit
        endif
    next
    
    buts[i].id=CreateSprite(img.bBlank1)
    SetSpritePosition(buts[i].id,x,y)
    SetSpriteSize(buts[i].id,xs,ys)
    SetSpriteDepth(buts[i].id,2)
    FixSpriteToScreen(buts[i].id,1)
    buts[i].i1=img.bBlank1
    buts[i].i2=img.bBlank1
    buts[i].tid=CreateText(s$)
    SetTextAlignment(buts[i].tid,1)
    SetTextPosition(buts[i].tid,x+(xs/2),y+3)
    SetTextSize(buts[i].tid,9)
    SetTextSpacing(buts[i].tid,0)
    SetTextDepth(buts[i].tid,2)
    SetTextFont(buts[i].tid,gravityFONTb)
    SetTextColor(buts[i].tid,185,220,20,255)
    buts[i].e=1
    buts[i].textAlpha=0
    buts[i].a=1
    buts[i].s=0
endfunction i

function MakeTendrils(x as float,y as float,max as float,min as float, bid, typ)
    for k=1 to 199
        if tens[k].e=0
            i=k
            exit
        endif
    next
    tens[i].e = 1
    tens[i].size = min
    tens[i].tsize = min
    tens[i].max=max
    tens[i].min=min
    tens[i].x=x
    tens[i].y=y
    tens[i].bid=bid
    tens[i].typ=typ
    if typ=1
		tens[i].id=CreateSprite(img.tendrils)
		SetSpritePositionByCenter(tens[i].id,x,y)
		SetSpriteSize(tens[i].id,tens[i].size*1.5, (tens[i].size/2.666)*1.5)
		SetSpriteDepth(tens[i].id,4)
	elseif typ=2
		tens[i].id=CreateSprite(img.tendrilsbox)
		SetSpritePositionByCenter(tens[i].id,x,y)
		SetSpriteSize(tens[i].id,tens[i].size*1.5, (tens[i].size/1.25)*1.5)
		SetSpriteDepth(tens[i].id,4)
	else
		tens[i].id=CreateSprite(img.tendrils151)
		SetSpritePositionByCenter(tens[i].id,x,y)
		SetSpriteSize(tens[i].id,tens[i].size*1.5, tens[i].size)
		SetSpriteDepth(tens[i].id,4)
	endif
    FixSpriteToScreen(tens[i].id,1)
endfunction i



function DeleteButton(i)
    if buts[i].e=1
        buts[i].e=0
        buts[i].a=0
        DeleteSprite(buts[i].id)
        if GetTextExists(buts[i].tid) then DeleteText(buts[i].tid)
        buts[i].i1=0
        buts[i].id=0
        buts[i].i2=0
        buts[i].id=0
        buts[i].s=0
        buts[i].sounding=0
        buts[i].tid=0
    endif
endfunction

function DeleteTendril(i)
    if tens[i].e=1
        tens[i].x=0
        tens[i].y=0
        tens[i].size=0
        tens[i].tsize=0
        DeleteSprite(tens[i].id)
        tens[i].id=0
        tens[i].e=0
    endif
endfunction



function DeleteAllButtons()
    for i=1 to 199
        DeleteButton(i)
    next
endfunction

function DeleteArtifacts()
	for k=1 to 20
		if GetSpriteExists(arti[cArti].id) then DeleteSprite(arti[cArti].id)
		arti[cArti].id=0
		arti[cArti].pos.x=0
		arti[cArti].pos.y=0
		arti[cArti].scale=0
	next
endfunction

function DeleteAllTendrils()
    for i=1 to 199
        DeleteTendril(i)
    next
endfunction

function State(i)
    s=buts[i].s
endfunction s


function DoButtons()
    for k=1 to 199
        if buts[k].e=1
			if buts[k].a=1 or buts[k].a=3
				if buts[k].s=-1 //cancel one frame (for cancelling tendrils on select lvl scrn)
					buts[k].s=0
				else
					if p.s=1
						if GetSpriteHitTest(buts[k].id,p.wx,p.wy)
							
							if GetTextExists(buts[k].tid)
								if buts[k].a=1 then SetTextColor(buts[k].tid,255,255,255,255)
							else
								SetSpriteImage(buts[k].id,buts[k].i2)
							endif
							
							
							if buts[k].s=0 //pressed
								PlaySound(sfx.click2)
							endif
							
							buts[k].s=1
							if p.r //and timer()-timeOfLastButton>0.1
								buts[k].s=2
								PlaySound(sfx.click)
							endif
						else
							buts[k].s=0
							if GetTextExists(buts[k].tid)
								if buts[k].a=1 then SetTextColor(buts[k].tid,185,220,20,255)
							else
								SetSpriteImage(buts[k].id,buts[k].i1)
							endif
						endif
					else
						buts[k].s=0
						if GetTextExists(buts[k].tid)
							if buts[k].a=1 then SetTextColor(buts[k].tid,185,220,20,255)
						else
							SetSpriteImage(buts[k].id,buts[k].i1)
						endif
					endif
				endif
			elseif buts[k].a=0
				buts[k].s=0
				if GetTextExists(buts[k].tid)
					SetTextColor(buts[k].tid,185,220,20,255)
				else
					SetSpriteImage(buts[k].id,buts[k].i1)
				endif
			elseif buts[k].a=2 //manually update
				buts[k].s=0
			endif
        endif
    next
endfunction

function DoTendrils()
    for k=1 to 199
        if tens[k].e=1
			if buts[tens[k].bid].s=1
				tens[k].tsize=tens[k].max
			else
				tens[k].tsize=tens[k].min
			endif
			if tens[k].typ=1
				SetSpriteSize(tens[k].id,tens[k].size*1.5, (tens[k].size/2.666)*1.5)
			elseif tens[k].typ=2
				SetSpriteSize(tens[k].id,tens[k].size*1.5, (tens[k].size/1.25)*1.5)
			else
				SetSpriteSize(tens[k].id,tens[k].size*1.5, tens[k].size)
			endif
			if tens[k].size<tens[k].tsize then tens[k].size=tens[k].size+(tens[k].max/20)
			if tens[k].size>tens[k].tsize then tens[k].size=tens[k].size-(tens[k].max/20)
			SetSpritePositionByCenter(tens[k].id,tens[k].x, tens[k].y)
        endif
    next
endfunction


function DoTouch()
	/*
    if t_mode=_phone
        lastTouchCount=tCount
        tCount=GetRawTouchCount(1)

        if tCount<lastTouchCount
            p.r=1
        else
            p.r=0
        endif

        if tCount>lastTouchCount
            p.p=1
            p.t=timer()
            p.lx=GetRawTouchCurrentX(1)
            p.ly=GetRawTouchCurrentY(1)
            p.x=GetRawTouchCurrentX(1)
            p.y=GetRawTouchCurrentY(1)
        else
            p.p=0
        endif

        if p.r<>1
            p.lx=p.x
            p.ly=p.y
            p.x=GetRawTouchCurrentX(1)
            p.y=GetRawTouchCurrentY(1)
            p.wx=ScreenToWorldX(p.x)
            p.wy=ScreenToWorldY(p.y)
            p.s=1
            p.ox=GetRawTouchStartX(1)
            p.oy=GetRawTouchStartY(1)
        endif
        if tCount=0 and p.r=0 then p.s=0
        if p.x<>0 and p.ox=0 then p.ox=p.x
        if p.y<>0 and p.oy=0 then p.oy=p.y
    else
		*/
        p.p=GetPointerPressed()
        p.r=GetPointerReleased()
        if p.r<>1
            p.lx=p.x
            p.ly=p.y
            p.x=GetPointerX()
            p.y=GetPointerY()
            p.s=GetPointerState()
            p.wx=ScreenToWorldX(p.x)
            p.wy=ScreenToWorldY(p.y)
            c=1
        endif
        if p.p=1
            p.t=timer()
            p.ox=GetPointerX()
            p.x=GetPointerX()
            p.oy=GetPointerY()
            p.y=GetPointerY()
            p.wx=ScreenToWorldX(p.x)
            p.wy=ScreenToWorldY(p.y)
        endif
        if p.x<>0 and p.ox=0 then p.ox=p.x
        if p.y<>0 and p.oy=0 then p.oy=p.y
    //endif
    if p.s=0 then TouchBeenOff=0
endfunction

function ClearTouch()
    p.p=0
    p.r=0
    p.x=0
    p.y=0
    p.ox=0
    p.oy=0
    p.wx=0
    p.wy=0
    p.lx=0
    p.ly=0
    p.s=0
    tCount=0
    lastTouchCount=0
endfunction


