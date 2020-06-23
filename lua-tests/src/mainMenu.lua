local requireName = {
    "helper",
    "testResource",
    "VisibleRect",

    "AccelerometerTest/AccelerometerTest",
    "ActionManagerTest/ActionManagerTest",
    "ActionsEaseTest/ActionsEaseTest",
    "ActionsProgressTest/ActionsProgressTest",
    "ActionsTest/ActionsTest",
    "AssetsManagerTest/AssetsManagerTest",
    "AssetsManagerExTest/AssetsManagerExTest",
    "BillBoardTest/BillBoardTest",
    "BugsTest/BugsTest",
    "ByteCodeEncryptTest/ByteCodeEncryptTest",
    "Camera3DTest/Camera3DTest",
    "ClickAndMoveTest/ClickAndMoveTest",
    "CocosDenshionTest/CocosDenshionTest",
    "CocoStudioTest/CocoStudioTest",
    "ComponentTest/main",
    "CurrentLanguageTest/CurrentLanguageTest",
    "DrawPrimitivesTest/DrawPrimitivesTest",
    "EffectsTest/EffectsTest",
    "EffectsAdvancedTest/EffectsAdvancedTest",
    "ExtensionTest/ExtensionTest",
    "FontTest/FontTest",
    "IntervalTest/IntervalTest",
    "KeypadTest/KeypadTest",
    "LabelTest/LabelTest",
    "LabelTestNew/LabelTestNew",
    "LayerTest/LayerTest",
    "LightTest/LightTest",
    "MenuTest/MenuTest",
    "MotionStreakTest/MotionStreakTest",
    "NewEventDispatcherTest/NewEventDispatcherTest",
    "NodeTest/NodeTest",
    "OpenGLTest/OpenGLTest",
    "ParallaxTest/ParallaxTest",
    "ParticleTest/ParticleTest",
    "Particle3DTest/Particle3DTest",
    "RenderTextureTest/RenderTextureTest",
    "RotateWorldTest/RotateWorldTest",
    "Sprite3DTest/Sprite3DTest",
    "SpriteTest/SpriteTest",
    "SceneTest/SceneTest",
    "SpineTest/SpineTest",
    "TerrainTest/TerrainTest",
    "TextInputTest/TextInputTest",
    "Texture2dTest/Texture2dTest",
    "TileMapTest/TileMapTest",
    "TouchesTest/TouchesTest",
    "TransitionsTest/TransitionsTest",
    "UserDefaultTest/UserDefaultTest",
    "VibrateTest/VibrateTest",
    "ZwoptexTest/ZwoptexTest",
    "LuaBridgeTest/LuaBridgeTest",
    "XMLHttpRequestTest/XMLHttpRequestTest",
    "PhysicsTest/PhysicsTest",
    "CaptureScreenTest/CaptureScreenTest",
    "VideoPlayerTest/VideoPlayerTest",
    "FastTiledMapTest/FastTiledMapTest",
    "NewAudioEngineTest/NewAudioEngineTest",
    "CocosStudio3DTest/CocosStudio3DTest",
    "WebViewTest/WebViewTest",
    "SpritePolygonTest/SpritePolygonTest",
    "Physics3DTest/Physics3DTest",
    "Scene3DTest/Scene3DTest",
    "MaterialSystemTest/MaterialSystemTest",
    "NavMeshTest/NavMeshTest",
}

local oldRequireModle = {}
local requireModle = {}
for _, _path in pairs(requireName) do
    oldRequireModle[_path] = require(_path)
end


local LINE_SPACE = 40

local CurPos = {x = 0, y = 0}
local BeginPos = {x = 0, y = 0}

local audioEndineSupported = false
local currPlatform = cc.Application:getInstance():getTargetPlatform()
if (cc.PLATFORM_OS_WINDOWS == currPlatform or cc.PLATFORM_OS_MAC == currPlatform or cc.PLATFORM_OS_IPHONE == currPlatform or cc.PLATFORM_OS_IPAD == currPlatform or cc.PLATFORM_OS_ANDROID == currPlatform) then
    audioEndineSupported = true
end

local _allTests = {
    { isSupported = true,  name = "Accelerometer"          , create_func=             AccelerometerMain  , reloadPath = "AccelerometerTest/AccelerometerTest"},
    { isSupported = true,  name = "ActionManagerTest"      , create_func   =         ActionManagerTestMain  , reloadPath = "ActionManagerTest/ActionManagerTest"},
    { isSupported = true,  name = "ActionsEaseTest"        , create_func   =           EaseActionsTest      , reloadPath = "ActionsEaseTest/ActionsEaseTest"},
    { isSupported = true,  name = "ActionsProgressTest"    , create_func   =       ProgressActionsTest      , reloadPath = "ActionsProgressTest/ActionsProgressTest"},
    { isSupported = true,  name = "ActionsTest"            , create_func   =               ActionsTest      , reloadPath = "ActionsTest/ActionsTest"},
    { isSupported = true,  name = "AssetsManagerTest"      , create_func   =         AssetsManagerTestMain      , reloadPath = "AssetsManagerTest/AssetsManagerTest"},
    { isSupported = true,  name = "AssetsManagerExTest"      , create_func   =         AssetsManagerExTestMain  , reloadPath = "AssetsManagerExTest/AssetsManagerExTest"},
    { isSupported = audioEndineSupported, name = "AudioEngineTest", create_func = AudioEngineTest, reloadPath = nil},
    { isSupported = false,  name = "Box2dTest"              , create_func=                 Box2dTestMain  , reloadPath = nil},
    { isSupported = false,  name = "Box2dTestBed"           , create_func=              Box2dTestBedMain  , reloadPath = nil},
    { isSupported = true,  name = "BillBoardTest"           , create_func=              BillBoardTestMain, reloadPath = "BillBoardTest/BillBoardTest"},
    { isSupported = true,  name = "BugsTest"               , create_func=              BugsTestMain      , reloadPath = "BugsTest/BugsTest"},
    { isSupported = true,  name = "ByteCodeEncryptTest"     , create_func=       ByteCodeEncryptTestMain  , reloadPath = "ByteCodeEncryptTest/ByteCodeEncryptTest"},
    { isSupported = true,  name = "Camera3DTest"     ,        create_func=       Camera3DTestMain  , reloadPath = "Camera3DTest/Camera3DTest"},
    { isSupported = true,  name = "CaptureScreenTest"       , create_func   =         CaptureScreenTestMain  , reloadPath = "CaptureScreenTest/CaptureScreenTest"},
    { isSupported = false,  name = "ChipmunkAccelTouchTest" , create_func=    ChipmunkAccelTouchTestMain  , reloadPath = nil},
    { isSupported = true,  name = "ClickAndMoveTest"       , create_func   =          ClickAndMoveTest      , reloadPath = "ClickAndMoveTest/ClickAndMoveTest"},
    { isSupported = true,  name = "CocosDenshionTest"      , create_func   =         CocosDenshionTestMain  , reloadPath = "CocosDenshionTest/CocosDenshionTest"},
    { isSupported = true,  name = "CocosStudio3DTest"      , create_func   =               CocosStudio3DTest, reloadPath = "CocosStudio3DTest/CocosStudio3DTest"},
    { isSupported = true,  name = "CocoStudioTest"         , create_func   =         CocoStudioTestMain  , reloadPath = "CocoStudioTest/CocoStudioTest"},
    { isSupported = true,  name = "ComponentTest"          , create_func   =         ComponentTestMain  , reloadPath = nil},
    { isSupported = false,  name = "CurlTest"               , create_func=                  CurlTestMain  , reloadPath = nil},
    { isSupported = true,  name = "CurrentLanguageTest"    , create_func=   CurrentLanguageTestMain      , reloadPath = "CurrentLanguageTest/CurrentLanguageTest"},
    { isSupported = true,  name = "DrawPrimitivesTest"     , create_func=        DrawPrimitivesTest      , reloadPath = "DrawPrimitivesTest/DrawPrimitivesTest"},
    { isSupported = true,  name = "EffectsTest"            , create_func   =               EffectsTest      , reloadPath = "EffectsTest/EffectsTest"},
    { isSupported = true,  name = "EffectAdvancedTest"     , create_func   =        EffectAdvancedTestMain  , reloadPath = "EffectsAdvancedTest/EffectsAdvancedTest"},
    { isSupported = true,  name = "ExtensionsTest"         , create_func=        ExtensionsTestMain      , reloadPath = "ExtensionTest/ExtensionTest"},
    { isSupported = true,  name = "FastTiledMapTest"       , create_func   =              FastTiledMapTestMain, reloadPath = "FastTiledMapTest/FastTiledMapTest"},
    { isSupported = true,  name = "FontTest"               , create_func   =              FontTestMain      , reloadPath = "FontTest/FontTest"},
    { isSupported = true,  name = "IntervalTest"           , create_func   =              IntervalTestMain  , reloadPath = "IntervalTest/IntervalTest"},
    { isSupported = true,  name = "KeypadTest"             , create_func=                KeypadTestMain  , reloadPath = "KeypadTest/KeypadTest"}, 
    { isSupported = true,  name = "LabelTest"              , create_func   =                 LabelTest      , reloadPath = "LabelTest/LabelTest"},
    { isSupported = true,  name = "LabelTestNew"           , create_func   =                 LabelTestNew      , reloadPath = "LabelTestNew/LabelTestNew"},
    { isSupported = true,  name = "LayerTest"              , create_func   =                 LayerTestMain  , reloadPath = "LayerTest/LayerTest"},
    { isSupported = true,  name = "LightTest"          , create_func   =                 LightTestMain  , reloadPath = "LightTest/LightTest"},
    { isSupported = true,  name = "LuaBridgeTest"          , create_func   =        LuaBridgeMainTest , reloadPath = "LuaBridgeTest/LuaBridgeTest"},
    { isSupported = true,  name = "MaterialSystemTest"     , create_func   =        MaterialSystemTest , reloadPath = "MaterialSystemTest/MaterialSystemTest"},
    { isSupported = true,  name = "MenuTest"               , create_func   =                  MenuTestMain  , reloadPath = "MenuTest/MenuTest"}, 
    { isSupported = true,  name = "MotionStreakTest"       , create_func   =          MotionStreakTest      , reloadPath = "MotionStreakTest/MotionStreakTest"},
    { isSupported = false,  name = "MutiTouchTest"          , create_func=          MutiTouchTestMain     , reloadPath = nil},
    { isSupported = true,  name = "NavMeshTest"            , create_func   =       NavMeshTest , reloadPath = "NavMeshTest/NavMeshTest"},
    { isSupported = true,  name = "NewEventDispatcherTest"  , create_func   =       NewEventDispatcherTest , reloadPath = "NewEventDispatcherTest/NewEventDispatcherTest"},
    { isSupported = true,  name = "NodeTest"               , create_func   =                  CocosNodeTest , reloadPath = "NodeTest/NodeTest"},
    { isSupported = true,   name = "OpenGLTest"             , create_func=          OpenGLTestMain     , reloadPath = "OpenGLTest/OpenGLTest"},
    { isSupported = true,  name = "ParallaxTest"           , create_func   =              ParallaxTestMain  , reloadPath = "ParallaxTest/ParallaxTest"},
    { isSupported = true,  name = "ParticleTest"           , create_func   =              ParticleTest      , reloadPath = "ParticleTest/ParticleTest"}, 
    { isSupported = true,  name = "Particle3D (PU)"        , create_func   =              Particle3DTest  , reloadPath = "Particle3DTest/Particle3DTest"},
    { isSupported = true,  name = "PhysicsTest"            , create_func =          PhysicsTest  , reloadPath = "PhysicsTest/PhysicsTest"},
    { isSupported = true,  name = "Physics3DTest"            , create_func =          Physics3DTest  , reloadPath = "Physics3DTest/Physics3DTest"},
    { isSupported = true,  name = "RenderTextureTest"      , create_func   =         RenderTextureTestMain  , reloadPath = "RenderTextureTest/RenderTextureTest"},
    { isSupported = true,  name = "RotateWorldTest"        , create_func   =           RotateWorldTest      , reloadPath = "RotateWorldTest/RotateWorldTest"},
    { isSupported = true,  name = "SceneTest"              , create_func   =                 SceneTestMain  , reloadPath = "SceneTest/SceneTest"},
    { isSupported = true,  name = "Scene3DTest"             , create_func=            Scene3DTestMain      , reloadPath = "Scene3DTest/Scene3DTest"},
    { isSupported = true,  name = "SpineTest"              , create_func   =                 SpineTestMain  , reloadPath = "SpineTest/SpineTest"},
    { isSupported = false,  name = "SchdulerTest"           , create_func=              SchdulerTestMain  , reloadPath = nil},
    { isSupported = false, name = "ShaderTest"             , create_func=            ShaderTestMain      , reloadPath = nil},
    { isSupported = true,  name = "Sprite3DTest"           , create_func   =                Sprite3DTest    , reloadPath = "Sprite3DTest/Sprite3DTest"},
    { isSupported = true,  name = "TerrainTest"           , create_func   =                TerrainTest  , reloadPath = "TerrainTest/TerrainTest"},
    { isSupported = true,  name = "SpriteTest"             , create_func   =                SpriteTest      , reloadPath = "SpriteTest/SpriteTest"},
    { isSupported = true,  name = "SpritePolygonTest"             , create_func   =         SpritePolygonTest      , reloadPath = "SpritePolygonTest/SpritePolygonTest"},
    { isSupported = true,  name = "TextInputTest"          , create_func=             TextInputTestMain  , reloadPath = "TextInputTest/TextInputTest"},
    { isSupported = true,  name = "Texture2DTest"          , create_func   =             Texture2dTestMain  , reloadPath = "Texture2dTest/Texture2dTest"},
    { isSupported = false,  name = "TextureCacheTest"       , create_func=      TextureCacheTestMain      , reloadPath = nil},
    { isSupported = true,  name = "TileMapTest"            , create_func   =               TileMapTestMain  , reloadPath = "TileMapTest/TileMapTest"}, 
    { isSupported = true,  name = "TouchesTest"            , create_func   =               TouchesTest      , reloadPath = "TouchesTest/TouchesTest"},
    { isSupported = true,  name = "TransitionsTest"        , create_func   =           TransitionsTest      , reloadPath = "TransitionsTest/TransitionsTest"},   
    { isSupported = true,  name = "UserDefaultTest"        , create_func=           UserDefaultTestMain  , reloadPath = "UserDefaultTest/UserDefaultTest"},
    { isSupported = true,  name = "VideoPlayerTest"        , create_func=           VideoPlayerTestMain  , reloadPath = "VideoPlayerTest/VideoPlayerTest"},
    { isSupported = true,  name = "WebViewTest"            , create_func=           WebViewTestMain  , reloadPath = "WebViewTest/WebViewTest"},
    { isSupported = true,  name = "XMLHttpRequestTest"     , create_func   =        XMLHttpRequestTestMain  , reloadPath = "XMLHttpRequestTest/XMLHttpRequestTest"},
    { isSupported = true,  name = "VibrateTest"            , create_func   =               VibrateTestMain  , reloadPath = "VibrateTest/VibrateTest"},
    { isSupported = true,  name = "ZwoptexTest"            , create_func   =               ZwoptexTestMain  , reloadPath = "ZwoptexTest/ZwoptexTest"}
}

