--[[
/*
*Author:Sun JinYang
*Begin:2018年07月18日
*Description:
*	这个文件用
*Import Update Record:（Time Content）
*/
--]]
--[[
数据结构：
	
接口函数：
使用方式：
local cur = require ''.Class:new(oldTab or nil)
cur: ...
--]]
local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local lfs = require 'lfs'
local iup = IUP

local sub = string.sub
local string = string
local setmetatable = setmetatable
local print =print
local assert = assert
local type =type
local execute = os.execute
local ipairs = ipairs
local remove = os.remove


_ENV = _M

local path = 'res/'
local toolbarPath = 'res/toolbar/' 

--arg = {bmpfile,icons,}
function save_bmpfile(arg)
	local dstFile = toolbarPath .. arg.bmpfile
	make_toolbarBmpfile{dstFile =dstFile,icons =  arg.icons}
	return dstFile
end

function get_defaultBmp()
	return 'default.bmp'
end

------------------------------------------------------------------
--
save_bmpImage = function(file)
	local image = iup.LoadImage(file)
	iup.SaveImage(image,file, 'BMP')
end


--arg = {dstFile = ,icons = }
function make_toolbarBmpfile(arg)
	
	if lfs.attributes(arg.dstFile) then remove(arg.dstFile)  end 
	local str = 'convert +append '
	local file;
	for _,filename in ipairs(arg.icons) do
		file = toolbarPath .. filename
		if not lfs.attributes(file) then 
			file = toolbarPath .. 'default.bmp'
		end
		str = str .. ' ' .. '\"' ..file .. '\"'
	end	
	str = str .. ' ' ..  toolbarPath .. 'default.bmp'
	str = str .. ' ' .. arg.dstFile

	execute(str)
	
	local image = iup.LoadImage(arg.dstFile)
	if image then 
		iup.SaveImage(image,arg.dstFile, 'BMP')
	end
end

