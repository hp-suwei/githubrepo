local apps = require "framework.apps"
local navigation = require "navigation"
local log = require "framework.log"
local ui = require "framework.ui"
local utils = require "framework.utils"
local base = require "framework.base"
local common = require "bookshelf.common"

local htmlParam = {textTime = "2分钟", priceImg = "images/pageb_052/detail@2x.png", coverImg = "images/pageb_052/pic@2x.png", html = "page52.html"}
local contentHeight,contentWidth,marginL,marginT,scaleResolution
local bgPath
local videoText={"美白润泽面膜和润泽眼膜这两款精华式贴膜所带来的全面尊享感受。其中的MelaCEP®美白复合物帮助肌肤改善黯沉，均匀净白，还原明亮光采；同时，贴膜材质饱含使肌肤倍感润泽的精华，让肌肤在温和舒适的状态下完成美白滋养的功效。"}
local lab1infos

function onCreated()
	rootView.backgroundColor = "#000000"
	checkData()
    contentUI(rootView)
	navigation.createindex()
	--navigation.createPageB(workspace, htmlParam)
	sandbox:getAppSandbox():put_value("html_param", htmlParam)
end

function contentUI(container)
	container:suspendLayout()
	local contentView = ui.view{id = "workspace", qName = "gestureView", height = contentHeight, width = contentWidth, marginTop = marginT, marginLeft = marginL, backgroundImage = bgPath, backgroundScale = "fill",overflow = "hidden"}
	local labw,labh = string.space(videoText[1],common.getExactFontSize(16, contentWidth),lab1infos.labWidth)
		contentView:addChild(ui.label{marginTop=lab1infos.labTop1,marginLeft=lab1infos.labLeft1,fontSize=common.getExactFontSize(16, contentWidth),height=labh,width=lab1infos.labWidth,color="#666666",lineSpace=4,wrap=true,text=videoText[1]})

	container:addChild(contentView)
	container:resumeLayout()
end

function checkData()
	contentHeight,contentWidth,marginL,marginT,scaleResolution = common.getWorkspaceInfo(rootView)
	local bgPath1610 = "images/052/bg@1610.jpg"
	local bgPath1612 = "images/052/bg@1612.jpg"
	local lab1param1612={labLeft1=78/828*contentWidth,
						labTop1=339/622*contentHeight,
						labWidth=290/828*contentWidth}
	local lab1param1610={labLeft1=162/994*contentWidth,
						labTop1=339/622*contentHeight,
						labWidth=294/994*contentWidth}
	
	if scaleResolution == common.SCALERESOLUTION1 then
		bgPath = bgPath1610
		lab1infos = lab1param1610
	elseif scaleResolution == common.SCALERESOLUTION2 then
		lab1infos = lab1param1612
		bgPath = bgPath1612
	else
		lab1infos = lab1param1610
		bgPath = bgPath1610
	end
end