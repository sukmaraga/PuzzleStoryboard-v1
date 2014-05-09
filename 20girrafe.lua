----------------------------------------------------------------------------------
-- g i r a f f e
-- 1 2 3 4 5 6 7
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

----------------------------------------------------------------------------------
local blank2, blank1, blank3,blank4, blank5, blank6, xg, xi, xe, xa , xf, correct, pindah, girrafe
local soal = 0

function scene:createScene( event )
	local screenGroup = self.view

	bgr = display.newRect( _FX/2, _FY/2, _FX*1.2, _FY )
	bgr:setFillColor (1, 204/255, 0)
	screenGroup:insert( bgr )
	
	soal=0

	girrafe = display.newImageRect("hewan/girrafe.png",230,281)
	girrafe.x = _FX*.8; girrafe.y=_FY/4

	f = display.newImageRect("huruf/f.png",55,55) ;f.x = h5 f.y=_Y
	blank1 = display.newImageRect("huruf/blank.png",55,55) ;blank1.x = h1 blank1.y=_Y
	blank2 = display.newImageRect("huruf/blank.png",55,55); blank2.x = h2 blank2.y=_Y
	blank3 = display.newImageRect("huruf/blank.png",55,55); blank3.x = h3 blank3.y=_Y
	blank4 = display.newImageRect("huruf/blank.png",55,55); blank4.x = h4 blank4.y=_Y
	blank5 = display.newImageRect("huruf/blank.png",55,55); blank5.x = h6 blank5.y=_Y
	blank6 = display.newImageRect("huruf/blank.png",55,55); blank6.x = h7 blank6.y=_Y
	
	xg = display.newImageRect("huruf/g.png",55,55) xg.x = math.random(10,_FX-10) xg.y=math.random(10,_FY-10) xg.rotation=math.random(-40,40)
	xi = display.newImageRect("huruf/i.png",55,55) xi.x = math.random(10,_FX-10) xi.y=math.random(10,_FY-10) xi.rotation=math.random(-40,40)
	xr = display.newImageRect("huruf/r.png",55,55) xr.x = math.random(10,_FX-10) xr.y=math.random(10,_FY-10) xr.rotation=math.random(-40,40)
	xa = display.newImageRect("huruf/a.png",55,55) xa.x = math.random(10,_FX-10) xa.y=math.random(10,_FY-10) xa.rotation=math.random(-40,40)
	xf = display.newImageRect("huruf/f.png",55,55) xf.x = math.random(10,_FX-10) xf.y=math.random(10,_FY-10) xf.rotation=math.random(-40,40)
	xe = display.newImageRect("huruf/e.png",55,55) xe.x = math.random(10,_FX-10) xe.y=math.random(10,_FY-10) xe.rotation=math.random(-40,40)
	


	correct = display.newImage("huruf/correct.png")
	correct.x = _FX + 200 correct.y = _FY + 200; correct.alpha = 0
	correct.anchorX = .5
	correct.anchorY = .7
	
	screenGroup:insert( girrafe )
	screenGroup:insert( blank1 )
	screenGroup:insert( blank2 )
	screenGroup:insert( blank3 )
	screenGroup:insert( blank4 )
	screenGroup:insert( blank5 )
	screenGroup:insert( blank6 )
	screenGroup:insert( f )
	screenGroup:insert( xr )
	screenGroup:insert( xg )
	screenGroup:insert( xa )
	screenGroup:insert( xi )
	screenGroup:insert( xf )
	screenGroup:insert( xe )
	screenGroup:insert( correct )
	

end
	

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	storyboard.purgeScene( "19spider" )
	
	local function pindah(e)
		storyboard.gotoScene( "21monkey", "slideDown", 500  )
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

	function xg:touch( event )
		if event.phase == "began" and klik == 0 then
		
			self.markX = self.x    -- store x logirrafeion of object
			self.markY = self.y    -- store y logirrafeion of object
		
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
			--print (".xg. ended")
			if self.x < blank1.x +25 and self.x > blank1.x -25 
			and self.y < blank1.y +25 and self.y > blank1.y -25
				then
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank1.x, y=blank1.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 6
					then final()
				end
			end
			
		end
		return true
	end
	 
	 
	 --HURUF--------------------------------------
	 
	function xi:touch( event )
		if event.phase == "began"  and klik == 0 then 
		
			self.markX = self.x    -- store x logirrafeion of object
			self.markY = self.y    -- store y logirrafeion of object
		
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
				if soal == 6
					then final()
				end
			end
		end    
		
		return true
	end
	
	
------H--------------------------------------
	 
	function xa:touch( event )
		if event.phase == "began"  and klik == 0 then
		
			self.markX = self.x    -- store x logirrafeion of object
			self.markY = self.y    -- store y logirrafeion of object
		
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
				if soal == 6
					then --print("fnall!")
					final()
				end
			end
			
		end    
		
		return true
	end
	
			 ------H--------------------------------------
	 
	function xe:touch( event )
		if event.phase == "began"  and klik == 0 then
		
			self.markX = self.x    -- store x logirrafeion of object
			self.markY = self.y    -- store y logirrafeion of object
		
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
			if self.x < blank6.x +25 and self.x > blank6.x -25 
			and self.y < blank6.y +25 and self.y > blank6.y -25
				then 
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank6.x, y=blank6.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 6
					then --print("fnall!")
					final()
				end
			end
			
		end    
		
		return true
	end
	
			 ------H--------------------------------------
	 
	function xf:touch( event )
		if event.phase == "began"  and klik == 0 then
		
			self.markX = self.x    -- store x logirrafeion of object
			self.markY = self.y    -- store y logirrafeion of object
		
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
			if self.x < blank5.x +25 and self.x > blank5.x -25 
			and self.y < blank5.y +25 and self.y > blank5.y -25
				then 
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank5.x, y=blank5.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 6
					then --print("fnall!")
					final()
				end
			end
			
		end    
		
		return true
	end
	
				 ------6th--------------------------------------
	 
	function xr:touch( event )
		if event.phase == "began"  and klik == 0 then
		
			self.markX = self.x    -- store x logirrafeion of object
			self.markY = self.y    -- store y logirrafeion of object
		
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
				if soal == 6
					then --print("fnall!")
					final()
				end
			end
			
		end    
		
		return true
	end
	
	Runtime:addEventListener( "touch", moved )
	xg:addEventListener( "touch", xg )
	xi:addEventListener( "touch", xi )
	xa:addEventListener( "touch", xa )
	xr:addEventListener( "touch", xr )
	xf:addEventListener( "touch", xf )
	xe:addEventListener( "touch", xe )
	

	end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	xg:removeEventListener( "touch", xg )
	xi:removeEventListener( "touch", xi )
	xr:removeEventListener( "touch", xr )
	xa:removeEventListener( "touch", xa )
	xf:removeEventListener( "touch", xf )
	xe:removeEventListener( "touch", xe )
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

-- "exitScene" event is dispatched before nexa scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or exilicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene