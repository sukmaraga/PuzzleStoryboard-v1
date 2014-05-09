----------------------------------------------------------------------------------
-- F_ISH
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

s1=(_FX/2)-140
s2=(_FX/2)-70
s3=_FX/2
s4=(_FX/2)+70
s5=(_FX/2)+140

----------------------------------------------------------------------------------


function  scene:createScene( event )
	local screenGroup = self.view

	bgr = display.newRect( _FX/2, _FY/2, _FX*1.2, _FY ) ; bgr:setFillColor (1, 204/255, 0)
	btn = display.newImageRect("hewan/restart.png",52,58) ;btn.x = 89 btn.y=80
	scorebg = display.newImageRect("hewan/score.png",221,96);scorebg.anchorX = .95;scorebg.anchorY = .95 ;scorebg.x = _FX; scorebg.y=_FY+50; scorebg.alpha=0
	transition.to(scorebg, {time=2000,x= _FX, y= _FY,alpha = 1,delay=2000,transition = easing.outExpo})	
	st1 = display.newImageRect("hewan/star2.png",50,48) ;st1.x = s1 st1.y=_FY/2
	st2 = display.newImageRect("hewan/star2.png",50,48) ;st2.x = s2 st2.y=_FY/2
	st3 = display.newImageRect("hewan/star2.png",50,48) ;st3.x = s3 st3.y=_FY/2
	st4 = display.newImageRect("hewan/star2.png",50,48) ;st4.x = s4 st4.y=_FY/2
	st5 = display.newImageRect("hewan/star2.png",50,48) ;st5.x = s5 st5.y=_FY/2
	
	star1 = display.newImageRect("hewan/star.png",64,61) ;star1.x = s1 star1.y=_FY/2 star1.alpha =0
	star2 = display.newImageRect("hewan/star.png",64,61) ;star2.x = s2 star2.y=_FY/2 star2.alpha =0
	star3 = display.newImageRect("hewan/star.png",64,61) ;star3.x = s3 star3.y=_FY/2 star3.alpha =0
	star4 = display.newImageRect("hewan/star.png",64,61) ;star4.x = s4 star4.y=_FY/2 star4.alpha =0
	star5 = display.newImageRect("hewan/star.png",64,61) ;star5.x = s5 star5.y=_FY/2 star5.alpha =0
	
	screenGroup:insert( bgr )
	screenGroup:insert( scorebg )
	screenGroup:insert( st1 )
	screenGroup:insert( st2 )
	screenGroup:insert( st3 )
	screenGroup:insert( st4 )
	screenGroup:insert( btn )
	screenGroup:insert( st5 )
	screenGroup:insert( star1 )
	screenGroup:insert( star2 )
	screenGroup:insert( star3 )
	screenGroup:insert( star4 )
	screenGroup:insert( star5 )
end
	

----------------------------------------------------------------------------------

function scene:enterScene( event )
	storyboard.purgeScene( "22chicken" )

	--[[
	local function waktu()
		if tmrrz == nil then
		tmrrz = 0

		end
	end
	
	waktu()
	--]]
	
	--local tmrrz = 0
	tasasmrz = system.getTimer()
	tmrz = system.getTimer() - tmrrz
	
	
	print ("tasasmrz : "..tasasmrz)
	print ("tmrz : "..tmrz)
	print ("gettmir : "..system.getTimer())
	print ("tmrrz : "..tmrrz)

----------------------------------------------------------------------------------


	local function fstar1()
		transition.to(star1, {time=2000,alpha = 1,transition = easing.outExpo})	
	end
	
	local function fstar2()
		if tmrz < 200000 then
		--	print(tmrz)
			transition.to(star2, {time=2000, delay = 500 , alpha = 1,transition = easing.outExpo})
		end
	end
	
		
	local function fstar3()
		if tmrz < 180000 then
		--	print(tmrz)
			transition.to(star3, {time=2000,delay = 1000 ,alpha = 1,transition = easing.outExpo})
		end
	end
		
	local function fstar4()
		if tmrz < 170000 then
			print("xzxzx")
			transition.to(star4, {time=2000,delay = 1500 ,alpha = 1,transition = easing.outExpo})
		end
	end
		
	local function fstar5()
		if tmrz < 160000 then
			print("xzxzx")
			transition.to(star5, {time=2000,delay = 2000 ,alpha = 1,transition = easing.outExpo})
		end
	end
	
	
----------------------------------------------------------------------------------
	function btn:touch( event )	
		if event.phase == "ended" then 
			storyboard.gotoScene( "1zebra", "fade", 500  )
			
		end    
		
		return true
	end
	
	fstar1()
	fstar2()
	fstar3()
	fstar4()
	fstar5()
	
	btn:addEventListener( "touch", btn )

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

-- "exitScene" event is dispatched before nexg scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene