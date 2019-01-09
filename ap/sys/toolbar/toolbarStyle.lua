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
local styleFile = 'toolbar\\main.tbr'
--------------------------------------------------

local function init_dat()
	local dat;
	
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
		return get_posTab(tab[#tab] or tab,st-1)
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
	local linePos = 0
	repeat 
		line = file:read('*l') 
		linePos = linePos + 1
		local st = string.find(line or '','%S') 
		if st then 
			local headStr = string.sub(line,1,st -1)
			if string.find(headStr,' ') then 
				trace_out('File :\"' .. styleFile  .. '\" , Line : "' .. linePos .. '\" !  Format Error (Please use the \"Tab\" key for typesetting . ) !\n')
			end
			name = ap.trim(line) 		
			tempTab = {name =tostring( name)}
			curTab = get_posTab(dat,st,name)
			curTab[#curTab+1] = tempTab
		end
	until not line 
	file:close()
	return dat
end



