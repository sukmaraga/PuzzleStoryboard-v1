----------------------------------------------------------------------------------
-- CR A B
-- 23 4 5
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

----------------------------------------------------------------------------------
local blank2, blank1, blank3, xc, xr, xa, xb , correct, pindah, crab
local soal = 0

function scene:createScene( event )
	local screenGroup = self.view

	bgr = display.newRect( _FX/2, _FY/2, _FX*1.2, _FY )
	bgr:setFillColor (1, 204/255, 0)
	screenGroup:insert( bgr )
	
	soal=0

	crab = display.newImageRect("hewan/crab.png",197,101)
	crab.x = _FX*.8; crab.y=_FY/2

	xa = display.newImageRect("huruf/a.png",55,55); xa.x = h4 xa.y=_Y
	blank1 = display.newImageRect("huruf/blank.png",55,55) ;blank1.x = h2 blank1.y=_Y
	blank2 = display.newImageRect("huruf/blank.png",55,55); blank2.x = h3 blank2.y=_Y
	blank3 = display.newImageRect("huruf/blank.png",55,55); blank3.x = h5 blank3.y=_Y
	
	xc = display.newImageRect("huruf/c.png",55,55) xc.x = math.random(10,_FX-10) xc.y=math.random(10,_FY-10) xc.rotation=math.random(-40,40)
	xr = display.newImageRect("huruf/r.png",55,55) xr.x = math.random(10,_FX-10) xr.y=math.random(10,_FY-10) xr.rotation=math.random(-40,40)
	xb = display.newImageRect("huruf/b.png",55,55) xb.x = math.random(10,_FX-10) xb.y=math.random(10,_FY-10) xb.rotation=math.random(-40,40)


	correct = display.newImage("huruf/correct.png")
	correct.x = _FX + 200 correct.y = _FY + 200; correct.alpha = 0
	correct.anchorX = .5
	correct.anchorY = .7
	
	screenGroup:insert( crab )
	screenGroup:insert( blank1 )
	screenGroup:insert( blank2 )
	screenGroup:insert( blank3 )
	screenGroup:insert( xa )
	screenGroup:insert( xc )
	screenGroup:insert( xb )
	screenGroup:insert( xr )
	screenGroup:insert( correct )

end
	

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	storyboard.purgeScene( "6cat" )
	
	local function pindah(e)
		storyboard.gotoScene( "8frog", "slideDown", 500  )
	end
	
	local klik = 0
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
	
	local group = self.view
	

	
	local function final()
		transition.to(correct, {time=1000, x = _FX, y=_FY, 
				transition = easing.outExpo, onComplete=pindah})
	end

	---HURUF--------------------------------------	

	function xc:touch( event )
		if event.phase == "began" and klik == 0 then
		
			self.markX = self.x    -- store x locrabion of object
			self.markY = self.y    -- store y locrabion of object
		
		elseif event.phase == "moved" and klik == 0 then
			self:toFront()
				 local x = (event.x - event.xStart) + self.markX
				 local y = (event.y - event.yStart) + self.markY
				 
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
			--print (".xc. ended")
			if self.x < blank1.x +25 and self.x > blank1.x -25 
			and self.y < blank1.y +25 and self.y > blank1.y -25
				then
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank1.x, y=blank1.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 3 
					then final()
				end
			end
			
		end
		return true
	end
	 
	 
	 --HURUF--------------------------------------
	 
	function xr:touch( event )
		if event.phase == "began"  and klik == 0 then 
		
			self.markX = self.x    -- store x locrabion of object
			self.markY = self.y    -- store y locrabion of object
		
		elseif event.phase == "moved"  and klik == 0 then
			self:toFront()
				 local x = (event.x - event.xStart) + self.markX
				 local y = (event.y - event.yStart) + self.markY
				 
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
			if self.x < blank2.x +25 and self.x > blank2.x -25 
			and self.y < blank2.y +25 and self.y > blank2.y -25
				then
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank2.x, y=blank2.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 3 
					then final()
				end
			end
		end    
		
		return true
	end
	
	
		 ------H--------------------------------------
	 
	function xb:touch( event )
		if event.phase == "began"  and klik == 0 then
		
			self.markX = self.x    -- store x locrabion of object
			self.markY = self.y    -- store y locrabion of object
		
		elseif event.phase == "moved"  and klik == 0 then
			self:toFront()
				 local x = (event.x - event.xStart) + self.markX
				 local y = (event.y - event.yStart) + self.markY
				 
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
			if self.x < blank3.x +25 and self.x > blank3.x -25 
			and self.y < blank3.y +25 and self.y > blank3.y -25
				then 
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank3.x, y=blank3.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 3 
					then --print("fnall!")
					final()
				end
			end
			
		end    
		
		return true
	end
	

	
	Runtime:addEventListener( "touch", moved )
	xc:addEventListener( "touch", xc )
	xr:addEventListener( "touch", xr )
	xb:addEventListener( "touch", xb )
	

	end


-- Called when scene is about to move offscreen:
function scene:exrtScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	xc:removeEventListener( "touch", xc )
	xr:removeEventListener( "touch", xr )
	xb:removeEventListener( "touch", xb )
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

-- "createScene" event is dispatched if scene's view does not exrst
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exrtScene" event is dispatched before nexb scene's transition begins
scene:addEventListener( "exrtScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene