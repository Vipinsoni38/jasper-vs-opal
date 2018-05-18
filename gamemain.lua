_W=display.contentWidth
_H=display.contentHeight
boyscore=0
girlscore=0
system.activate( "multitouch" )
local speed =0
local composer = require( "composer" )
local scene = composer.newScene()

gamestart=false
grup1 = display.newGroup()
local hscore
timevar=60
group1=display.newGroup()


local enter=audio.loadSound("gamemain.mp3")
--local coin=audio.loadSound("coin.mp3")
      audio.play(enter)

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

       boy = display.newSprite( sheet, sequenceData )
       boy.x=250
       boy.y=_H-230
    -- boy.height=140
     --boy.width=240
     sceneGroup:insert(boy)
    boy:play()



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

       girl = display.newSprite( sheet2, sequenceData2 )
       girl.x=_W-200
       girl.y=_H-220
sceneGroup:insert(girl)
    -- boy.height=140
     --boy.width=240
    girl:play()










   booksgroup = display.newGroup()
   booksgroup.anchorChildren = true
   booksgroup.anchorX = 0
   booksgroup.anchorY = 1
   booksgroup.x = 0
   booksgroup.y = 0
   sceneGroup:insert(booksgroup)







girlscoret=display.newText("O :0",20,12,system.default,80)
girlscoret.x=_W-180
girlscoret.y=250
sceneGroup:insert(girlscoret)


boyscoret=display.newText("J :0",20,12,system.default,80)
boyscoret.x=_W-180
boyscoret.y=130
sceneGroup:insert(boyscoret)


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


sceneGroup:insert(group1)
group1.isVisible=false
         addColumnTimer = timer.performWithDelay(400, addobj, -1)
          moveColumnTimer = timer.performWithDelay(2, moveobj, -1)
timelap = timer.performWithDelay(1000, countdown, -1)


timetext=display.newText("60",20,12,system.default,80)
timetext.x=180
timetext.y=130
sceneGroup:insert(timetext)


          blankboy=display.newImage("blank.gif")
          blankboy.width=_W
          blankboy.height=_H+400
          blankboy.x=0
          blankboy.y=_H/2
     --     physics.addBody(blankboy,"static",{bounce=0.06,friction=0.6})
         --physics.insert(blankboy)


          blankgirl=display.newImage("blank.gif")
          blankgirl.width=_W
          blankgirl.height=_H+400
          blankgirl.x=_W+4
          blankgirl.y=_H/2
        --  physics.addBody(blankgirl,"static",{bounce=0.06,friction=0.6})


text1=display.newText("cool",20,12,system.default,80)
text1.x=_W/2
text1.y=180
sceneGroup:insert(text1)
text1.isVisible=false
options={
  text="",
  x=_W/2,
  y=380,
  width=500,
   font = native.systemFont,   
    fontSize = 58,
    align = "right"
}

text2=display.newText(options)
sceneGroup:insert(text2)
text2.isVisible=false

end

-- "scene:show()"

function countdown( ... )
   -- body
   timevar=timevar-1
   if timevar>4 then
   timetext.text=""..timevar
else
   timetext.text="Hurry !!"..timevar
end
   if (timevar==0) then
      gameover()
   end
end

local a=1
function addobj( ... )
   -- body
  -- print("early")
--print(a)

a=math.random(1100)-1

if a<=400 then

book=display.newImage("boybook.gif")
   book.x=_W/2
   book.y=-20
   booksgroup:insert(book)
   book.type="boy"

elseif a<=802 then


      book=display.newImage("girlbook.gif")
   book.x=_W/2
   book.y=-10
   booksgroup:insert(book)
   book.type="girl"

elseif a<=1000 then
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
   book.type="common"

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



function gameover( ... )
   -- body
   blankboy:removeEventListener("tap",boything)
blankgirl:removeEventListener("tap",girlthing)
text1.isVisible=true
text2.isVisible=true
if girlscore>=boyscore then
  print(jaspertext)
  text1.text="Opalite Wins : Jasprite Writes"
  text2.text=jaspertext
else
  print(opaltext)
    text1.text="Jasprite Wins : Opalite Writes"
  text2.text=opaltext
end


   --composer.gotoScene("start")
   timetext.isVisible=false
      timer.cancel(timelap)
   dbback.isVisible=true

group1.isVisible=true
   timer.cancel(addColumnTimer)
   timer.cancel(moveColumnTimer)
end



function boything( ... )
  -- body
   boy:play()
if booksgroup[1] then
   if booksgroup[1].y>700 then
      if booksgroup[1].type=="boy" then
         boyscore=boyscore+2
      
      elseif booksgroup[1].type=="girl" then
         boyscore=boyscore-2
      elseif booksgroup[1].type=="dead" then
        boyscore=boyscore-5
        elseif booksgroup[1].type=="common" then
          boyscore=boyscore+2
      end
         boyscoret.text="J :"..boyscore
   booksgroup:remove(booksgroup[1])
   end
end


end


function girlthing( ... )
  -- body
girl:play()
if booksgroup[1] then
   if booksgroup[1].y>700 then
      if booksgroup[1].type=="boy" then
         girlscore=girlscore-2
      
      elseif booksgroup[1].type=="girl" then
         girlscore=girlscore+2
      elseif booksgroup[1].type=="dead" then
        girlscore=girlscore-5
      elseif booksgroup[1].type=="common" then
          boyscore=boyscore+2
      end
         girlscoret.text="O :"..girlscore
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




function decide( event )
  -- body
  
  if event.x<_W/2-2 then

    boything()
  else
girlthing()

  
end
end



function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
   
   elseif ( phase == "did" ) then
   


composer.removeScene("start")
home:addEventListener("tap",homee)
--blankboy:addEventListener("tap",boything)
--blankgirl:addEventListener("tap",girlthing)
Runtime:addEventListener( "touch", decide )

Runtime:addEventListener( "key", onKeyEvent )



   end
end






















function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
  


home:removeEventListener("tap",homee)
blankboy:removeEventListener("tap",boything)
--blankgirl:removeEventListener("tap",girlthing)
--Runtime:removeEventListener( "key", onKeyEvent )
Runtime:removeEventListener( "touch", decide )

   timer.cancel(addColumnTimer)
   timer.cancel(moveColumnTimer)
   timer.cancel(timelap)

audio.stop()
sceneGroup:removeSelf()
------------




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













