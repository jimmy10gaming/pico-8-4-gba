
function _init()
   
    poke(0x5f2d, 1)
    genlists()
   
    gsel=1
    gnr=""
   
    g2sel=1
    gme=""
   
   
    mnr=1
    mod=""
   
    curpos=0
   
    secret=false
   
    --mouse vars
    wait=false
   
    menu=true
end

function _update()
    if menu then
     if (stat(34)==1) and not(wait) then
      dobtns()
      wait=true
     elseif stat(34)==0 and wait then
         wait=false
     end
     if btnp(❎) or btnp(🅾️) then
         menu=false
        end
    else
    if curpos==0 then
    if (stat(34)==1) and not(wait) then
     dobtns()
     wait=true
    elseif stat(34)==0 and wait then
        wait=false
    end
    else
    if btnp(➡️) then
        if curpos==1 then
            gsel+=1
        elseif curpos==2 then
            g2sel+=1
        elseif curpos==3 then
            mnr+=1
        end
    end
   
    if btnp(⬅️) then
        if curpos==1 then
            gsel-=1
        elseif curpos==2 then
            g2sel-=1
        elseif curpos==3 then
            mnr-=1
        end
    end
   
    if curpos==4 and (btnp(❎) or btnp(🅾️)) then
        boot()
    end
    end
   
    if btnp(⬆️) and curpos>0 then curpos-=1 end
    if btnp(⬇️) and curpos<4then curpos+=1 end
    end
    if gsel<1 then
     gsel=#genres
 elseif gsel>#genres then
     gsel=1
 end
   
    gnr=genres[gsel]

    gpos=games[gsel]

    if g2sel<1 then
     g2sel=#gpos
 elseif g2sel>#gpos then
     g2sel=1
 end
 
 gme=games[gsel][g2sel][1]


    if mnr<1 then
     mnr=#gpos[g2sel][2]
 elseif mnr>#gpos[g2sel][2] then
     mnr=1
 end
   

    selmod=games[gsel][g2sel][2][mnr][1]
--    selmod=#games[gsel][g2sel]
end

function _draw()
    cls(13)

