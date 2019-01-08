local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local setmetatable = setmetatable
local ap = ap

local sysDisk = require 'sys.disk'

_ENV = _M

local file = 'app.lua'
-- sysDisk.file_require(file)

local app = {}

function init()
	app = {}
	if app.dat and app.dat.onInit  then 
		app.dat.onInit()
	end
end

function load()
	
end

-- local app = {Ids = {}} --

ap.getApp = function()
	return app
end

-- app.getIdDat = function(id)
	-- local t = {}
	-- setmetatable(t,{__index = app.Ids[id] or {}})
	-- return t
-- end

-- app.addIdDat = function(id,dat)
	-- app.Ids[id] = dat
-- end

-- app.initIds = function(ids)
	-- app.Ids = ids
-- end

app.init = function(dat)
	app.dat = dat
end



