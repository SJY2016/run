--[[
/*
*Author:Sun JinYang
*Begin:
*Description:
*	
*Import Update Record:
*/
--]]
--[[

--]]
local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local rpath,path = require 'sys.tools'.get_path(modname)
local toolbarStyle = require(rpath .. 'toolbarStyle')
local itemsStyle = require(rpath .. 'itemsStyle')
local interface = require(rpath .. 'interface')

_ENV = _M

function init()
	toolbarStyle.init()
	itemsStyle.init()
	interface.init()
	
	interface.init_toolbarStyleTab(toolbarStyle.get())
	interface.init_itemsStyleTab(itemsStyle.get())
	
end

update = interface.update



