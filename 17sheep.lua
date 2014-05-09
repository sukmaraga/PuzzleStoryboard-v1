----------------------------------------------------------------------------------
-- sheep
-- 23456
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

----------------------------------------------------------------------------------
local blank2, blank1, blank3,blank4, blank5, xs, xh, xe1, xe2 , xp, correct, pindah, sheep
local soal = 0
local ee1=0
local ee2=0

function scene:createScene( event )
	local screenGroup = self.view

	bgr = display.newRect( _FX/2, _FY/2, _FX*1.2, _FY )
	bgr:setFillColor (1, 204/255, 0)
	screenGroup:insert( bgr )
	
	soal=0

	sheep = display.newImageRect("hewan/sheep.png",188,119)
	sheep.x = _FX*.8; sheep.y=_FY/3

	
	blank1 = display.newImageRect("huruf/blank.png",55,55) ;blank1.x = h2 blank1.y=_Y
	blank2 = display.newImageRect("huruf/blank.png",55,55); blank2.x = h3 blank2.y=_Y
	blank3 = display.newImageRect("huruf/blank.png",55,55); blank3.x = h4 blank3.y=_Y
	blank4 = display.newImageRect("huruf/blank.png",55,55); blank4.x = h5 blank4.y=_Y
	blank5 = display.newImageRect("huruf/blank.png",55,55); blank5.x = h6 blank5.y=_Y
	
	xs = display.newImageRect("huruf/s.png",55,55) xs.x = math.random(10,_FX-10) xs.y=math.random(10,_FY-10) xs.rotation=math.random(-40,40)
	xh = display.newImageRect("huruf/h.png",55,55) xh.x = math.random(10,_FX-10) xh.y=math.random(10,_FY-10) xh.rotation=math.random(-40,40)
	xe1 = display.newImageRect("huruf/e.png",55,55) xe1.x = math.random(10,_FX-10) xe1.y=math.random(10,_FY-10) xe1.rotation=math.random(-40,40)
	xe2 = display.newImageRect("huruf/e.png",55,55) xe2.x = math.random(10,_FX-10) xe2.y=math.random(10,_FY-10) xe2.rotation=math.random(-40,40)
	xp = display.newImageRect("huruf/p.png",55,55) xp.x = math.random(10,_FX-10) xp.y=math.random(10,_FY-10) xp.rotation=math.random(-40,40)
	


	correct = display.newImage("huruf/correct.png")
	correct.x = _FX + 200 correct.y = _FY + 200; correct.alpha = 0
	correct.anchorX = .5
	correct.anchorY = .7
	
	screenGroup:insert( sheep )
	screenGroup:insert( blank1 )
	screenGroup:insert( blank2 )
	screenGroup:insert( blank3 )
	screenGroup:insert( blank4 )
	screenGroup:insert( blank5 )
	screenGroup:insert( xe1 )
	screenGroup:insert( xs )
	screenGroup:insert( xe2 )
	screenGroup:insert( xh )
	screenGroup:insert( xp )
	screenGroup:insert( correct )

end
	

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	storyboard.purgeScene( "16camel" )
	
	local function pindah(e)
		storyboard.gotoScene( "18snake", "slideDown", 500  )
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
		ee1 = 0
		ee2 = 0
		transition.to(correct, {time=1000, x = _FX, y=_FY, 
				transition = easing.outExpo, onComplete=pindah})
	end

	---HURUF--------------------------------------	

	function xs:touch( event )
		if event.phase == "began" and klik == 0 then
		
			self.markX = self.x    -- store x losheepion of object
			self.markY = self.y    -- store y losheepion of object
		
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
			--print (".xs. ended")
			if self.x < blank1.x +25 and self.x > blank1.x -25 
			and self.y < blank1.y +25 and self.y > blank1.y -25
				then
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank1.x, y=blank1.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 5
					then final()
				end
			end
			
		end
		return true
	end
	 
	 
	 --HURUF--------------------------------------
	 
	function xh:touch( event )
		if event.phase == "began"  and klik == 0 then 
		
			self.markX = self.x    -- store x losheepion of object
			self.markY = self.y    -- store y losheepion of object
		
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
				if soal == 5
					then final()
				end
			end
		end    
		
		return true
	end
	
	
		 ------H--------------------------------------
	 
	function xe2:touch( event )
		if event.phase == "began"  and klik == 0 then
		
			self.markX = self.x    -- store x losheepion of object
			self.markY = self.y    -- store y losheepion of object
		
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
			and self.y < blank3.y +25 and self.y > blank3.y -25 and ee2 == 0
				then 
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank3.x, y=blank3.y, rotation = 0, 
				transition = easing.outExpo})
				ee2 = 1
				soal=soal+1
				if soal == 5
					then --print("fnall!")
					final()
				end
			end
			
			if self.x < blank4.x +25 and self.x > blank4.x -25 
			and self.y < blank4.y +25 and self.y > blank4.y -25 and ee1 == 0
				then 
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank4.x, y=blank4.y, rotation = 0, 
				transition = easing.outExpo})
				ee1 = 1
				soal=soal+1
				if soal == 5
					then --print("fnall!")
					final()
				end
			end
			
		end    
		
		return true
	end
	
			 ------H--------------------------------------
	 
	function xe1:touch( event )
		if event.phase == "began"  and klik == 0 then
		
			self.markX = self.x    -- store x losheepion of object
			self.markY = self.y    -- store y losheepion of object
		
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
			and self.y < blank3.y +25 and self.y > blank3.y -25 and ee2 == 0
				then 
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank3.x, y=blank3.y, rotation = 0, 
				transition = easing.outExpo})
				ee2 = 1
				soal=soal+1
				if soal == 5
					then --print("fnall!")
					final()
				end
			end
			if self.x < blank4.x +25 and self.x > blank4.x -25 
			and self.y < blank4.y +25 and self.y > blank4.y -25 and ee1 == 0
				then 
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blank4.x, y=blank4.y, rotation = 0, 
				transition = easing.outExpo})
				ee1 = 1
				soal=soal+1
				if soal == 5
					then --print("fnall!")
					final()
				end
			end
			
		end    
		
		return true
	end
	
			 ------H--------------------------------------
	 
	function xp:touch( event )
		if event.phase == "began"  and klik == 0 then
		
			self.markX = self.x    -- store x losheepion of object
			self.markY = self.y    -- store y losheepion of object
		
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
				if soal == 5
					then --print("fnall!")
					final()
				end
			end
			
		end    
		
		return true
	end
	
	Runtime:addEventListener( "touch", moved )
	xs:addEventListener( "touch", xs )
	xh:addEventListener( "touch", xh )
	xe2:addEventListener( "touch", xe2 )
	xe1:addEventListener( "touch", xe1 )
	xp:addEventListener( "touch", xp )
	

	end


-- Called when scene is about to move offscreen:
function scene:exhtScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	xs:removeEventListener( "touch", xs )
	xh:removeEventListener( "touch", xh )
	xe2:removeEventListener( "touch", xe2 )
	xe1:removeEventListener( "touch", xe1 )
	xp:removeEventListener( "touch", xp )
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

-- "createScene" event is dispatched if scene's view does not exhst
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exhtScene" event is dispatched before nexe2 scene's transition begins
scene:addEventListener( "exhtScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene