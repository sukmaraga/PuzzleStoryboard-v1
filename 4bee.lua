----------------------------------------------------------------------------------
-- F_ISH
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

----------------------------------------------------------------------------------
local blankb, blanke, blanke2, b, e, e2  , correct, pindah, bee
local soal = 0
local ee1=0
local ee2=0

function scene:createScene( event )
	local screenGroup = self.view

	bgr = display.newRect( _FX/2, _FY/2, _FX*1.2, _FY )
	bgr:setFillColor (1, 204/255, 0)
	screenGroup:insert( bgr )
	
	soal=0

	bee = display.newImageRect("hewan/bee.png",144,151)
	bee.x = _FX*.8; bee.y=_FY/2

	blankb = display.newImageRect("huruf/blank.png",55,55) ;blankb.x = h3 blankb.y=_Y
	blanke = display.newImageRect("huruf/blank.png",55,55); blanke.x = h4 blanke.y=_Y
	blanke2 = display.newImageRect("huruf/blank.png",55,55); blanke2.x = h5 blanke2.y=_Y
	
	b = display.newImageRect("huruf/b.png",55,55) b.x = math.random(10,_FX-10) b.y=math.random(10,_FY-10) b.rotation=math.random(-40,40)
	e = display.newImageRect("huruf/e.png",55,55) e.x = math.random(10,_FX-10) e.y=math.random(10,_FY-10) e.rotation=math.random(-40,40)
	e2 = display.newImageRect("huruf/e.png",55,55) e2.x = math.random(10,_FX-10) e2.y=math.random(10,_FY-10) e2.rotation=math.random(-40,40)


	correct = display.newImage("huruf/correct.png")
	correct.x = _FX + 200 correct.y = _FY + 200; correct.alpha = 0
	correct.anchorX = .5
	correct.anchorY = .7
	
	screenGroup:insert( bee )
	screenGroup:insert( blankb )
	screenGroup:insert( blanke )
	screenGroup:insert( blanke2 )
	screenGroup:insert( b )
	screenGroup:insert( e )
	screenGroup:insert( e2 )
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

	storyboard.purgeScene( "3fish" )
	local group = self.view
	
	local function pindah(e)
		storyboard.gotoScene( "5bird", "slideDown", 500  )
	end
	
	local function final()
		ee1 = 0
		ee2 = 0
		transition.to(correct, {time=1000, x = _FX, y=_FY, 
				transition = easing.outExpo, onComplete=pindah})
	end

	------I--------------------------------------	

	function b:touch( event )
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
			--print ("ended")
			if self.x < blankb.x +25 and self.x > blankb.x -25 
			and self.y < blankb.y +25 and self.y > blankb.y -25
				then
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blankb.x, y=blankb.y, rotation = 0, 
				transition = easing.outExpo})
				soal=soal+1
				if soal == 3 
					then final()
				end
			end
			
		end
		return true
	end
	 
	 
	 ------E--------------------------------------
	 
	function e:touch( event )
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
			if self.x < blanke.x +25 and self.x > blanke.x -25 
			and self.y < blanke.y +25 and self.y > blanke.y -25 and ee1 == 0
				then
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blanke.x, y=blanke.y, rotation = 0, 
				transition = easing.outExpo})
				ee1 = 1
				soal=soal+1
				if soal == 3 
					then final()
				end
			end
			
			if self.x < blanke2.x +25 and self.x > blanke2.x -25 
			and self.y < blanke2.y +25 and self.y > blanke2.y -25 and ee2 == 0
				then
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blanke2.x, y=blanke2.y, rotation = 0, 
				transition = easing.outExpo})
				ee2 = 1
				soal=soal+1
				if soal == 3 
					then final()
				end
			end
		end    
		
		return true
	end
	
	
		 ------H--------------------------------------
	 
	function e2:touch( event )
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
			klik =0
			if self.x < blanke.x +25 and self.x > blanke.x -25 
			and self.y < blanke.y +25 and self.y > blanke.y -25 and ee1 == 0
				then
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blanke.x, y=blanke.y, rotation = 0, 
				transition = easing.outExpo})
				ee1 = 1
				soal=soal+1
				if soal == 3 
					then final()
				end
			end
			
			if self.x < blanke2.x +25 and self.x > blanke2.x -25 
			and self.y < blanke2.y +25 and self.y > blanke2.y -25 and ee2 == 0
				then
				audio.play(done) ; self:removeEventListener( "touch", self )
				transition.to(self, {time=1000, x = blanke2.x, y=blanke2.y, rotation = 0, 
				transition = easing.outExpo})
				ee2 = 1
				soal=soal+1
				if soal == 3 
					then final()
				end
			end
		end         
		
		return true
	end
	

	

	b:addEventListener( "touch", b )
	e:addEventListener( "touch", e )
	e2:addEventListener( "touch", e2 )
	

	end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	b:removeEventListener( "touch", b )
	e:removeEventListener( "touch", e )
	e2:removeEventListener( "touch", e2 )
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