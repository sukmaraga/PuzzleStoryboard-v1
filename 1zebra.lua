----------------------------------------------------------------------------------
-- ZEBRA
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()


----------------------------------------------------------------------------------
local blankb, blankr, text2,z,e,b,r,a, correct, pindah, markX, markY,x,y, bgr
local z
local soal = 0
local p = "penis"


---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	tmrrz = system.getTimer()
	local screenGroup = self.view


	bgr = display.newRect( _FX/2, _FY/2, _FX*1.2, _FY )
	bgr:setFillColor (1, 204/255, 0)
	screenGroup:insert( bgr )
	
 	p = "pipi"
	soal = 0
	--print(soal)
	blankb = display.newImage("huruf/blank.png")
	blankb.x = _X blankb.y=_Y
	
	blankr = display.newImage("huruf/blank.png")
	blankr.x = _X + 60 blankr.y=_Y
	
	
	
	zebra = display.newImageRect("hewan/zebra.png", 191,151)
	zebra.x = _X zebra.y=_Y/2
	
	z = display.newImageRect("huruf/z.png",55,55)
	z.x = _X-(60*2) z.y=_Y
	
	e = display.newImageRect("huruf/e.png",55,55)
	e.x = _X-(60) e.y=_Y
	
	b = display.newImageRect("huruf/b.png",55,55)
	b.x = _FX/2+100 b.y=_FY/1.1 b.rotation=20
	
	bs = display.newImageRect("huruf/b.png",55,55)
	bs.x = _FX/2+100 bs.y=_FY/1.1 bs.alpha=.5 bs.rotation=20
	
	r = display.newImageRect("huruf/r.png",55,55)
	r.x = _FX*.1 r.y=_FY*.3 r.rotation=-20
	
	a = display.newImageRect("huruf/a.png",55,55)
	a.x = _X + (60*2) a.y=_Y

	correct = display.newImage("huruf/correct.png")
	correct.x = _FX + 200 correct.y = _FY + 200; correct.alpha = 0
	correct.anchorX = .5
	correct.anchorY = .7
	
	screenGroup:insert( blankb )
	screenGroup:insert( blankr )
	screenGroup:insert( zebra )
	screenGroup:insert( z )
	screenGroup:insert( e )
	screenGroup:insert( a )
	screenGroup:insert( r )
	screenGroup:insert( bs )
	screenGroup:insert( b )
	screenGroup:insert( correct )

end
	

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local klik = 0
	local tutor = 1
	local function moved (event)
		if event.phase == "began"
			then --print ("began global")
		elseif event.phase == "moved"
			then --print ("move global")
			--print (klik)
			klik = 1
		elseif event.phase == "ended"
			then --print ("buyar klik")
			klik = 0
		else --print("dddddd")
		end	
	end
	Runtime:addEventListener( "touch", moved )
	storyboard.purgeScene( "score" )

	function bss ()
		transition.to(bs, {time=2000, delay= 1000, x = blankb.x, y=blankb.y, rotation = 0, transition = easing.outExpo, onComplete=bss2})
	end
	
	function bss2 ()
		if tutor == 1 then
		bs.x = _FX/2+100 bs.y=_FY/1.1 bs.alpha=.5 bs.rotation=20
		bss ()
		end
	end
	
	bss()
	
	
	
	local function pindah(e)
		--zebra.x=0
		--print("zebffra")
		storyboard.gotoScene( true, "2dog", "slideDown", 500  )
		
	end
	
	local function final()
		--print ("zebra final")
		--audio.play(level)
		transition.to(correct, {time=1000, x = _FX, y=_FY, 
				transition = easing.outExpo, onComplete=pindah})
	end
	
	
	
	function r:touch( event )
		if event.phase == "began" and klik == 0 then 
			--print(soal)
			 markX = self.x    -- store x location of object
			 markY = self.y    -- store y location of object
		
		elseif event.phase == "moved" and klik == 0 then 
				tutor = 0
				bs.alpha = 0
				self:toFront()
				 x = (event.x - event.xStart) + markX
				 y = (event.y - event.yStart) + markY
				 
				if x > _FX then x = _FX
				end
				if x < 0 then x = 0
				end
				if y > _FY then y = _FY
				end
				if y < 0 then y = 0
				end
				
				self.x, self.y = x, y
		elseif event.phase == "ended" then 
			klik = 0
			--print ("ended")
			if self.x < blankr.x +25 and self.x > blankr.x -25 
			and self.y < blankr.y +25 and self.y > blankr.y -25
				then --print ("ended22")
				audio.play(done)
				r:removeEventListener( "touch", r )
				transition.to(self, {time=1000, x = blankr.x, y=blankr.y, rotation = 0, 
				transition = easing.outExpo})
				--soal1=1
				soal = soal+1
				--print(soal)
				if soal == 2 
					then --print("fnallllll!")
					final()
				end
			end
			
		end
		return true
end
	 
	 
	function b:touch( event )
		if event.phase == "began" and klik == 0 then 
		
			 markX = self.x    -- store x location of object
			 markY = self.y    -- store y location of object
		
		elseif event.phase == "moved" and klik == 0 then 
			self:toFront()
			tutor = 0
			bs.alpha = 0
				 local x = (event.x - event.xStart) + markX
				 local y = (event.y - event.yStart) + markY
				 
				if x > _FX then x = _FX
				end
				if x < 0 then x = 0
				end
				if y > _FY then y = _FY
				end
				if y < 0 then y = 0
				end
			
			self.x, self.y = x, y    -- move object based on calculations above
		
		elseif event.phase == "ended" then 
			klik = 0
			--print ("ended")
			if self.x < blankb.x +25 and self.x > blankb.x -25 
			and self.y < blankb.y +25 and self.y > blankb.y -25
				then --print ("ended22") 
				audio.play(done)
				b:removeEventListener( "touch", b )
				transition.to(self, {time=1000, x = blankb.x, y=blankb.y, rotation = 0, 
				transition = easing.outExpo})
				--soal2=1
				soal = soal+1
				--print(soal)
				if soal == 2 
					then --print("fnall!")
					final()
				end
			end
			
		end    
		
		return true
	end
	
	
	-- make 'myObject' listen for touch events
	r:addEventListener( "touch", r )
	b:addEventListener( "touch", b )
--]]	
	end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene