--[[
	poprawic pozycje ikonek i niektorych elementow
]]--

local infoTable = {}
local loginEdit = {}
local loginButtons = {}
local versionString = [[
	MTA:DayZ
	
	Wersja: 0.2.0490
	Ostatnia aktualizacja: 19/06/2013]]

local screenX, screenY = guiGetScreenSize()

local font = {}
local scale = 1
if screenX < 1152 then
	screenX = screenX / 1152
end
if screenX < 1024 then
	outputChatBox("Zalecamy uzyc rozdzielczosci 1024x768, mniejsze moga kolidowac ze skryptami", 255, 0, 0)
end

font[-1] = guiCreateFont("fonts/font2.ttf", 12 * scale)
font[0] = guiCreateFont("fonts/font.ttf", 14 * scale)
font[1] = guiCreateFont("fonts/font.ttf", 24 * scale)
font[2] = guiCreateFont("fonts/font.ttf", 28 * scale)
font[3] = guiCreateFont("fonts/font.ttf", 32 * scale)

function createButton(x, y, width, height, text, bool, parent, info)
	button = guiCreateStaticImage(x, y, width, height, "images/login/button_standard.png", bool, parent or nil)
	table.insert(loginButtons, button)
	guiBringToFront(button)
	label = guiCreateLabel(0, 0, 1, 1, text, bool, button)
	guiBringToFront(label)
	setElementData(label, "parent", button)
	setElementData(button, "info", info)
	guiSetFont(label, font[1])
	guiLabelSetVerticalAlign(label, "center")
	guiLabelSetHorizontalAlign(label, "center")
	-- buttons
	addEventHandler("onClientMouseEnter", label, markButton, false)
	addEventHandler("onClientMouseLeave", label, unmarkButton, false)
	return label
end

function markButton()
	parent = getElementData(source, "parent")
	guiStaticImageLoadImage(parent, "images/login/button_mouse.png")
	setElementData(getLocalPlayer(), "clickedButton", parent)
	--playSound("sounds/login/button_click.ogg") -- na razie nie wlaczamy opcji dzwieku gdy kliknie sie w button
end

function unmarkButton(b, s)
	parent = getElementData(source, "parent")
	guiStaticImageLoadImage(parent, "images/login/button_standard.png")
	setElementData(getLocalPlayer(), "clickedButton", false)
end

function build_loginWindow()
	guiSetInputMode("no_binds_when_editing")
	showCursor(true)
	oldFile = xmlLoadFile("saccounts.xml")
	confFile = xmlLoadFile("@saccounts.xml")
	if not conFile and oldFile then
		local user = xmlNodeGetAttribute(oldFile, "username")
		local password = xmlNodeGetAttribute(oldFile, "password")
		-- ustawiamy atrybuty do zapamietania hasla
		xmlNodeSetAttribute(confFile, "username", user)
		xmlNodeSetAttribute(confFile, "password", password)
		xmlSaveFile(confFile)
	end
	if oldFile then
		xmlUnloadFile(oldFile)
	end
	confFile = xmlLoadFile("@saccounts.xml")
	if confFile then
		infoTable.account = xmlNodeGetAttribute(confFile, "username")
		infoTable.password = xmlNodeGetAttribute(confFile, "password")
	else
		confFile = xmlCreateFile("@saccounts.xml", "username")
		xmlNodeSetAttribute(confFile, "username", "")
		xmlNodeSetAttribute(confFile, "password", "")
		infoTable.account = getPlayerName(getLocalPlayer())
		infoTable.password = ""
	end
	
	xmlSaveFile(confFile)
	
	-- tworzymy buttony i inne elementy do panelu logowania
	background_front = guiCreateStaticImage(0.2, 0.25, 0.6, 0.5, "images/login/background_1.png", true)
	tab_front = guiCreateStaticImage(0, 0, 1, 0.075, "images/login/tab.png", true, background_front)
	headline = guiCreateLabel(0, 0.15, 1, 0.8, "MTA:DayZ - Welcome!", true, tab_front)
	guiSetFont(headline, font[2])
	guiLabelSetHorizontalAlign(headline, "center")
	guestInfo = guiCreateLabel(0.025, 0.1, 0.325, 0.3, versionString, true, background_front)
	guiSetFont(guestInfo, font[1])
	guiLabelSetHorizontalAlign(guestInfo, "center")
	guiLabelSetColor(guestInfo, 50, 255, 50)
	loginButton = createButton(0.1, 0.825, 0.175, 0.1, "Zaloguj", true, background_front, "login")
	loginInfo = guiCreateLabel(0.025, 0.46, 0.325, 0.175, "Panel logowania", true, background_front)
	guiSetFont(loginInfo, font[1])
	guiLabelSetHorizontalAlign(loginInfo, "center")
	guiLabelSetColor(loginInfo, 50, 255, 50)
	username = guiCreateLabel(0.025, 0.55, 0.325, 0.04, "Nazwa uzytkownika:", true, background_front)
	guiSetFont(username, font[0])
	guiLabelSetHorizontalAlign(username, "center")
	loginEdit[1] = guiCreateEdit(0.1, 0.6, 0.175, 0.055, infoTable.account, true, background_front)
	password = guiCreateLabel(0.025, 0.675, 0.325, 0.04, "Haslo:", true, background_front)
	guiSetFont(password, font[0])
	guiLabelSetHorizontalAlign(password, "center")
	loginIcon = guiCreateStaticImage(0.1, 0.46, 0.03, 0.05, "images/login/login_icon.png", true, background_front)
	loginEdit[2] = guiCreateEdit(0.1, 0.725, 0.175, 0.055, infoTable.pass, true, background_front)
	guiEditSetMasked(loginEdit[2], true)
	registerButton = createButton(0.45, 0.825, 0.175, 0.1, "Zarejestruj", true, background_front, "register")
	registerInfo = guiCreateLabel(0.375, 0.15, 0.325, 0.1, "Panel rejestracji", true, background_front)
	guiSetFont(registerInfo, font[1])
	guiLabelSetHorizontalAlign(registerInfo, "center")
	guiLabelSetColor(registerInfo, 50, 255, 50)
	username = guiCreateLabel(0.375, 0.25, 0.325, 0.04, "Nazwa uzytkownika:", true, background_front)
	guiSetFont(username, font[0])
	guiLabelSetHorizontalAlign(username, "center")
	loginEdit[3] = guiCreateEdit(0.45, 0.3, 0.175, 0.055, "", true, background_front)
	password = guiCreateLabel(0.375, 0.375, 0.325, 0.04, "Haslo:", true, background_front)
	guiSetFont(password, font[0])
	guiLabelSetHorizontalAlign(password, "center")
	loginIcon = guiCreateStaticImage(0.45, 0.15, 0.03, 0.05, "images/login/signup_icon.png", true, background_front)
	loginEdit[4] = guiCreateEdit(0.45, 0.425, 0.175, 0.055, "", true, background_front)
	guiEditSetMasked(loginEdit[4], true)
	password2 = guiCreateLabel(0.375, 0.5, 0.325, 0.04, "Powtorz haslo:", true, background_front)
	guiSetFont(password2, font[0])
	guiLabelSetHorizontalAlign(password2, "center")
	loginEdit[5] = guiCreateEdit(0.45, 0.55, 0.175, 0.055, "", true, background_front)
	guiEditSetMasked(loginEdit[5], true)
	newsH = guiCreateLabel(0.726, 0.115, 0.25, 0.05, "Nowosci:", true, background_front)
	guiSetFont(newsH, font[0])
	guiLabelSetHorizontalAlign(newsH, "center")
	guiLabelSetColor(newsH, 50, 255, 50)
	news_box1 = guiCreateStaticImage(0.73, 0.16, 0.244, 0.2, "images/login/news.png", true, background_front)
	guiSetAlpha(news_box1, 0.8)
	news1 = guiCreateLabel(0.025, 0.125, 1, 1, "-", true, news_box1)
	guiSetFont(news1, "default-bold-small")
	news_box1_new = guiCreateStaticImage(0, 0, 0.15, 0.1, "images/login/new.png", true, news_box1)
	guiSetVisible(news_box1_new, false)
	news_box2 = guiCreateStaticImage(0.73, 0.36, 0.244, 0.2, "images/login/news.png", true, background_front)
	guiSetAlpha(news_box2, 0.4)
	news2 = guiCreateLabel(0.025, 0.125, 1, 1, "-", true, news_box2)
	guiSetFont(news2, "default-bold-small")
	news_box2_new = guiCreateStaticImage(0, 0, 0.15, 0.1, "images/login/new.png", true, news_box2)
	guiSetVisible(news_box2_new, false)
	news_box3 = guiCreateStaticImage(0.73, 0.56, 0.244, 0.2, "images/login/news.png", true, background_front)
	guiSetAlpha(news_box3, 0.8)
	news3 = guiCreateLabel(0.025, 0.125, 1, 1, "-", true, news_box3)
	guiSetFont(news3, "default-bold-small")
	news_box3_new = guiCreateStaticImage(0, 0, 0.15, 0.1, "images/login/new.png", true, news_box3)
	guiSetVisible(news_box3_new, false)
	news_box4 = guiCreateStaticImage(0.73, 0.76, 0.244, 0.19, "images/login/news.png", true, background_front)
	guiSetAlpha(news_box4, 0.4)
	news4 = guiCreateLabel(0.025, 0.125, 1, 1, "-", true, news_box4)
	guiSetFont(news4, "default-bold-small")
	news_box4_new = guiCreateStaticImage(0, 0, 0.15, 0.1, "images/login/new.png", true, news_box4)
	guiSetVisible(news_box4_new, false)
	news_box = guiCreateStaticImage(0.726, 0.1, 0.25, 0.85, "images/login/box_background.png", true, background_front)
	guiCreateStaticImage(0.79, 0.114, 0.028, 0.045, "images/login/on.png", true, background_front)
end
 
function clickPanelButton(button, state)
	if button == "left" and state == "up" then
		local element = getElementData(getLocalPlayer(), "clickedButton")
		if element then
			local info = getElementData(element, "info")
			if info and info == "login" then
				do
					local username = guiGetText(loginEdit[1])
					local password = guiGetText(loginEdit[2])
					if #username >= 3 and #password >= 6 then
						triggerServerEvent("onClientSendLoginDataToServer", getLocalPlayer(), username, password)
					else
						reason = "Login nie moze byc krotszy niz 3 znaki, a haslo krotsze niz 6 znakow"
						outputChatBox("[LOGIN:] " .. reason, 200, 200, 200)
					end
				end
			elseif info and info == "guest" then
				showLoginWindow(false)
			elseif info and info == "register" then
				local username = guiGetText(loginEdit[3])
				local password1 = guiGetText(loginEdit[4])
				local password2 = guiGetText(loginEdit[5])
				if #username >= 3 and #password1 >= 6 then
					if password1 == password2 then
						triggerServerEvent("onClientSendRegisterDataToServer", getLocalPlayer(), username, password1)
					else
						reason = "Hasla roznia sie od siebie"
						outputChatBox("[REGISTER:] " .. reason, 200, 200, 200)
					end
				else
					reason = "Login nie moze byc krotszy niz 3 znaki, a haslo krotsze niz 6 znakow"
					outputChatBox("[REGISTER:] " .. reason, 200, 200, 200)
				end
			end
		end
	end
end

addEventHandler("onClientClick", getRootElement(), clickPanelButton)

