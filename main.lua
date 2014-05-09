-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )
_Y = display.contentHeight/1.5
_X = display.contentWidth/2
_Xh = display.contentWidth/2 - 30
_FY = display.contentHeight
_FX = display.contentWidth
tmrrz = 0

h1 = _Xh-(60*3); h2 = _Xh-(60*2); h3 = _Xh-(60*1); h4 = _Xh-(60*0); h5 = _Xh+(60*1); h6 = _Xh+(60*2); h7 = _Xh+(60*3); h8 = _Xh+(60*4);

local storyboard = require "storyboard"

storyboard.gotoScene( "1zebra" )




--function sound1()
done=audio.loadSound("sound/done.wav")
stream = audio.loadStream("sound/FreedomDance.wav")
audio.play(stream,{loops=-1})

--end


-- hahaha




























-- Display objects added below will not respond to storyboard transitions

--[[
-- table to setup tabBar buttons
local tabButtons = {
	{ label="First", up="icon1.png", down="icon1-down.png", width = 32, height = 32, selected=true },
	{ label="Second", up="icon2.png", down="icon2-down.png", width = 32, height = 32 },
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar{
	top = display.contentHeight - 50,	-- 50 is default height for tabBar widget
	buttons = tabButtons
}
--]]

--[[ Uncomment to monitor app's lua memory/texture memory usage in terminal...

local function garbagePrinting()
	collectgarbage("collect")
    local memUsage_str = string.format( "memUsage = %.3f KB", collectgarbage( "count" ) )
    print( memUsage_str )
    local texMemUsage_str = system.getInfo( "textureMemoryUsed" )
    texMemUsage_str = texMemUsage_str/1000
    texMemUsage_str = string.format( "texMemUsage = %.3f MB", texMemUsage_str )
    print( texMemUsage_str )
end

Runtime:addEventListener( "enterFrame", garbagePrinting )
--]]