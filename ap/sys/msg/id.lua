local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local msg = require 'sys.msg'

local ID = ID
local type = type
local print = print
local pairs = pairs

_ENV = _M

local IdTime = ID;
local IdCmd = ID;

local Ids = {}

function get_timer_id()
	IdTime=IdTime+1;
	return IdTime;
end

function get_command_id()
	IdCmd=IdCmd+1;
	return IdCmd;
end

--tab = {action = function,...} --action 必定存在，如果不存在则无法响应相关的函数
function map(id,tab)
	Ids[id] = tab
end

local function run(id,sc)
	local dat =  Ids[id]
	if type(dat) ~= 'table' then return end 
	if type(dat.onClick) ~= 'function' then return end 
	if sc and dat.view then 
		return dat.onClick(sc)
	elseif not sc and dat.frame then 
		return dat.onClick()
	end
end

msg.add('on_command',run)
msg.add('frm_on_command',run)
msg.add('on_timer',run)

-------------------------------------------------------------------------------------------------------

