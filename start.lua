local composer = require( "composer" )
local scene = composer.newScene()
_W=display.contentWidth
_H=display.contentHeight
local widget = require "widget"
b=0
ch=1
jaspertext = nil
opaltext = nil
jast=0
opat=0
c=0



function adListener( event )
   
    local msg = event.response
    -- Quick debug message regarding the response from the library
    print( "Message from the ads library: ", msg )
 
    if ( event.isError ) then
        print( "Error, no ad received", msg )
    else
        print( "Ah ha! Got one!" )
    end
end






local enter=audio.loadSound("start.mp3")
--local coin=audio.loadSound("coin.mp3")
      audio.play(enter)


    group1 = display.newGroup()
    group2 = display.newGroup()

  group3 = display.newGroup()
function scene:create( event )
   -- body
   local sceneGroup = self.view


image=display.newImage("main2.jpg")
image.anchorX=0
image.anchorY=0
sceneGroup:insert(image)
image.width=1500
image.x=_W/2-10

play=display.newImage("play.gif")
sceneGroup:insert(play)
play.x=_W/2
play.y=_H/3*2+100
play.width=170
play.height=170

dbback=display.newImage("dbback.png")
--sceneGroup:insert(dbback)
dbback.x=_W/2
dbback.y=_H/3+150
dbback.width=1200
dbback.height=750

group1:insert(dbback)


dbback2=display.newImage("dbback.png")
--sceneGroup:insert(dbback2)
dbback2.x=_W/2
dbback2.y=_H/3+150
dbback2.width=1200
dbback2.height=750

group2:insert(dbback2)




dbback3=display.newImage("dbback.png")
--sceneGroup:insert(dbback2)
dbback3.x=_W/2
dbback3.y=_H/3+150
dbback3.width=1350
dbback3.height=750

group3:insert(dbback3)


close=display.newImage("close.png")
--sceneGroup:insert(close)
close.x=_W/3*2+280
close.y=_H/3-165

group1:insert(close)
-------------------------------------------------------meeee..................
  group1.isVisible=false 
group2.isVisible=false 

single=display.newImage("single.png")
--sceneGroup:insert(single)
single.x=_W/2-350
single.y=_H/3+150
single.width=400
single.height=200

group1:insert(single)






double=display.newImage("double.png")
--sceneGroup:insert(double)
double.x=_W/2+350
double.y=_H/3+150
double.width=400
double.height=200

group1:insert(double)


back1=display.newImage("back.png")
--sceneGroup:insert(back1)
back1.x=_W/2-500
back1.y=_H/3-140
back1.width=150
back1.height=150

group2:insert(back1)





jasprite=display.newImage("jasprite.png")
--sceneGroup:insert(jasprite)
jasprite.x=_W/2-350
jasprite.y=_H/3+150
jasprite.width=400
jasprite.height=200

group2:insert(jasprite)


ovalite=display.newImage("ovalite.png")
--sceneGroup:insert(ovalite)
ovalite.x=_W/2+350
ovalite.y=_H/3+150
ovalite.width=400
ovalite.height=200

group2:insert(ovalite)





textbox = native.newTextBox( 140, 100, 600, 350 )
textbox.text = "write/confess something to opalite and lock if you loose this will be displayed"
textbox.isEditable = true
group3:insert(textbox)
textbox.size=50


textbox2 = native.newTextBox( 780, 100, 600, 350 )
textbox2.text = "write/confess something to jasprite and lock if you loose this will be displayed"
textbox2.isEditable = true
group3:insert(textbox2)
textbox2.size=50

jaspritelock=display.newImage("jaspritelock.png")
jaspritelock.x=450
jaspritelock.y=500
group3:insert(jaspritelock)

opalitelock=display.newImage("opalitelock.png")
opalitelock.x=1030
opalitelock.y=500
group3:insert(opalitelock)



play2=display.newImage("play.png")
group3:insert(play2)
play2.x=_W/2
play2.y=_H/3*2+100

back2=display.newImage("back.png")
--sceneGroup:insert(back1)
back2.x=_W/2-500
back2.y=_H-210
back2.width=150
back2.height=150

group3:insert(back2)



textbox.isVisible=false
textbox2.isVisible=false
group3.isVisible=false
sceneGroup:insert(group3)
sceneGroup:insert(group2)
sceneGroup:insert(group1)


deve=display.newImage("developers.jpg")
deve.x=_W/2+70
deve.y=_H/2
sceneGroup:insert(deve)
deve.isVisible=false

developerlogo=display.newImage("developer.gif")
developerlogo.x=_W-120
developerlogo.y=120
developerlogo.width=200
developerlogo.height=200
sceneGroup:insert(developerlogo)

inst=display.newImage("inst.jpg")
inst.x=_W/2
inst.y=_H/2
--inst.width=600
--inst.height=800
sceneGroup:insert(inst)
inst.isVisible=false




