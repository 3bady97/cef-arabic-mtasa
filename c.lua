screenWidth, screenHeight = guiGetScreenSize() -- مقاسات الصفحة
windok3 =  guiCreateWindow(0.19, 0.12, 0.56, 0.81, "InfoHtml", true) -- لوحة gui عادية نصممها لنعرض داخلها html
guiSetAlpha(windok3, 0.00)  -- نخفي لوحة Gui 
local browser = guiCreateBrowser(0, 0, screenWidth, screenHeight, true, true, false,windok3) -- عرض المتصفح

guiSetVisible ( windok3, false ) -- اول ما نشغل المود نخفي الصفحة من الظهور

local theBrowser = guiGetBrowser( browser )

addEventHandler("onClientBrowserCreated", theBrowser, 
	function()
		loadBrowserURL(source, "http://mta/infolua/index.html") -- هنا اسم المود ومسار ملف ال html
	end
)


function ink3 ()
if guiGetVisible ( windok3 ) == false then
showCursor ( true )
guiSetVisible ( windok3, true)
  --setPlayerHudComponentVisible ( "all", false)  -- اخفاء الهود والخريطة
  --showChat(false) 
else
showCursor ( false)
guiSetVisible ( windok3, false)
  --setPlayerHudComponentVisible ( "all", true )  -- اظهار الهود والخريطة
  --showChat(true) 
end
end
bindKey ( "F5", "down", ink3 )



addEventHandler("onClientBrowserDocumentReady", browser,
    function ()
	local localPlayerName = string.gsub(getPlayerName(getLocalPlayer()),"#%x%x%x%x%x%x","") -- اسم اللاعب
    local money = getPlayerMoney(thePlayer) -- الفلوس حقت اللاعب
    local ping = getPlayerPing(localPlayer) -- Ping جودة الاتصال بالسيرفر
    local theSerial = getPlayerSerial( thePlayer ) -- السيريال
	--[[
	هنا يتم تحويل البيانات من lua
	الي html
	عن طريق Javascript
	وتظهر البيانات في صفحة html
	--]]
        executeBrowserJavascript(source, "document.getElementById('name').innerHTML = '" .. localPlayerName .. "'"); 
        executeBrowserJavascript(source, "document.getElementById('money').innerHTML = '" .. money .. "'");
        executeBrowserJavascript(source, "document.getElementById('ping').innerHTML = '" .. ping .. "'");
        executeBrowserJavascript(source, "document.getElementById('theSerial').innerHTML = '" .. theSerial .. "'");
    end)

	