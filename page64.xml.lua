local apps = require "framework.apps"
local navigation = require "navigation"
local log = require "framework.log"
local ui = require "framework.ui"
local utils = require "framework.utils"
local base = require "framework.base"

local rootHeight
local rootWidth
local nodegroup = {}
local contentAlpha
local deviceInfo = base.getDeviceInfo()
if deviceInfo["os.name"] == "IOS" then
 	 contentAlpha = 0.9
else
	 contentAlpha = 0.95
end
function onCreated()
	navigation.createPageB("防晒系列\n——艳阳下的娇柔","2分钟") 
    contentUI(rootView)
    navigation.createindex()
    rootView.onSwipe = function(direction)
	if direction == "left" and nodegroup[1] then
		if navigation.currentPopUpView then
					navigation.currentPopUpView.hidden = true
				end
		navigation.movenode(0.06*rootWidth,nodegroup[1])
		log.debug("1111111111")
		table.remove(nodegroup,1)
	else
		navigation.addnodeswipe(direction)
	end
end
			--following is for creating pageb
	
	
end

function contentUI(container)
	rootWidth = rootView.width
	rootHeight = rootView.height
	local allbtn = {}
	log.debug(rootWidth)
	container:suspendLayout()
	container:addChild(ui.image{scale = "fill",marginTop=0,marginLeft=0,height=rootHeight,width=rootWidth,src="images/64-2-a/bg.jpg",backgroundColor  = "blue"})
	
	local filePath1 = "images/64-2-a/title.png"
	local imgWidth1,imgHeight1 = navigation.getImgWidthHeight(filePath1)
	local displayHeight1 = imgHeight1/imgWidth1*rootWidth*0.7
	container:addChild(ui.image{marginLeft=0,height=0.893*rootHeight,scale="fill",width = rootWidth,marginTop=0.074*rootHeight,src=filePath1})
	
	local coord={
					{ 0.548*rootHeight,0.023*rootWidth,'舒怡防晒霜', '￥135',1},
					{ 0.362*rootHeight,0.33*rootWidth,'舒怡防晒霜', '￥135',1},
					{ 0.322*rootHeight,0.715*rootWidth,'晒后修护露', '￥135',2},
				}
	navigation.detailPopUp(coord,container)
	local description = "紫外线照射不仅会使肌肤晒黑、晒伤，接近90%的肌肤老化都是因为外源性光老化的原因。\r\n玫琳凯全新防晒护肤系列，提供不同防晒系数的防晒产品，有效抵御紫外线UVA/UVB，保护皮肤免受日晒伤害。同时提供晒后修复，让你尽情享受与艳阳的亲密接触。"
	local stringWidth,stringHeight = string.space(description,12,0.88*rootWidth-40,0,5)
   
    local contentVbox = ui.vbox{id="content_Vbox",backgroundAlpha = contentAlpha,marginBottom=20,marginLeft=rootWidth,backgroundColor="#ffffff",height=stringHeight+40,width=0.88*rootWidth}
	contentVbox:addChild(ui.view{height = 20})
 	contentVbox:addChild(ui.label{width =stringWidth,wrap="true",height = stringHeight, text = description, color = "#333333",fontSize = 12,marginLeft = 20,lineSpace=5})
	contentVbox:addChild(ui.view{height = 20})
	container:addChild(contentVbox)
	 
    table.insert(nodegroup,content_Vbox)
	container:resumeLayout()
end

	