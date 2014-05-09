----------------------------------------------------------------------------------
-- FROG
-- 2345
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

----------------------------------------------------------------------------------
local blank2, blank1, blank3, xf, xr, xo, xg , correct, pindah, frog
local soal = 0

function scene:createScene( event )
	local screenGroup = self.view

	bgr = display.newRect( _FX/2, _FY/2, _FX*1.2, _FY )
	bgr:setFillColor (1, 204/255, 0)
	screenGroup:insert( bgr )
	
	soal=0

	frog = display.newImageRect("hewan/frog.png",188,124)
	frog.x = _FX*.8; frog.y=_FY/2

	
	blank1 = display.newImageRect("huruf/blank.png",55,55) ;blank1.x = h2 blank1.y=_Y
	blank2 = display.newImageRect("huruf/blank.png",55,55); blank2.x = h3 blank2.y=_Y
	blank3 = display.newImageRect("huruf/blank.png",55,55); blank3.x = h4 blank3.y=_Y
	blank4 = display.newImageRect("huruf/blank.png",55,55); blank4.x = h5 blank4.y=_Y
	
	xf = display.newImageRect("huruf/f.png",55,55) xf.x = math.random(10,_FX-10) xf.y=math.random(10,_FY-10) xf.rotation=math.random(-40,40)
	xr = display.newImageRect("huruf/r.png",55,55) xr.x = math.random(10,_FX-10) xr.y=math.random(10,_FY-10) xr.rotation=math.random(-40,40)
	xo = display.newImageRect("huruf/o.png",55,55) xo.x = math.random(10,_FX-10) xo.y=math.random(10,_FY-10) xo.rotation=math.random(-40,40)
	xg = display.newImageRect("huruf/g.png",55,55) xg.x = math.random(10,_FX-10) xg.y=math.random(10,_FY-10) xg.rotation=math.random(-40,40)
	


	correct = display.newImage("huruf/correct.png")
	correct.x = _FX + 200 correct.y = _FY + 200; correct.alpha = 0
	correct.anchorX = .5
	correct.anchorY = .7
	
	screenGroup:insert( frog )
	screenGroup:insert( blank1 )
	screenGroup:insert( blank2 )
	screenGroup:insert( blank3 )
	screenGroup:insert( blank4 )
	screenGroup:insert( xo )
	screenGroup:insert( xf )
	screenGroup:insert( xg )
	screenGroup:insert( xr )
	screenGroup:insert( correct )

end
	

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	storyboard.purgeScene( "7crab" )
	
	local function pindah(e)
		storyboard.gotoScene( "9pig", "slideDown", 500  )
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

	function xf:touch( event )
		if event.phase == "began" and klik == 0 then
		
			self.markX = self.x    -- store x lofrogion of object
			self.markY = self.y    -- store y lofrogion of object
		
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
			--print (".xf. ended")
			if self.x < blank1.x +25 and self.x > blank1.x -25 
			and self.y < blank1.y +25 and self.y > blank1.y -25
				then
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank1.x, y=blank1.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 4
					then final()
				end
			end
			
		end
		return true
	end
	 
	 
	 --HURUF--------------------------------------
	 
	function xr:touch( event )
		if event.phase == "began"  and klik == 0 then 
		
			self.markX = self.x    -- store x lofrogion of object
			self.markY = self.y    -- store y lofrogion of object
		
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
				if soal == 4
					then final()
				end
			end
		end    
		
		return true
	end
	
	
		 ------H--------------------------------------
	 
	function xg:touch( event )
		if event.phase == "began"  and klik == 0 then
		
			self.markX = self.x    -- store x lofrogion of object
			self.markY = self.y    -- store y lofrogion of object
		
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
			if self.x < blank4.x +25 and self.x > blank4.x -25 
			and self.y < blank4.y +25 and self.y > blank4.y -25
				then 
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank4.x, y=blank4.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 4
					then --print("fnall!")
					final()
				end
			end
			
		end    
		
		return true
	end
	
			 ------H--------------------------------------
	 
	function xo:touch( event )
		if event.phase == "began"  and klik == 0 then
		
			self.markX = self.x    -- store x lofrogion of object
			self.markY = self.y    -- store y lofrogion of object
		
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
				if soal == 4
					then --print("fnall!")
					final()
				end
			end
			
		end    
		
		return true
	end
	

	
	Runtime:addEventListener( "touch", moved )
	xf:addEventListener( "touch", xf )
	xr:addEventListener( "touch", xr )
	xg:addEventListener( "touch", xg )
	xo:addEventListener( "touch", xo )
	

	end


-- Called when scene is about to move offscreen:
function scene:exrtScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	xf:removeEventListener( "touch", xf )
	xr:removeEventListener( "touch", xr )
	xg:removeEventListener( "touch", xg )
	xo:removeEventListener( "touch", xo )
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

-- "exrtScene" event is dispatched before nexg scene's transition begins
scene:addEventListener( "exrtScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene