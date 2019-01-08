--[[
/*
*Author:Sun JinYang
*Begin:
*Description:
*	
*Import Update Record:£¨Time Content£©
*/
--]]
--[[

--]]
local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local trace_out = trace_out;
local string = string
local print = print
local open = io.open
local tostring = tostring
local ap = ap

_ENV = _M

--------------------------------------------------
local turn_fileDat;
local path ='toolbar/'

--------------------------------------------------

local function init_dat()
	local dat;
	local styleFile = 'toolbar\\main.tbr'
	return function ()
		dat = turn_fileDat(styleFile)
	end,function()
		return dat or init()
	end
end

init,get = init_dat()
--------------------------------------------------

local function get_posTab(tab,st)
	if st == 1 then 
		return  tab
	else 
		return get_posTab(tab[#tab],st-1)
	end
end

local function get_infoTab(dat,st,lev,pathDat) 
	local name = dat[#dat].name
	if not pathDat then 
		pathDat = dat
	end
	if not pathDat[name] then 
		pathDat[name]  = {}
	end
	if lev == st then 	
		return  pathDat[name]
	else 
		return get_infoTab(dat[#dat],st,lev+1,pathDat[name]) 
	end
end

--[[
{
	{
		name = '';
		{};
		{};
	};
}
--]]
turn_fileDat =  function (file)
	local dat = {}
	local file =open(file)
	if not file then return end 
	local name,line,curTab,tempTab;
	repeat 
		line = file:read('*l') 
		local st = string.find(line or '','%S') 
		if st then 
			name = ap.trim(line) 		
			tempTab = {name =tostring( name)}
			curTab = get_posTab(dat,st,name)
			curTab[#curTab+1] = tempTab
		end
	until not line 
	file:close()
	return dat
end