help=display.newImage("help.png")
help.width=150
help.height=150
help.x=100
help.y=130
sceneGroup:insert(help)






end
local function textListener( event )
 
    if ( event.phase == "began" ) then
        -- User begins editing "defaultBox"
 
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultBox"
        print( event.target.text )
 
    elseif ( event.phase == "editing" ) then
        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )
    end
end
 
function Go(self,event )
   -- body
  composer.gotoScene("game")
end

function vis( ... )
   -- body
   help.isVisible=false
   developerlogo.isVisible=false
   group1.isVisible=true
   play.isVisible=false
   group2.isVisible=false
  
end


function oncompleteyoo( event )
  -- body
  if event.action== "clicked" then

        local i = event.index
        print("got")
        if i==1 then
    os.exit()
  else
  end

  end
end




local function onKeyEvent( event )

    if ( event.keyName == "back" ) then
c=0
a=0

deve.isVisible=false
inst.isVisible=false
      alert=native.showAlert("Jasper V/S Opal","do you want to exit ?",{"yes" ,"no"},oncompleteyoo)

       return true
    end
 return false
end




function antivis( ... )
   -- body
   developerlogo.isVisible=true
     group1.isVisible=false
   play.isVisible=true
   help.isVisible=true

end


function again( ... )
   -- body
   group2.isVisible=true
   group1.isVisible=false

end
function game1( ... )
   





textbox.isVisible=true
textbox2.isVisible=true
group3.isVisible=true
group1.isVisible=false



end


function jas( ... )
   -- body
   ch=1
   composer.gotoScene("game")
end

function ova( ... )
   -- body
   ch=0
   composer.gotoScene("game")
end

function twoone( ... )
  -- body
     composer.gotoScene("gamemain")
end

function gojalo( ... )
  -- body
  if jast==0 then
    jast=1
  jaspertext=textbox.text
  textbox.text="LOCKED!!"
  textbox.isEditable=false
end
end
function gooplo( ... )
  -- body
  if opat==0 then
    opat=1
    opaltext=textbox2.text
  textbox2.text="LOCKED!!"
  textbox2.isEditable=false
end
end
function back11( ... )
  -- body
  group2.isVisible=false
  group1.isVisible=true
end
function back22( ... )
  -- body
jast=0
opat=0
  group3.isVisible=false
  textbox.isVisible=false
textbox2.isVisible=false
group1.isVisible=true
textbox.text = "write/confess something to opalite and lock"
textbox.isEditable = true
textbox2.text = "write/confess something to jasprite and lock"
textbox2.isEditable = true


end


function devpage( ... )
  -- body
  inst.isVisible=false
if a==0 then
  deve.isVisible=true
  a=1
  play.isVisible=false
  else
     deve.isVisible=false
     a=0
     play.isVisible=true
     end 

end


function helpi( ... )

--deve.isVisible=false
if c==0 then
  inst.isVisible=true
  help.isVisible=true
  c=1
else
  c=0
  inst.isVisible=false
end

  -- body
end






function scene:show( event )

   local sceneGroup = self.view

   local phase = event.phase

   if ( phase == "will" ) then





   elseif ( phase == "did" ) then


play:addEventListener("tap",vis)
close:addEventListener("tap",antivis)
single:addEventListener("tap",again)
double:addEventListener("tap",game1)
jasprite:addEventListener("tap",jas)
ovalite:addEventListener("tap",ova)
textbox:addEventListener( "userInput", textListener )
play2:addEventListener("tap",twoone)
jaspritelock:addEventListener("tap",gojalo)
opalitelock:addEventListener("tap",gooplo)
back1:addEventListener("tap",back11)
back2:addEventListener("tap",back22)
developerlogo:addEventListener("tap",devpage)
Runtime:addEventListener( "key", onKeyEvent )
help:addEventListener("tap",helpi)



   end






end












-- "scene:hide()"





function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
----------------
play:removeEventListener("tap",vis)
close:removeEventListener("tap",antivis)
single:removeEventListener("tap",again)
double:removeEventListener("tap",game1)
back1:removeEventListener("tap", vis)
jasprite:removeEventListener("tap",jas)
ovalite:removeEventListener("tap",ova)
textbox:removeEventListener( "userInput", textListener )
play2:removeEventListener("tap",twoone)
jaspritelock:removeEventListener("tap",gojalo)
opalitelock:removeEventListener("tap",gooplo)
composer.removeScene("game")
composer.removeScene("gamemain")
audio.stop()
help:removeEventListener("tap",helpi)

back1:removeEventListener("tap",back11)
back2:removeEventListener("tap",back22)
developerlogo:removeEventListener("tap",devpage)
Runtime:removeEventListener( "key", onKeyEvent )





   elseif ( phase == "did" ) then

   end
end






function scene:destroy( event )

   local sceneGroup = self.view
--sceneGroup:removeself()
end










scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )



return scene










