local xx2 = 800;
local yy2 = 600;
local ofs = 20;
local followchars = true;



function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'riverflustered'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'riverdeath'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'rivergameover'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'rivergameoverend'); --put in mods/music/

	setProperty('camZooming', true);
	makeLuaSprite('bg', 'bg', 15, 176)
	makeLuaSprite('lights', 'bglights', 400, 80)
	makeLuaSprite('filter',' ', 100, 100)

	addLuaSprite('bg', false)
        makeGraphic('filter', 1920, 1080, 'DB8D73')
	addLuaSprite('filter', true)
	addLuaSprite('lights', true)
	setBlendMode('filter', 'multiply')
	setBlendMode('lights', 'add')

	makeLuaSprite('bartop','',0,0)
	makeGraphic('bartop',1280,100,'000000')
	addLuaSprite('bartop',true)

	makeLuaSprite('barbot','',0,620)
	makeGraphic('barbot',1280,100,'000000')
	addLuaSprite('barbot',true)
	setScrollFactor('bartop',0,0)
	setScrollFactor('barbot',0,0)
	setObjectCamera('bartop','hud')
	setObjectCamera('barbot','hud')
end

--the following code is DEFINITELY not taken from bbpanzu that would be absurd *whistles innocently*

function onUpdate()

    if followchars == true then
        if mustHitSection == true then

            setProperty('defaultCamZoom', 1.5)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
                triggerEvent('Camera Follow Pos',xx2,yy2+120)
            end
	else
	    triggerEvent('Camera Follow Pos','','')
	setProperty('defaultCamZoom', 2.2)
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end