_W=display.contentWidth
_H=display.contentHeight
score=0
local speed =0
local composer = require( "composer" )
local scene = composer.newScene()
gamestart=false
grup1 = display.newGroup()
local hscore
timevar=60


local enter=audio.loadSound("game.mp3")
--local coin=audio.loadSound("coin.mp3")
      
--local girli=audio.loadSound("girl.m4a")
  



local path=system.pathForFile("score.txt",system.DocumentsDirectory)


file,errorst = io.open ( path,  "r" )
if file then
hscore1= file:read ("*a")
io.close ( file )

hscore=tonumber(hscore1)
print(hscore)
else hscore=0
end
group1=display.newGroup()

if hscore==nil then
   hscore=0
end
print(hscore)





function scene:create( event )

   local sceneGroup = self.view
a=math.random(1,3)
if a==1 then
back = display.newImage("back1.jpg")
elseif a==2 then
   back = display.newImage("back2.jpg")
else
   back = display.newImage("back3.jpg")
   back.width=_W
   back.height=_H+100
end
back.x=_W/2
back.y=_H/2
sceneGroup:insert(back)

if ch==1 then

      sheetdata =  {
          width=301,
          height=385,
          numFrames=3
     }

      sheet= graphics.newImageSheet( "boysprite.gif", sheetdata )
      sequenceData = {
                {
           name="slow",
            start=1,

           count=4,
           time=230,
           loopCount=1
          }
      } 

       hero = display.newSprite( sheet, sequenceData )
       hero.x=250
       hero.y=_H-230
    -- boy.height=140
     --boy.width=240
     sceneGroup:insert(hero)
    hero:play()
else


    sheetdata2 =  {
          width=280,
          height=336,
          numFrames=3
     }

      sheet2= graphics.newImageSheet( "girlsprite.gif", sheetdata2 )
      sequenceData2 = {
                {
           name="slow",
            start=1,
           count=3,
           time=230,
           loopCount=1
          }
      } 

       hero = display.newSprite( sheet2, sequenceData2 )
       hero.x=_W-200
       hero.y=_H-220
sceneGroup:insert(hero)
    -- boy.height=140
     --boy.width=240
    hero:play()




end










   booksgroup = display.newGroup()
   booksgroup.anchorChildren = true
   booksgroup.anchorX = 0
   booksgroup.anchorY = 1
   booksgroup.x = 0
   booksgroup.y = 0
   sceneGroup:insert(booksgroup)







textview=display.newText("0",20,12,system.default,80)
textview.x=_W-180
textview.y=130
sceneGroup:insert(textview)

dbback=display.newImage("dbback.png")
--sceneGroup:insert(dbback)
dbback.x=_W/2
dbback.y=_H/3+150
dbback.width=1200
dbback.height=750
group1:insert(dbback)

home=display.newImage("home.png")
home.x=_W/3
home.y=2/3*_H
group1:insert(home)
home.width=150
home.height=150


restart=display.newImage("res.png")
restart.x=_W/3*2
restart.y=2/3*_H
group1:insert(restart)
restart.width=150
restart.height=150
sceneGroup:insert(group1)
group1.isVisible=false
         addColumnTimer = timer.performWithDelay(400, addobj, -1)
          moveColumnTimer = timer.performWithDelay(2, moveobj, -1)

          best=display.newText("Best :"..hscore,20,12,system.default,80)
          best.x=_W/4
          best.y=200
          group1:insert(best)

            now=display.newText("now :"..score,20,12,system.default,80)
          now.x=_W/2+250
          now.y=200



speedup=display.newImage("speedup.png")

speedup.x=_W/2
speedup.y=_H
speedup.alpha=0

sceneGroup:insert(speedup)


          group1:insert(now)





          exit=display.newImage("exit.png")
          exit.x=190
          exit.y=135
          exit.width=250
exit.height=150
sceneGroup:insert(exit)


timetext=display.newText("60",20,12,system.default,80)
timetext.x=_W-180
timetext.y=250
sceneGroup:insert(timetext)


     timetimer = timer.performWithDelay(1000, cooltime, -1)




end

-- "scene:show()"
function cooltime( ... )
  -- body
  timevar=timevar-1
  timetext.text=timevar
  if timevar==0 then
    gameover()
  end
