local navigation=require "navigation"
local ui = require "framework.ui"
local common = require "bookshelf.common"
local log = require "framework.log"




function onCreated( )
	rootView.backgroundColor="white"
	 contentUI(rootView)
	 navigation.createindex()
	 --local a,b=34,43
	 --loca c ,d=48,59
	 
end

function contentUI(container)
	container:suspendLayout()
	local param = {}
	local path1612 = {bgpath="images/1000/bg@1612.jpg"}
	local path1610 = {bgpath="images/1000/bg@1610.jpg"}
	local contentwidth,contentheight,marginL,marginT,scaleResolution = common.getWorkspaceInfo(rootView)
	if scaleResolution==common.SCALERESOLUTION1 then
		param=path1610
	elseif scaleResolution==common.SCALERESOLUTION2 then
		param=path1612
	else 
		param=path1610
	end
	-- alert("123")
	-- container:addchild(ui.button{width=200,height=100,margin="auto 0 0 auto",backgroundColor="red",label="蓝狐七夕",color="#ffffff",fontSize=50})
	-- alert("1234")
	local view = ui.view{id="workspace",qName="gestureView",width=contentheight,height=contentwidth,marginTop=marginT,marginLeft=marginL,backgroundImage=param.bgpath,backgroundScale="fill"}
	local bt1 = ui.button{id="bt1",width=200,height=100,marginRight=0,marginBottom=0,backgroundColor="blue",label="蓝狐七夕",color="#ffffff",fontSize=50,onclick=function()
		
		createbt1()
		
	end}
	local box = ui.view{width=0.5*view.width,height=0.25*view.height,marginTop=0,marginLeft=0.25*view.width,backgroundColor="black"}
	box:addChild(ui.textfield{id="x",width=0.25*box.width,height=0.5*box.height,keyboard="number",backgroundColor="grey"})
	box:addChild(ui.button{width=0.25*box.width,height=0.5*box.height,marginLeft=0.25*box.width,backgroundColor="red",label="单价",color="#8F8F8F",onclick=function( )
		local a
		local x = _G["x"].text
		--alert(x)
		if x==nil or x=="" then
			x=0
		else 
			x=tonumber(x)
		end
		a=x+1

		_G["x"].text=a
		--alert(a)
		
	end})
	box.addChild(ui.button{width=0.25*box.width,height=0.5*box.height,marginLeft=0.5*box.width,marginTop=0,backgroundColor="red",label="清空",color="#8F8F8F",onclick=function (  )
		_G["x"].text=""
		_G["y"].text=""
		_G["sum"].text=""
	end})
	box:addChild(ui.textfield{id="y",width=0.25*box.width,height=0.5*box.height,marginLeft=0,marginTop=0.5*box.height,keyboard="number",backgroundColor="grey"})
	box:addChild(ui.button{width=0.25*box.width,height=0.5*box.height,marginLeft=0.25*box.width,marginTop=0.5*box.height,backgroundColor="red",label="数量",color="#8F8F8F",onclick=function (  )
		local a 
		local y = _G["y"].text
		if y==nil or y=="" then
			y=0
		else 
			y=tonumber(y)
		end
		a=y+100
		_G["y"].text=a
		--alert(a)
		
	end})
	box:addChild(ui.button{width=0.25*box.width,height=0.5*box.height,marginLeft=0.5*box.width,marginTop=0.5*box.height,backgroundColor="red",label="合计",color="#8F8F8F",onclick=function (  )
		local x = _G["x"].text
		local y = _G["y"].text
		if x==nil or x=="" then
			x=0
		else
			x=tonumber(x)
		end
		if y==nil or y=="" then
			y=0
		else
			y=tonumber(y)
		end
		--alert(x..y)
		_G["sum"].text=x*y
		--alert(_G["sum"].text)
	end})
	box:addChild(ui.textfield{id="sum",width=0.25*box.width,height=0.5*box.height,marginLeft=0.75*box.width,marginTop=0.5*box.height,backgroundColor="grey"})
	view:addChild(bt1)
	view:addChild(box)
	container:addChild(view)
	container:resumeLayout()
end


function createbt1()
	if not btview1 then
		local btview1 = ui.button{id="btview1",width=200,height=100,margin="0 auto auto 0",backgroundColor="blue",label="阿拉贡",color="#ffffff",fontSize=50,onclick=function( )
			createbt2()
		end}

		workspace:addChild(btview1)
		--alert("123")
	else
		_G["btview1"].hidden=false
	end
end

function createbt2(  )
	if not btview2 then
		local btview2 = ui.button{id="btview2",width=200,height=100,margin="0 0 auto auto",backgroundColor="blue",label="范斯高",color="#ffffff",fontSize=50,onclick=function(  )
			createbt3()
		end}
		workspace:addChild(btview2)
	else 
		_G["btview2"].hidden=false
	end
end

function createbt3(  )
	if not btview3 then
		local btview3 = ui.button{id="btview3",width=200,height=100,margin="auto auto 0 0",backgroundColor="blue",label="景福宫",color="#ffffff",fontSize=50,onclick=function()
			createbt4()
		end}
		workspace:addChild(btview3)
	else
		_G["btview3"].hidden=false
	end
end

function createbt4(  )
	if not btview4 then
		local btview4 = ui.button{id="btview4",width=200,height=100,margin="auto auto auto auto",backgroundColor="blue",label="东方红",color="#ffffff",fontSize=50,onclick=function()
			--alert("11111")
			_G["btview4"].hidden=true
			_G["btview1"].hidden=true
			_G["btview2"].hidden=true
			_G["btview3"].hidden=true
			log.debug("11111")
			--alert("22222")
		end}
		workspace:addChild(btview4)
	else
		_G["btview4"].hidden=false
	end
end