for _path, modle  in pairs(oldRequireModle) do
    for __, data in pairs(_allTests) do
        if _path == data.reloadPath then
            requireModle[data.name] = modle
            break
        end
    end
end

local TESTS_COUNT = table.getn(_allTests)

-- create scene
local function CreateTestScene(nIdx)
    cc.Director:getInstance():purgeCachedData()
    local name = _allTests[nIdx].name
    local scene = nil
    if requireModle[name] and "table" == type(requireModle[name]) and requireModle[name].reloadMain then
        scene = requireModle[name]:reloadMain()
    else    
        scene = _allTests[nIdx].create_func()
    end
    return scene
end
-- create menu
function CreateTestMenu()
    local menuLayer = cc.Layer:create()

    local function closeCallback()
        cc.Director:getInstance():endToLua()
    end

    local function menuCallback(tag)
        print(tag)
        local Idx = tag - 10000
        local testScene = CreateTestScene(Idx)
        if testScene then
            cc.Director:getInstance():replaceScene(testScene)
        end
    end

    -- add close menu
    local s = cc.Director:getInstance():getWinSize()
    local CloseItem = cc.MenuItemImage:create(s_pPathClose, s_pPathClose)
    CloseItem:registerScriptTapHandler(closeCallback)
    CloseItem:setPosition(cc.p(s.width - 30, s.height - 30))

    local CloseMenu = cc.Menu:create()
    CloseMenu:setPosition(0, 0)
    CloseMenu:addChild(CloseItem)
    menuLayer:addChild(CloseMenu)
    local targetPlatform = cc.Application:getInstance():getTargetPlatform()       
    if (cc.PLATFORM_OS_IPHONE == targetPlatform) or (cc.PLATFORM_OS_IPAD == targetPlatform) then
        CloseMenu:setVisible(false)
    end

    -- add menu items for tests
    local MainMenu = cc.Menu:create()
    local index = 0
    local obj = nil
    for index, obj in pairs(_allTests) do
        local testLabel = cc.Label:createWithTTF(obj.name, s_arialPath, 24)
        testLabel:setAnchorPoint(cc.p(0.5, 0.5))
        local testMenuItem = cc.MenuItemLabel:create(testLabel)
        local reloadLabel = cc.Label:createWithTTF("reload", s_arialPath, 24)
        reloadLabel:setAnchorPoint(cc.p(0, 0.5))
        local reloadItem = cc.MenuItemLabel:create(reloadLabel)
        if not obj.isSupported then
            testMenuItem:setEnabled(false)
        end

        if obj.name == "VideoPlayerTest" then
            if cc.PLATFORM_OS_IPHONE ~= targetPlatform and cc.PLATFORM_OS_ANDROID ~= targetPlatform then
                testMenuItem:setEnabled(false)
            end
        end

        if obj.name == "WebViewTest" then
            if cc.PLATFORM_OS_IPHONE ~= targetPlatform and cc.PLATFORM_OS_ANDROID ~= targetPlatform then
                testMenuItem:setEnabled(false)
            end
        end

        if obj.name == "Physics3DTest" and nil == cc.Physics3DComponent then
            testMenuItem:setEnabled(false) 
        end

        if obj.name == "NavMeshTest" and nil == cc.NavMesh then
            testMenuItem:setEnabled(false) 
        end

        testMenuItem:registerScriptTapHandler(menuCallback)
        testMenuItem:setPosition(cc.p(s.width / 2, (s.height - (index) * LINE_SPACE)))
        MainMenu:addChild(testMenuItem, index + 10000, index + 10000)

        reloadItem:registerScriptTapHandler(function ()
            local reloadPath = obj.reloadPath
            local oldFile = nil
            local oldModle = nil
            if reloadPath and package.loaded[reloadPath] then
                oldFile = package.loaded[reloadPath]
                oldModle = requireModle[obj.name]
                package.loaded[reloadPath] = nil
                requireModle[obj.name] = nil
                local ok, err = pcall(require, reloadPath)
                if not ok then
                    print("require failed")
                    package.loaded[reloadPath] = oldFile
                else
                    requireModle[obj.name] = ok
                    print("reload succeed")
                end
            else
                print("reload failed")
            end
        end)
        reloadItem:setPosition(cc.p(50, (s.height - (index) * LINE_SPACE)))
        MainMenu:addChild(reloadItem, index + 20000, index + 20000)
    end

    MainMenu:setContentSize(cc.size(s.width, (TESTS_COUNT + 1) * (LINE_SPACE)))
    MainMenu:setPosition(CurPos.x, CurPos.y)
    menuLayer:addChild(MainMenu)

    -- handling touch events
    local function onTouchBegan(touch, event)
        BeginPos = touch:getLocation()
        -- CCTOUCHBEGAN event must return true
        return true
    end

    local function onTouchMoved(touch, event)
        local location = touch:getLocation()
        local nMoveY = location.y - BeginPos.y
        local curPosx, curPosy = MainMenu:getPosition()
        local nextPosy = curPosy + nMoveY
        local winSize = cc.Director:getInstance():getWinSize()
        if nextPosy < 0 then
            MainMenu:setPosition(0, 0)
            return
        end

        if nextPosy > ((TESTS_COUNT + 1) * LINE_SPACE - winSize.height) then
            MainMenu:setPosition(0, ((TESTS_COUNT + 1) * LINE_SPACE - winSize.height))
            return
        end

        MainMenu:setPosition(curPosx, nextPosy)
        BeginPos = {x = location.x, y = location.y}
        CurPos = {x = curPosx, y = nextPosy}
    end

    local listener = cc.EventListenerTouchOneByOne:create()
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    local eventDispatcher = menuLayer:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, menuLayer)

    return menuLayer
end

-- DEBUG. reload some lua, for fast edit ui
if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then 
    local function callback(keycode, evt)
        if keycode == cc.KeyCode.KEY_F5 then         -- F5 reload lua files
            -- package.loaded[ "init/initReload" ] = nil
            -- require( "init/initReload" )
            print("123")
        end
    end
  
    local listener        = cc.EventListenerKeyboard:create()
    local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    listener:registerScriptHandler(callback, cc.Handler.EVENT_KEYBOARD_RELEASED)
    eventDispatcher:addEventListenerWithFixedPriority(listener, 1)
  end
