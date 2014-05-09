----------------------------------------------------------------------------------
-- DOG
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

----------------------------------------------------------------------------------
local blankd, blanko, blankg,d,o,g, correct, pindah, dog,markX,markY,x,y
local soal = 0

function scene:createScene( event )
	local screenGroup = self.view

	bgr = display.newRect( _FX/2, _FY/2, _FX*1.2, _FY )
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
	correct.x = _FX + 200 correct.y = _FY + 200; correct.alpha = 0
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
	Runtime:addEventListener( "touch", moved )

	storyboard.purgeScene( "1zebra" )
	--local group = self.view
	
	local function pindah(e)
		storyboard.gotoScene( true, "3fish", "slideDown", 500  )
	end
	
	local function final()
		transition.to(correct, {time=1000, x = _FX, y=_FY, 
				transition = easing.outExpo, onComplete=pindah})
	end

	------D--------------------------------------	

	function d:touch( event )
		if event.phase == "began" and klik == 0 then 
		
			self.markX = self.x    -- store x location of object
			self.markY = self.y    -- store y location of object
		
		elseif event.phase == "moved" and klik == 0 then 
			self:toFront()
			x = (event.x - event.xStart) + self.markX
			y = (event.y - event.yStart) + self.markY
							 
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
			klik =0
			--print ("ended")
			if self.x < blankd.x +25 and self.x > blankd.x -25 
			and self.y < blankd.y +25 and self.y > blankd.y -25
				then
				audio.play(done)
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
		if event.phase == "began" and klik == 0 then 
		
			markX = self.x    -- store x location of object
			markY = self.y    -- store y location of object
		
		elseif event.phase == "moved" and klik == 0 then 
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
			self.x, self.y = x, y    -- move object based on calculations above
		
		elseif event.phase == "ended" then 
			klik =0
			if self.x < blanko.x +25 and self.x > blanko.x -25 
			and self.y < blanko.y +25 and self.y > blanko.y -25
				then
				audio.play(done)
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
		if event.phase == "began" and klik == 0 then 
		
			markX = self.x    -- store x location of object
			markY = self.y    -- store y location of object
		
		elseif event.phase == "moved" and klik == 0 then 
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
			
			self.x, self.y = x, y    -- move object based on calculations above
		
		elseif event.phase == "ended" then 
			klik =0
			--print ("ended")
			if self.x < blankg.x +25 and self.x > blankg.x -25 
			and self.y < blankg.y +25 and self.y > blankg.y -25
				then 
				audio.play(done)
				g:removeEventListener( "touch", g )
				transition.to(self, {time=1000, x = blankg.x, y=blankg.y, rotation = 0, 
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
	
	

	d:addEventListener( "touch", d )
	o:addEventListener( "touch", o )
	g:addEventListener( "touch", g )
	

	end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	--local group = self.view
	
	-----------------------------------------------------------------------------
	d:removeEventListener( "touch", d )
	o:removeEventListener( "touch", o )
	g:removeEventListener( "touch", g )
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	--local group = self.view
	
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