--draw selection boxes
    if menu then
        palt(1,true)
        palt(0,false)
        spr(8,44,12,4,4)
       
        spr(18,38,46,6,2)
     palt()
     
     oprint("game launcher",34,70,0,7)
     
     drawbox("start",90)
     ospr(1,0,stat(32),stat(33))
    else
   
    oprint("genre",55,2,0,7)
   
    ospr(2,0,5,13)
    ospr(3,0,114,13)
   
    rectf(17,12,92,10,0,5)
   
   
    oprint(gnr,63-(#gnr*2),14,0,7)


    oprint("game",56,26,0,7)
   
    if #games[gsel]>1 then
     ospr(2,0,5,37)
     ospr(3,0,114,37)
 end
    
    rectf(17,36,92,10,0,5)
   
   
    oprint(gme,65-(#gme*2),38,0,7)


    oprint("mod",58,58,0,7)

 if #games[gsel][g2sel][2]>1 then
     ospr(2,0,5,70)
     ospr(3,0,114,70)
    end
   
    rectf(17,68,92,10,0,5)
   
   
    oprint(selmod,63-(#selmod*2),70,0,7)
--    oprint(selmod,63-(selmod*2),70,0,7)


    rectf(49,90,30,10,0,5)
    oprint("play",56,92,0,7)
   
    author=games[gsel][g2sel][2][mnr][2]
    oprint("by:",60,107,0,7)
    oprint(author,63-((#author)*2),115,0,7)

        --draw cursor
    if curpos==0 then
     ospr(1,0,stat(32),stat(33))
 else
     if curpos==1 then
         rect(16,11,110,23,9)
     elseif curpos==2 then
         rect(16,35,110,47,9)
     elseif curpos==3 then
         rect(16,67,110,79,9)
     elseif curpos==4 then
         rect(48,89,80,101,9)
        end
 end
    end
   
    if secret then
        oprint("bonus",2,2,0,8+(time()*8%8))
        oprint("games",105,2,0,8+(time()*8%8))
    end

end


-->8
--defs

function genlists()
   
    gen_genres()
--    split_genres()
    gen_games()
    gen_mods()
   
    make_all()
end

function split_genres()
    for i=1,#games do
        games[i]=split(games[i],"…")
    end
end

function gen_genres()
    genres={"platformer",
    "metroidvania",
    "racing",
    "shoot'em-up",
    "horror",
    "rhythm",
    "sandbox",
    "fps",
    "strategy",
    "arcade"}
end

function gen_games()
games={
--platformers
split([[celeste
:celeste|matt thorson + noel berry|#15133|
▒old site|amegpo|#oldsite-3|
▒farland|kameraxd|#farland-2|

…alex kidd in pico world
:alex kidd in pico world|domarius|#46035|


…snack scoffer
:snack scoffer|niall chandler games|#snack_scoffer_ngc_1|

…u-turn
:u-turn|benjamin_soule|#39885|
]],"…"),

--metroidvania
split([[METROcubeVANIA
:METROcubeVANIA|flytrapstudios|#cubevania12-0|
▒the bee movie|felixthegamer|#beepbeep-0|
▒metrocubevania png|felixthegamer|#getbeaned-0|
]],"…"),

--racing
split([[picoracer-2048
:picoracer-2048|impbox|#16305|
]],"…"),

--shoot'em-up
split([[picobreed
:picobreed|gabrielcrowe|#40736|
]],"…"),

--horror
split([[the dead should die
:the dead should die|dw817|#tdsd|
]],"…"),

--
split([[pico night punkin'
:pico night punkin'|carsonk|#fnf_menu-6|
▒jo560hs mod collection|jo560hs|#jo560hs_fnf_start-1|]],
"…"),


--sandbox
split([[terra
:terra|cubee|#terra_1cart-25|
…picovox
:picovox|electricgryphon
|#gesadupito-2|]],
"…"),

split([[picohot
:picohot|pirx_vr|#picohot-0|

…poom
:poom|freds72|#poom_0-9|
]],"…"),

--strategy
split([[pico zombie garden
:pico zombie garden|flyingsmog|#fsgupicozombiegarden121|
]],"…"),

--arcade
split([[picoware
:picoware|szczm_|#picoware-20|

…marballs 2
:marballs 2|lucatron|#marballs_2-0|

…peral
:peral|phvli|#peral-1|

…he get up
:he get up|jo560hs|#hegetup|
]],"…"),


--split([[
--]],"…"),

}
if secret then
load_secret()
end
end 

function gen_mods()
local glist={}
for i=1,#games do
add(glist,{})
for j=1,#games[i] do
    gfull=split(games[i][j],":")
   
    gname=gfull[1]
    modfull=split(gfull[2],"▒")
    gmods={}
   
   
    for m=1,#modfull do
        cmod=split(modfull[m],"|")
        gmodn=cmod[1]
        gmoda=cmod[2]
        gmodc=cmod[3]
        add(gmods,{gmodn,gmoda,gmodc})
    end
    add(glist[i],{gname,gmods})
end
end
games=glist
end


function make_all()
    local agames={}
    for i=1,#games do
    for j=1,#games[i] do
        add(agames,games[i][j])
    end
    end
    add(genres,"all games",1)
    add(games,agames,1)
end
-->8
--tools

function rectf(x,y,w,h,c,c1)
    rect(x-1,y-1,x+w+1,y+h+1,c)
    rect(x-2,y-2,x+w+2,y+h+2,c)
    rectfill(x,y,x+w,y+h,c1)
end

function ospr(n,col_outline,x,y,w,h,flip_x,flip_y)

        w=w or 1
        h=h or 1
  -- reset palette to black
  for c=1,15 do
    pal(c,col_outline)
  end
  -- draw outline
  for xx=-1,1 do
    for yy=-1,1 do
      spr(n,x+xx,y+yy,w,h,flip_x,flip_y)
    end
  end
  -- reset palette
  pal()
  -- draw final sprite
  spr(n,x,y,w,h,flip_x,flip_y)   
end

function oprint(s,x,y,c1,c2)
    for i=0,2 do
     for j=0,2 do
      if not(i==1 and j==1) then
       print(s,x+i,y+j,c1)
      end
     end
    end
    print(s,x+1,y+1,c2)
end

function mousebox(x,y,w,h)
    if w==nil then
        w=8
    end
    if h==nil then
     h=8
    end
    mousex=(stat(32)>=x) and (stat(32)<=x+w)
    mousey=(stat(33)>=y) and (stat(33)<=y+h)
    return mousex and mousey
end
-->8
--mouse

function dobtns()
    if mousebox(5,13) then
     gsel-=1
    elseif mousebox(114,13) then
     gsel+=1
 end
 
 if mousebox(5,37) then
     g2sel-=1
     mnr=1
    elseif mousebox(114,37) then
     g2sel+=1
     mnr=1
 end
 
 if mousebox(5,70) then
     mnr-=1
    elseif mousebox(114,70) then
     mnr+=1
 end
 
 if mousebox(49,90,30,10) then
     if menu then
         menu=false
            genlists()
  else
      boot()
  end
 end
 
 if mousebox(48,16,28,28) then
     secret=not(secret)
 end
end

function boot()
    load(games[gsel][g2sel][2][mnr][3],"back to launcher")
end

function drawbox(txt,y)
 rectf(60-#txt*2,y,#txt*4+4,10,0,5)

    oprint(txt,52,y+2,0,7)
end
-->8
--debug


function gentxt()
    local output=""
     
    local genre,game,mod,out="","","",""
    for g=2,#genres do
        genre=genres[g]
        for ga=1,#games[g] do
            game=games[g][ga][2][1][1]
            mout=""
            if #games[g][ga][2]>1 then
             for m=2,#games[g][ga][2] do
                 mod=games[g][ga][2][m][1]
                 mout=mout.."+"..mod.." "
             end
             game=game.." ".."("..mout..")"
         end
            out=out..game.."\n"
            game=""
        end
    output=output..genre..":".."\n"..out.."\n"
    out=""
    end
   
    printh(output,"@clip")
end




function load_secret()
   
   
dbug=split([[bonus
:celeste|jelpi|#celestei-0|

…colabs
:cubee|cubee|#jelpi_fnf-0|
]],"…")
add(genres,"bonus")
add(games,dbug)
end
