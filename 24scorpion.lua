----------------------------------------------------------------------------------
-- DOG
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

----------------------------------------------------------------------------------
local blankd, blanko, blankg,d,o,g, correct, pindah, dog
local soal = 0

function scene:createScene( event )
	screenGroup = self.view

	bgr = display.newRect( _X/2, _Y/2, 1500, 1800 )
	bgr:setFillColor (1, 204/255, 0)
	screenGroup:insert( bgr )
	
	soal=0

	dog = display.newImageRect("hewan/dog.png",188,143)
	dog.x = _FX*.8; dog.y=_FY/2

	blankd = display.newImageRect("huruf/blank.png",55,55) ;blankd.x = h2 blankd.y=_Y
	blanko = display.newImageRect("huruf/blank.png",55,55); blanko.x = h3 blanko.y=_Y
	blankg = display.newImageRect("huruf/blank.png",55,55); blankg.x = h4 blankg.y=_Y
	
	d = display.newImageRect("huruf/d.png",55,55) d.x = math.random(10,_FX-10) d.y=math.random(10,_FY-10) d.rotation=math.random(-40,40)
	o = display.newImageRect("huruf/o.png",55,55) o.x = math.random(10,_FX-10) o.y=math.random(10,_FY-10) o.rotation=math.random(-40,40)
	g = display.newImageRect("huruf/g.png",55,55) g.x = math.random(10,_FX-10) g.y=math.random(10,_FY-10) g.rotation=math.random(-40,40)


	correct = display.newImage("huruf/correct.png")
	correct.x = _FX + 200 correct.y = _FY + 200
	correct.anchorX = .5
	correct.anchorY = .7
	
	screenGroup:insert( dog )
	screenGroup:insert( blankd )
	screenGroup:insert( blanko )
	screenGroup:insert( blankg )
	screenGroup:insert( d )
	screenGroup:insert( o )
	screenGroup:insert( g )
	screenGroup:insert( correct )

end
	

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )


	storyboard.purgeScene( "1zebra" )
	local group = self.view
	
	local function pindah(e)
		storyboard.gotoScene( "1zebra", "fromRight", 400  )
	end
	
	local function final()
		transition.to(correct, {time=1000, x = _FX, y=_FY, 
				transition = easing.outExpo, onComplete=pindah})
	end

	------D--------------------------------------	

	function d:touch( event )
		if event.phase == "began" then
		
			self.markX = self.x    -- store x location of object
			self.markY = self.y    -- store y location of object
		
		elseif event.phase == "moved" then
			self:toFront()
			local x = (event.x - event.xStart) + self.markX
			local y = (event.y - event.yStart) + self.markY
			
			self.x, self.y = x, y    -- move object based on calculations above
		
		elseif event.phase == "ended" then 
			print ("ended")
			if self.x < blankd.x +10 and self.x > blankd.x -10 
			and self.y < blankd.y +10 and self.y > blankd.y -10
				then
				d:removeEventListener( "touch", d )
				transition.to(self, {time=1000, x = blankd.x, y=blankd.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 3 
					then final()
				end
			end
			
		end
		return true
	end
	 
	 
	 ------O--------------------------------------
	 
	function o:touch( event )
		if event.phase == "began" then
		
			self.markX = self.x    -- store x location of object
			self.markY = self.y    -- store y location of object
		
		elseif event.phase == "moved" then
			self:toFront()
			local x = (event.x - event.xStart) + self.markX
			local y = (event.y - event.yStart) + self.markY
			self.x, self.y = x, y    -- move object based on calculations above
		
		elseif event.phase == "ended" then 
			if self.x < blanko.x +10 and self.x > blanko.x -10 
			and self.y < blanko.y +10 and self.y > blanko.y -10
				then
				o:removeEventListener( "touch", o )
				transition.to(self, {time=1000, x = blanko.x, y=blanko.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 3 
					then final()
				end
			end
		end    
		
		return true
	end
	
	
		 ------G--------------------------------------
	 
	function g:touch( event )
		if event.phase == "began" then
		
			self.markX = self.x    -- store x location of object
			self.markY = self.y    -- store y location of object
		
		elseif event.phase == "moved" then
			self:toFront()
			local x = (event.x - event.xStart) + self.markX
			local y = (event.y - event.yStart) + self.markY
			
			self.x, self.y = x, y    -- move object based on calculations above
		
		elseif event.phase == "ended" then 
			print ("ended")
			if self.x < blankg.x +10 and self.x > blankg.x -10 
			and self.y < blankg.y +10 and self.y > blankg.y -10
				then 
				g:removeEventListener( "touch", g )
				transition.to(self, {time=1000, x = blankg.x, y=blankg.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 3 
					then print("fnall!")
					final()
				end
			end
			
		end    
		
		return true
	end
	
	

	d:addEventListener( "touch", d )
	o:addEventListener( "touch", o )
	g:addEventListener( "touch", g )
	

	end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	d:removeEventListener( "touch", d )
	o:removeEventListener( "touch", o )
	g:removeEventListener( "touch", g )
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