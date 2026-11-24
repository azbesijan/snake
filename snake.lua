-- title:   game title
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua
oben=1
unten=2
rechts=3
links=4

richtung = rechts

t=0
x=0
y=0

warnung = false

spielAktiv = true

apfelX=math.random(1,28)
apfelY=math.random(1,15)

punkte = 0

geschwindigkeit = 10

pause = false

-- map() remap callback in Lua receives (tile,x,y) and returns tile,flip,rotate.

function TIC()

	if btnp(0) then richtung = oben end
	if btnp(1) then richtung = unten end
	if btnp(2) then richtung = links end
	if btnp(3) then richtung = rechts end
	if btnp(4) then pause = not pause end

	cls(13)
	spr(0,8*x,8*y,14,1,0,0,1,1)

	spr(5,8*apfelX,8*apfelY,0,1,0,0,1,1)

	print("Punkte: "..punkte, 5, 125, 1)
	
	if spielAktiv==false then
    	print("GAME OVER!", 90, 70, 2)
	end

	if pause==true then
		print("PAUSE", 95, 55, 2, false, 3)
	end

	t=t+1
	
	if t%geschwindigkeit==0 and spielAktiv == true and pause == false then
		if richtung == oben then
			if y>0 then y=y-1 end
		
		elseif richtung == unten then
			if y<16 then y=y+1 end
		
		elseif richtung == rechts then
			if x<29 then x=x+1 end
		
		elseif richtung == links then
			if x>0 then x=x-1 end
		end
		
		if richtung==oben and y==0 then
    		spielAktiv=false

		elseif richtung==unten and y==16 then
    		spielAktiv=false

		elseif richtung==rechts and x==29 then
    		spielAktiv=false

		elseif richtung==links and x==0 then
    		spielAktiv=false
		end

		if x==apfelX and y==apfelY then
    		punkte = punkte + 1
			geschwindigkeit = geschwindigkeit - 1
			apfelX=math.random(1,28)
    		apfelY=math.random(1,15)
		end

		if pause == not pause then
			pause = true
		end
	end		
	
end

-- <TILES>
-- 000:5555555555555555552552555555555552555525552222555555555555555555
-- 001:eccccccccc888888caaaaaaaca888888cacccccccacc0ccccacc0ccccacc0ccc
-- 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
-- 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
-- 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
-- 005:0000000000006660002222000022220000222200002222000000000000000000
-- 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

