----------------------------------------------------------------------------------
-- F_ISH
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

----------------------------------------------------------------------------------
local blanki, blanks, blankh, i, s, h ,f , correct, pindah, fish
local soal = 0

function scene:createScene( event )
	local screenGroup = self.view

	bgr = display.newRect( _FX/2, _FY/2, _FX*1.2, _FY )
	bgr:setFillColor (1, 204/255, 0)
	screenGroup:insert( bgr )
	
	soal=0

	fish = display.newImageRect("hewan/fish.png",160,120)
	fish.x = _FX*.8; fish.y=_FY/2

	f = display.newImageRect("huruf/f.png",55,55); f.x = h2 f.y=_Y
	blanki = display.newImageRect("huruf/blank.png",55,55) ;blanki.x = h3 blanki.y=_Y
	blanks = display.newImageRect("huruf/blank.png",55,55); blanks.x = h4 blanks.y=_Y
	blankh = display.newImageRect("huruf/blank.png",55,55); blankh.x = h5 blankh.y=_Y
	
	i = display.newImageRect("huruf/i.png",55,55) i.x = math.random(10,_FX-10) i.y=math.random(10,_FY-10) i.rotation=math.random(-40,40)
	s = display.newImageRect("huruf/s.png",55,55) s.x = math.random(10,_FX-10) s.y=math.random(10,_FY-10) s.rotation=math.random(-40,40)
	h = display.newImageRect("huruf/h.png",55,55) h.x = math.random(10,_FX-10) h.y=math.random(10,_FY-10) h.rotation=math.random(-40,40)


	correct = display.newImage("huruf/correct.png")
	correct.x = _FX + 200 correct.y = _FY + 200; correct.alpha = 0
	correct.anchorX = .5
	correct.anchorY = .7
	
	screenGroup:insert( fish )
	screenGroup:insert( blanki )
	screenGroup:insert( blanks )
	screenGroup:insert( blankh )
	screenGroup:insert( f )
	screenGroup:insert( i )
	screenGroup:insert( s )
	screenGroup:insert( h )
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

	storyboard.purgeScene( "2dog" )
	local group = self.view
	
	local function pindah(e)
		storyboard.gotoScene( "4bee", "slideDown", 500  )
	end
	
	local function final()
		transition.to(correct, {time=1000, x = _FX, y=_FY, 
				transition = easing.outExpo, onComplete=pindah})
	end

	------I--------------------------------------	

	function i:touch( event )
		if event.phase == "began" and klik == 0 then 
		
			self.markX = self.x    -- store x location of object
			self.markY = self.y    -- store y location of object
		
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
			--print ("ended")
			if self.x < blanki.x +25 and self.x > blanki.x -25 
			and self.y < blanki.y +25 and self.y > blanki.y -25
				then
				audio.play(done)
				i:removeEventListener( "touch", i )
				transition.to(self, {time=1000, x = blanki.x, y=blanki.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 3 
					then final()
				end
			end
			
		end
		return true
	end
	 
	 
	 ------S--------------------------------------
	 
	function s:touch( event )
		if event.phase == "began" and klik == 0 then 
		
			self.markX = self.x    -- store x location of object
			self.markY = self.y    -- store y location of object
		
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
			if self.x < blanks.x +25 and self.x > blanks.x -25 
			and self.y < blanks.y +25 and self.y > blanks.y -25
				then
				audio.play(done)
				s:removeEventListener( "touch", s )
				transition.to(self, {time=1000, x = blanks.x, y=blanks.y, rotation = 0, 
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
	 
	function h:touch( event )
		if event.phase == "began" and klik == 0 then 
		
			self.markX = self.x    -- store x location of object
			self.markY = self.y    -- store y location of object
		
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
			--print ("ended")
			if self.x < blankh.x +25 and self.x > blankh.x -25 
			and self.y < blankh.y +25 and self.y > blankh.y -25
				then 
				audio.play(done)
				h:removeEventListener( "touch", h )
				transition.to(self, {time=1000, x = blankh.x, y=blankh.y, rotation = 0, 
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
	

	

	i:addEventListener( "touch", i )
	s:addEventListener( "touch", s )
	h:addEventListener( "touch", h )
	

	end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	i:removeEventListener( "touch", i )
	s:removeEventListener( "touch", s )
	h:removeEventListener( "touch", h )
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