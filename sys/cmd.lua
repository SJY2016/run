local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local lfs = require 'lfs'

local g = _G
local trace_out = trace_out
local setmetatable = setmetatable
local pairs = pairs
local loadfile = loadfile
local type = type
local print = print

_ENV = _M

local dir = 'cmd/'
local cmds;

function init()
	cmds = {}
	setmetatable(cmds,{__index = g})
	init_tab()
end

function get()
	return cmds
end

function get_cmd(cmd)
	return cmds[cmd]
end

function init_tab()
	local file,mod;
	for line in lfs.dir(dir) do 
		if line ~= '.' and line ~= '..' then 
			file = dir .. line 
			if lfs.attributes(file,'mode') == 'file' then 
				local dat = {}
				setmetatable(dat,{__index = g})
				f = loadfile(file,'bt',dat)
				if type(f) == 'function' then 
					f()
				end
				for k,v in pairs(dat) do 
					if k ~= '__index' then 
						if not cmds[k] then 
							cmds[k] = v
						else 
							trace_out('The same function name : \"' .. k .. '\";\n')
						end
					end
				end
			end
		end
	end
end
