
require"sys.msg.on_sys_msg";
iup = require 'sys.iup'
------------------------------------------------------------------------------
local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local rpath,path = require 'sys.tools'.get_path(modname)
local msg = require (rpath .. 'msg' )
-- local install = require (rpath .. 'install' )
-- local keyword =  require (rpath .. 'keyword' )

_ENV = _M

------------------------------------------------
function load()
	msg.init()
	--keyword.init()
end

function init()
end



load();
init();

------------------------------------------------




















