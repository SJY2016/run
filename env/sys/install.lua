
------------------------------------------------------------------------------
local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local rpath,path = require 'sys.tools'.get_path(modname)
local msg = require (rpath .. 'msg' )
local keyword =  require (rpath .. 'keyword' )
_ENV = _M

local cbfs = {}
------------------------------------------------
function load()
end

function init()
end

function open()
end

function close()
end

load();
init();

------------------------------------------------




















