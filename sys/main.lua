------------------------------------------------------------------------------
ap = {}
IUP = require 'sys.iup'
------------------------------------------------------------------------------
local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local type = type
local print = print
require 'sys.ap'
require 'sys.msg.on_sys_msg'

local sysCmd = require 'sys.cmd'
local sysMenu = require 'sys.menu.main'
local sysToolbar = require 'sys.toolbar.main'



_ENV = _M

local cmds = {}
function init()
	sysCmd.init()
	sysMenu.init()
	sysToolbar.init()
end

function load()
	
end


function update()
	sysMenu.update()
	sysToolbar.update()
end




reload  = function()
	init()
	load()
	update()
end
reload()






