function onClientGetNews(text1, text2, text3, text4, bool1, bool2, bool3, bool4)
	local text1 = string:gsub(text1, "<br>", "\n")
	local text2 = string:gsub(text2, "<br>", "\n")
	local text3 = string:gsub(text3, "<br>", "\n")
	local text4 = string:gsub(text4, "<br>", "\n")
	guiSetText(news1, text1)
	guiSetText(news2, text2)
	guiSetText(news3, text3)
	guiSetText(news4, text4)
	if bool1 == "true" then
	else 
		-- unhandled boolean indicator
	end
	guiSetVisible(news_box1_new, true)
	if bool2 == "true" then
	else 
		-- unhandled boolean indicator
	end
	guiSetVisible(news_box2_new, true)
	if bool3 == "true" then
	else 
		-- unhandled boolean indicator
	end
	guiSetVisible(news_box3_new, true)
	if bool4 == "true" then
	else 
		-- unhandled boolean indicator
	end
	guiSetVisible(news_box4_new, true)
end

addEvent("onClientGetNews", true)
addEventHandler("onClientGetNews", getRootElement(), onClientGetNews)
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), 
	function()
		build_loginWindow()
		guiSetVisible(background_front, false)
		showLoginWindow(true)
		guiSetInputMode("no_binds_when_editing")
		fadeCamera(true)
		setCameraMetrix(1468.8785400391, -919.25317382813, 100.153465271, 1468.388671875, -918.42474365234, 99.881813049316)
		triggerServerEvent("requestServerNews", getLocalPlayer())
end)

function hideLoginWindow(accountName, password)
	showLoginWindow(false)
	toggleSavePassword(accountName, password)
end

addEvent("onPlayerDoneLogin", true)
addEventHandler("onPlayerDoneLogin", getRootElement(), hideLoginWindow)

function toggleSavePassword(name, password)
	-- zapisujemy haslo i login do kolejnej wizyty
	confFile = xmlLoadFile("@saccounts.xml")
	xmlNodeSetAttribute(confFile, "username", name)
	xmlNodeSetAttribute(confFile, "password", password)
	xmlSaveFile(confFile)
end

function showLoginWindow(bool)
	setElementData(getLocalPlayer(), "clickedButton", false)
	showCursor(bool)
	if bool then
		guiSetPosition(background_front, 0.2, -0.75, true)
		addEventHandler("onClientRender", getRootElement(), rollLoginPanel)
		rollProgress = 1
		rollIn = true
		guiSetInputMode("no_binds_when_editing")
	else
		guiSetPosition(background_front, 0.2, 0.25, true)
		addEventHandler("onClientRender", getRootElement(), rollLoginPanel)
		rollProgress = 0
		rollIn = false
		guiSetInputMode("allow_binds")
	end
	randomDirAnim = math.random() > 0.5 and -1 or 1
	if math.random() > 0.5 then
	else
		-- unhandled boolean indicator
	end
	useXAxis = true
	animType = useXAxis and "InBounce" or "InElastic"
end

function rollLoginPanel()
	local eval
	if rollIn then
		if rollProgress > 0 then
			rollProgress = (rollProgress * 1000 - 15) / 1000
			if rollProgress < 0 then
				rollProgress = 0
			end
			eval = getEasingValue(rollProgress, animType)
		else
			removeEventHandler("onClientRender", getRootElement(), rollLoginPanel)
			return
		end
	elseif rollProgress < 1 then
		rollProgress = (rollProgress * 100 + 3) / 100
		if rollProgress > 1 then
			rollProgress = 1
		end
		eval = getEasingValue(rollProgress, "InQuad")
	else
		removeEventHandler("onClientRender", getRootElement(), rollLoginPanel)
		return
	end
	if useXAxis then
		guiSetPosition(background_front, 0.2, 0.25 + randomDirAnim * eval, true)
	else
		guiSetPosition(background_front, 0.2 + randomDirAnim * eval, 0.25, true)
	end
	guiSetVisible(background_front, true)
end
