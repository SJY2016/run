local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local lfs = require 'lfs'

local ap = ap
local g = _G
local setmetatable = setmetatable
local loadfile = loadfile
local type = type

_ENV = _M

local file = 'app.lua'
local app = {}

function init()
	app = {}
	setmetatable(app,{__index = g})
end

function load()
	local f = loadfile(file,'bt',app)
	if type(f) == 'function' then 
		f()
	end
end

function update()
end