end


local a=1
function addobj( ... )
   -- body
  -- print("early")
--print(a)

a=math.random(1300)-1

if a<=400 then
if ch==1 then
book=display.newImage("girlbook.gif")
else
  book=display.newImage("boybook.gif")
  end
   book.x=_W/2
   book.y=-20
   booksgroup:insert(book)
   book.type="bookl"

elseif a<850 then

if ch==1 then
book=display.newImage("boybook.gif")
else
  book=display.newImage("girlbook.gif")
  end

   book.x=_W/2
   book.y=-10
   booksgroup:insert(book)
   book.type="book1"

elseif a<1050 then

       book=display.newImage("dead.gif")
   book.x=_W/2
   book.y=-10
   booksgroup:insert(book)
   book.type="dead"
else
     book=display.newImage("common.gif")
   book.x=_W/2
   book.y=-10
   booksgroup:insert(book)
   book.type="bookd"
end
   book.width=450
   book.height=200
end
function moveobj( ... )
   -- body



   for a = booksgroup.numChildren,1,-1 do


if booksgroup[a].y<_H-50 then
   booksgroup[a].y=booksgroup[a].y+17+speed
else
   booksgroup:remove(booksgroup[a])
--print(booksgroup.numChildren)
--print(a)
end
   end
end




function homee( ... )
   -- body
   composer.gotoScene("start")
end
function resta( ... )
   -- body
   composer.gotoScene("gamelocal")
end
function gameover1( ... )
  -- body
  composer.gotoScene("start")
end
function gameover( ... )
   -- body
   --composer.gotoScene("start")
  timer.cancel(timetimer)
  timetext.isVisible=false
    exit.isVisible=false
   if score>hscore then
 path=system.pathForFile("score.txt",system.DocumentsDirectory)
 file,errorst=io.open(path,"w")
file:write(score)
io.close(file)
   end
   dbback.isVisible=true
   if score<0 then
      score=0
   end
   now.text="Now : " ..score
   Runtime:removeEventListener("tap",runt)
group1.isVisible=true
   timer.cancel(addColumnTimer)
   timer.cancel(moveColumnTimer)
end





function coolbrain( ... )
   -- body

if score>200 then
   speed=30

   elseif score>160 then
      speed=24

      elseif score>150 then 
         speed=18

      elseif score>120 then
         speed=15


      elseif score>60 then
         speed=12

      elseif score>40 then
         speed=6

      end


end





function runt( self,event )
   -- body

   

  
   hero:play()
   if booksgroup[1] then
   if booksgroup[1].y>700 then
      if booksgroup[1].type=="book1" then
         score=score+2
      coolbrain()
      elseif booksgroup[1].type=="bookl" then
         score=score-2
         if score<=0 then
            gameover()
         end
      elseif booksgroup[1].type=="bookd" then
            score=score+2
            coolbrain()
            elseif booksgroup[1].type=="dead" then
               score=score-5
               coolbrain()
                        if score<=0 then
            gameover()
         end
      end
         textview.text=score
   booksgroup:remove(booksgroup[1])
end
end
end






local function onKeyEvent( event )

    if ( event.keyName == "back" ) then

composer.gotoScene("start")

       return true
    end
 return false
end




function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
   
   elseif ( phase == "did" ) then
   



Runtime:addEventListener("tap",runt)
composer.removeScene("start")
home:addEventListener("tap",homee)
restart:addEventListener("tap",resta)

audio.play(enter,{loops=1000})
Runtime:addEventListener( "key", onKeyEvent )
exit:addEventListener("tap",gameover1)

   end
end






















function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
  

Runtime:removeEventListener("tap",runt)
home:removeEventListener("tap",homee)
restart:removeEventListener("tap",resta)

   timer.cancel(addColumnTimer)
   timer.cancel(moveColumnTimer)
  
  -- timer.cancel(timelap)
  timer.cancel(timetimer)
audio.stop()
sceneGroup:removeSelf()
------------
exit:removeEventListener("tap",gameover)
Runtime:removeEventListener( "key", onKeyEvent )




   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end




















function scene:destroy( event )

   local sceneGroup = self.view

end

---------------------------------------------------------------------------------


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene













