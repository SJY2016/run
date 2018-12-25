--[[
/*
*Author:Sun JinYang
*Begin:2018��08��03��
*Description:
*	����ļ����������Ѿ����õĳɷֲ������ࡣ
*Import Update Record:��Time Content��
*/
--]]
--[[
���ݽṹ��
	toolbar & menu :
		name:ֵΪstring���ͣ�����keyword��Ӧ��ʾ�����ơ�
		remark:ֵΪstring���ͣ����õı�ע��Ϣ��
		action:ֵΪfunction���ͣ��������ִ�еĺ�����
		view:ֵΪboolean���ͣ�view�����µ�����á�ȱʡֵΪtrue
		frame:ֵΪboolean���ͣ���view�����µ�����á�ȱʡֵΪtrue
		image:ֵΪstring���ͣ�ͼ������ơ�����:'a.png'
		enable:ֵΪboolean���ͻ��߷���booleanֵ��function���ͣ���ť�Ƿ���������״̬��������ûҵ�״̬����ȱʡֵΪtrue
		checkbox:ֵΪboolean���ͣ����ù�������ť�ķ����ʽΪ���º�ֱ�ӵ���ȱʡΪ���º���������
		shortcut:
		hotkey:ֵΪstrig���ͣ���Ӧ�ȼ���Ϣ
	leftDlg :
	
����keys��
	onLoad:
	onUnload;
	onAction:
	action:
	
		
ע�⣺
	����ϵͳapp�Ͳ��������ʽ��ϵͳ��app��������app����ʱ��̬��ӣ�������ڰ�װ�����������Ҫ����db�����ļ��õ���app���ص����ݲ���Ҫ�κα仯Ҳ���洢������db�ļ������������Ҫ��action��Ӧ���ַ���ת������ʵ�ĺ������д���
�ӿں�����
ʹ�÷�ʽ��
local cur = require ''.Class:new(oldTab or nil)
cur: ...
������ʽ��
	db = {
		key1 = {action = '',name =,view =,...};
		key2 = {action = '',name =,view =,...};
	}
--]]
local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local rpath,path = require 'sys.tools'.get_path(modname)
local sysDisk = require (rpath .. 'disk')
local lfs = require 'lfs'


local setmetatable = setmetatable
local type =type
local print =print
local assert = assert
local ipairs = ipairs
local pairs = pairs
local next = next
local string = string
local sub = string.sub
local sort = table.sort
local unpack =  table.unpack
local error = error
local table = table


_ENV = _M

local objPlugin = classPlugin:new()
local confPath = 'config/plugins/'
local fileUser = confPath .. 'keywords.lua'


--------------------------------------------------

local init_db;
local update_db;
local get_db;
local save_db;

local init_keywordDat;
local update_keywordDat;


--------------------------------------------------

local Keyword = {} 
Class = Keyword

function Keyword:new(t)
	t = t or {}
	setmetatable(t,self)
	self.__index = self
	return t
end


--self:get_all;
--self:get_keywordDat
--self:add_keyword;

--------------------------------------------------
--[[
	db = {
		key1 = {pluginName = ,action = '�ļ� +.������' ����'������' + file����,file = '',}
		...;
	}	
--]]
init_db = function()
	local db;
	return function()
		db = sysDisk.file_read(fileUser) or {}
		update_keywordDat()
		return db
	end,function()
		return db or update_db()
	end,function(db)
		sysDisk.file_save(fileUser,db)
		update_db()
	end
end

update_db,get_db,save_db = init_db()
--------------------------------------------------
--ע��keywordDat����һ�������������ļ��У�������֣�keyֵ��Ӧ����true����һ��������ϵͳ����app�õ��ģ�keyֵ��Ӧ�������ݱ���

local function get_iconFile(tab,key)
	--���Ҳ��Ŀ¼�µ��ļ�
	local curFile = objPlugin:get_installedPluginPath() .. tab[key]
	if  sysDisk.file_exist(curFile) then 
		return curFile
	end
	--����ϵͳ·��
	curFile =tab[key]
	if  sysDisk.file_exist(curFile) then 
		return curFile
	end
	return tab[key]
end

local function deepcopy(tab,newTab)
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


init_keywordDat = function()
	local keywordDat;
	return function()
		keywordDat  = keywordDat or {}
		local db = get_db()
		db = deepcopy(db)
		for k,keyDat in pairs(db) do 
			keywordDat[k] = {}
			setmetatable(keywordDat[k],
				{
					__index = function(tab,key)
						local cur = keyDat[key]
						if not cur then return end 
						if type(cur) == 'table' and cur.type == 'function' then 	
							local tab = keyDat;
							local modFun;
							if string.find(cur.value,'%.') then 
								local fileName,funName =string.match(cur.value,'(.+)%.'),string.match(cur.value,'.+%.([^%.]+)')
								local file = objPlugin:get_installedPluginPath(tab.plugin) .. fileName .. '.lua'
								local mod = sysDisk.file_require(file)
								if mod and mod[funName] then 
									modFun = mod[funName]
								end
							elseif cur.file then 
								local file = objPlugin:get_installedPluginPath(tab.plugin) .. cur.file
								local mod = sysDisk.file_require(file)
								if mod and mod[cur.value] then 
									modFun = mod[cur.value]
								end
								
							elseif tab.file then 
								local file = objPlugin:get_installedPluginPath(tab.plugin) .. tab.file
								local mod = sysDisk.file_require(file)
								if mod and mod[cur.value] then 
									modFun = mod[cur.value]
								end
							end
							if cur.exe and modFun then 
								keyDat[key] =modFun()
							elseif modFun then 
								keyDat[key] =modFun
							else 
								keyDat[key] = function() error('Fuction Missing !') end
							end
							return keyDat[key] 
						end
						return cur
					end
				}
			)
		end	
		return keywordDat
	end,function(self,dat,delete)
		if not keywordDat then update_keywordDat() end
		if not dat.keyword then return end 
		if delete then 
			keywordDat[dat.keyword] = nil
		else 
			keywordDat[dat.keyword] = dat
		end
		return 
	end,function(self,key)
		if not keywordDat then update_keywordDat() end
		if not key then return end
		return type(keywordDat[key]) == 'table' and keywordDat[key]
	end,function(self)
		if not keywordDat then update_keywordDat() end
		return keywordDat
	end
end

update_keywordDat,Keyword.add_keyword,Keyword.get_keywordDat,Keyword.get_all = init_keywordDat()
--------------------------------------------------

