local composer = require( "composer" )
local scene = composer.newScene()






function scene:create( event )


   local sceneGroup = self.view


image=display.newImage("cool.jpg")
image.anchorX=0
image.anchorY=0
sceneGroup:insert(image)
image.width=1500
image.x=_W/2-10


end









function play( ... )
   -- body
   composer.gotoScene("start")
end




function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
   elseif ( phase == "did" ) then

timer.performWithDelay(2000,play,"fade")
-------------------------------------------------------meeee..................
   end
end












-- "scene:hide()"





function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
-----------------------------------------------------meeeeeeeeee...............









   elseif ( phase == "did" ) then

   end
end






function scene:destroy( event )

   local sceneGroup = self.view

end










scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )



return scene










