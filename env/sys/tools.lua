--[[
/*
*Author:Sun JinYang
*Begin:2018��07��03��
*Description:
*	���ļ�ʵ��ͨ�õ�api����
*Import Update Record:��Time Content��
*/
--]]
--[[
���ݽṹ��
�ӿں�����
	get_path(modname)
		return:
			rpath:��ǰ�ļ������ļ��еļ���·�������磺'app.greenmark.'
			path:��ǰ�ļ������ļ���·�������磺'app/greenmark/'
	require = get_lowerRequire()
		require �ļ�ʱ���ļ�·��ȫ��Сд��
	hash_string(str)
		�����ַ�����hashֵ��
		return ��string
	hash_file(file)
		�����ļ���hashֵ��
		return ��string
	get_guid()
		����global id��
--]]
local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local luaext = require 'luaext'
local crypto = require"crypto"
local sysDisk = require 'sys.disk'

local lower = string.lower
local match = string.match
local gsub = string.gsub
local assert = assert
local type = type
local print = print
local require = require
local string = string
local pairs = pairs

_ENV = _M

--modname ����ֵ������������ͬһ���ļ�app/greenmark/element/element.lua
--�������: app.greenmark.element.element
--ģ�ͼ��أ�app/greenmark/element/element
function get_path(modname)
	
	assert(type(modname) == 'string')
	-- print(modname)
	modname = gsub(modname,'/','.')
	modname = gsub(modname,'\\','.')
	local rpath = lower(match(modname,'(.+%.)[^%.]+'))
	local path = gsub(rpath,'%.','/')
	return rpath,path
end

function get_upRpath(rpath)
	return string.match(rpath,'(.+%.)[^%.]+%.')
end


function get_lowerRequire()
	return function(str)
		return require (lower(str))
	end
end

function hash_string(str)
	local dig = crypto.digest;
	if not dig then return nil end
	local d = dig.new("sha1");
	local s = d:final(str);
	d:reset();
	return s;
end

function hash_file(file)
	if type(file)~='string' then return end
	local str = sysDisk.file_read(file,true)
	if not str or str == '' then return '0kb' end 
	return hash_string(str);
end

function get_guid()
	return luaext.guid()
end

function deepcopy(tab,newTab)
	if type(tab) ~= 'table' then return {} end 
	local newTab = newTab or {}
	for k,v in pairs(tab) do 
		if type(v) ~= 'table' then 
			newTab[k] = v
		else 
			newTab[k] = {}
			deepcopy(v,newTab[k])
		end
	end
	return newTab
end
