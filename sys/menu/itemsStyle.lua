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

local loadfile = loadfile
local pairs = pairs
local print = print
local type = type
local g = _G
local setmetatable = setmetatable

local sysCmd = require 'sys.cmd'


_ENV = _M

--------------------------------------------------
--------------------------------------------------

local function init_dat()
	local dat;
	local styleFile = 'menu\\main.stl'
	return function ()
		dat = {}
		local cmdsTab = sysCmd.get()
		setmetatable(dat,{__index = cmdsTab})
		local f = loadfile(styleFile,'bt',dat)
		if type(f) == 'function' then 
			f()
		end
	end,function()
		return dat or init()
	end
end

init,get = init_dat()
--------------------------------------------------
