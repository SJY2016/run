--[[
/*
*Author:Sun JinYang
*Begin:2017��12��13��
*Description:
*	���ļ������������԰汾��ع��ܡ�
*Record:��Time Content��
*		2018��4��2�� �����Ը�Ϊ���ģʽ
*/
--]]
--[[
���ݽṹ��
	���԰汾�������ݱ�ṹ��
		[ver]:keyֵΪstring���ͣ����԰汾����д��ʽ���ļ������ƣ�����ӦֵΪtable�ṹ��table�а����������������£���������ļ�������ʱ������Ϊnil��
			confPath:ֵΪstring���ͣ�lang.conf�ļ���ȫ·����
			confDat:ֵΪtable���ͣ�����lang.conf�ļ��д洢�����ݣ�����ʹ��ʱ�Żḳֵ,ÿ��id��Ӧ��ֵ���ڳ�ʼ��ʱת��Ϊascֵ����
			readmePath:ֵΪstring���ͣ�readme.lua�ļ���ȫ·��
			readmeDat:ֵΪtable���ͣ�readme.lua�ļ���ŵ�����
			actionPath:ֵΪstring���ͣ�action.lua�ļ���ȫ·��
			actionRequireMod��ֵΪtable���ͣ�require�ļ���
Lang/ �ļ�˵����
	readme.lua�ļ��ж��嵱ǰ������Ϣ��Ŀǰ��֧�ֵ������У�
		name:ֵΪstring���ͣ���ǰ���԰������ơ�
		transcoding:ֵΪboolean���ͣ���ֵΪtrueʱ�����԰��е����Ի��������ļ��ڶ�дʱ��Ҫת�����롣��ϵͳʶ��ASC2���룬���������ʽ���ı���Ҫת����ASC2�룩��
	lang.conf�ļ��д�ŵ��ǵ�ǰ���԰��а��������ݡ�
config/Lang/ �ļ�˵����
	user_lang_ver.conf 
		��¼�û�ʹ�õ����԰汾��
	en/
	zh/
	...
	���԰汾�ļ��д�Ų����װ�����ڲ�ʹ�õ����Ի�����
	�����ַ���
		' ':���ո������ַ���������ݿո�ǰ����ַ����ֱ���Ҳ������ϳ��µ��ַ�����
		"&"����&���ŷָ��id��ʶ��ʱ�ᱻ�滻�ɿո�����ո�ͬ���ǣ���en�����²���ֶβ��ң����û�����Ӧ��ֵ���Զ���ȡ�ַ�ǰ��������Ϊ��ʾ���ݡ�
		"&&"����&&���ŷָ��id��ʶ��ʱ�ᱻ�滻�ɿո�����&��ͬ�����ǽ�ȡ�ַ����������Ϊ��ʾ���ݡ�[MalA
�ӿں���:
	Class:new(groupName)
		�������Զ���
		groupName:����ֵΪstring���ͣ����÷������ơ���������ʹ���ļ�·���ķ�ʽ����֤������Ψһ�ԡ�����������ʹ�õ�key���飬Ҳ����������ʹ�ý������������Ҫ��¼�����ݡ���
			ע�⣺�������������ʹ��/�ָ��ļ�����·�������� "app/greenmark/dlgs/dlg_assigning"
	Class:change(langVer)
		�л����԰汾.ͬʱ������Ӧ�����Ի�����
		langVer:����ֵΪstring���͡����԰汾,����:zh,en ... 
	Class:get_ver()
		��õ�ǰ���԰汾��
		return������ֵΪstring���͡�
	Class:get_list()
		��ð汾�б�
		return:����ֵΪtable���͡����ַ�����ɵ�����ṹ�ı��磺{'en','zh'}
	Class:get_ver_name_list()
		��ð汾�б���Ӧ���ֵı�
		return:����ֵΪtable���͡��ɱ���ɵ�����ṹ�ı��ӱ�Ľṹ���£�
			ver:ֵΪstring���ͣ��汾����
			name:ֵΪstring���ͣ��汾��Ӧ�����ơ�
	Class:get_name(ver)
		��ð汾��Ӧ�����ơ�����zh�汾��Ӧ������Ϊ"���ļ���"��
		ver:ֵΪstring����,�汾���ƣ����������������ʹ�õ�ǰ�汾��
		return:����ֵΪstring���͡�
	Class:get_id_name(id,ver)
		�����id��Ӧ����ذ汾��ֵ��
		id��ֵΪstring���ͣ���������idֵ��
		ver:ֵΪstring���ͣ����԰汾ֵ��û����ʹ�õ�ǰ�汾��
		return:����ֵΪstring���ͣ�����ҵ���Ӧ�İ汾ֵ���򷵻ظ�ֵ�����û���ҵ���ԭ�����ء�������������ַ�����ο������ַ�ʹ�÷�����
	Class:reg_update(fun)
		ע����º��������л����԰汾ʱ���������ø��º�����
		ʹ�ó�����
			��ģ̬�Ի����ڵ������л�����ʱ���¶Ի�����ʾ�����ԡ�
			�˵����������Ƚ������Եĸ��¡�
		fun������ֵΪfunction���͡����º���
	Class:update()
		�������º��������ø������
	Class:close()
		���Թرպ���������֪�ĳ��������ر�ʱ�����Ե��ô˺����ر����Ե�ǰ������Ե��á�
		�ر���,ע����������ǲ��������:app/greenmark/����Ϊ��ж��greenmark ���app��ô���Զ��ر����а���app/greenmark/�������Ƶ��顣
ʹ�÷���:
	local lang = Class:new('GroupName')
	lang:change('zh') --�л����԰汾
	lang:close() --
	...
ע�⣺
	����id�Ĳ��ҷ�ʽ��groupName�а���app�����Ȳ���config�ļ����¡�appName��/lang/���������lang�ļ������������readme.lua�ļ���ȡ��app���������õ������Ϣ��
--]]
local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local sys_disk_ = require 'sys.disk'
local lfs = require 'lfs'
local luaext_ = require 'luaext'

local ipairs = ipairs
local pairs = pairs
local type = type
local getmetatable = getmetatable
local setmetatable = setmetatable
local print = print
local assert = assert
local table = table
local string = string

_ENV = _M

--------------------------------------------------------------
--define var
--Ver : version
local dirLang = 'lang/'
local dirUser = 'config/'
local dirUserLang = dirUser .. 'lang/'

local filenameIdConf = 'id.conf'
local fileIdConf = dirLang .. filenameIdConf
local filenameReadme = 'readme.lua'
local filenameLangConf  = 'lang.conf'
local filenameAction = 'action.lua'
local filenameLangVerConf = 'user_lang_ver.conf'
local fileUserLangVer = dirUserLang .. filenameLangVerConf
local defaultLangVer = 'en'

local get_user_ver;
local change_user_ver;

local get_ids;
local update_ver_dat;
local get_ver_dat;
local update_readme_dat;
local update_conf_dat;

local get_ver_list;
local get_ver_name;
local get_ver_env;
local get_ids_name;
local get_id_name;

local init_group_dat;
local add_group_name;
local add_group_id;
local get_group_ids;
local add_group_update;


--------------------------------------------------------------
--����ӿ�
local Lang = {}
Class = Lang

function Lang:new(groupName)
	assert(type(groupName) == 'string')
	local t = {}
	setmetatable(t,self);
	self.__index = self;
	t.groupName= groupName
	add_group_name(groupName)
	return t
end


function Lang:change(langVer)
	change_user_ver(langVer)
	self:update()
end

function Lang:get_ver()
	return get_user_ver()
end

function Lang:get_list()
	return get_ver_list()
end

function Lang:get_ver_name_list()
	local dat = self:get_list()
	local t = {}
	for k, v in ipairs(dat) do 
		t[k] = {ver = v,name = self:get_name(v)}
	end
	return t
end

function Lang:get_name(ver)
	return get_ver_name(ver)
end

function Lang:get_id_name(id,ver)
	add_group_id(self.groupName,id)
	return get_id_name(id,ver)
end

function Lang:reg_update(fun)
	add_group_update(self.groupName,fun)
end

function Lang:update()
	run_update()
end

function Lang:close(appClose)
	delete_group(self.groupName,appClose)
end

--------------------------------------------------------------
--�ڲ��ӿ�
local load_file = sys_disk_.file_read
local save_file = sys_disk_.file_save

local function init_coding()
	local function gets(fun,t)
		local newT= {}
		for k,v in pairs(t) do 
			newT[k] = fun(v);
		end
		return newT
	end

	local cmds = {}
	cmds['utf-8'] = {
		get = luaext_.u82a,
		set =luaext_.a2u8,
		gets = function(t) 
			return gets(luaext_.u82a,t) 
		end,
		sets = function(t) 
			return gets(luaext_.a2u8,t) 
		end
	}
	return function(str,funName,...)
		return cmds[str] and cmds[str][funName] and cmds[str][funName](...)
	end
end

local turn_coding = init_coding()

local init_user_ver = function()
	local file  = fileUserLangVer
	local userVer;
	return function()
		if not userVer then
			local t = load_file(file)
			userVer = t and t.currentLangver or defaultLangVer
		end
		return userVer
	end,
	function(ver)
		userVer = ver
		lfs.mkdir(dirUserLang)
		save_file(file,{currentLangver = ver})
	end
end

get_user_ver,change_user_ver = init_user_ver()

local init_ids = function()
	local file = fileIdConf
	local ids;
	return function()
		if not ids then 
			ids = load_file(file)
			assert(type(ids) == 'table')
		end
		return ids
	end
end

get_ids = init_ids()


local init_ver_dat = function()
	local dir = string.sub(dirLang,1,-2)
	local userDir = dirUserLang 
	lfs.mkdir(dirUserLang)
	local dat;
	return function()
		dat = {}
		for entry in lfs.dir(dir) do 
			if entry ~= '.' and entry ~= '..' then 
				local path = dir .. '/' .. entry
				local attr = lfs.attributes(path)
				assert(type(attr)=="table") --�����ȡ�������Ա��򱨴�
				if(attr.mode == "directory") then
					local file = path .. '/' .. filenameLangConf
					local attrLang = lfs.attributes(file)
					if attrLang then 
						dat[entry] = {}
						local t = dat[entry]
						t.confPath = file
						if lfs.attributes(path .. '/' .. filenameReadme) then 
							t.readmePath = path .. '/' .. filenameReadme
						end
						if lfs.attributes(path .. '/' .. filenameAction) then 
							t.actionPath = path .. '/' .. filenameAction
						end
						if lfs.attributes(userDir .. entry .. '.conf') then 
							t.userConfPath = userDir .. entry .. '.conf'
						end
					end
				end
			end
		end
	end,function()
		if not dat then update_ver_dat() end
		return dat
	end
end

update_ver_dat,get_ver_dat = init_ver_dat()

update_readme_dat = function(ver,dat)
	local dat = dat or get_ver_dat()
	local ver =ver or  get_user_ver()
	local t = dat[ver]
	assert(type(t) == 'table')
	if  not t.readmePath then return end 
	if not t.readmeDat then 
		t.readmeDat = load_file(t.readmePath)
		assert(type(t.readmeDat) == 'table')
		if t.readmeDat.name then 
			if t.readmeDat.transcoding and t.readmeDat.coding then 
				t.readmeDat.name = turn_coding(t.readmeDat.coding,'get',t.readmeDat.name) or t.readmeDat.name
			end
		end
	end
end

update_conf_dat = function(ver,dat)
	local dat = dat or get_ver_dat()
	local ver =ver or  get_user_ver()
	local t = dat[ver]
	assert(type(t) == 'table')
	assert(t.confPath)
	if not t.userConfDat and  t.userConfPath then 
		t.userConfDat = load_file(t.userConfPath)
		assert(type(t.userConfDat) == 'table')
		if t.readmePath then 
			if  not t.readmeDat then update_readme_dat(ver,dat) end
			if t.readmeDat.transcoding and t.readmeDat.coding then 
				t.userConfDat = turn_coding(t.readmeDat.coding,'gets',t.userConfDat)
			end
		end
	end
	if not t.confDat then 
		t.confDat = load_file(t.confPath)
		assert(type(t.confDat) == 'table')
		if t.readmePath then 
			if  not t.readmeDat then update_readme_dat(ver,dat) end
			if t.readmeDat.transcoding and t.readmeDat.coding then 
				t.confDat = turn_coding(t.readmeDat.coding,'gets',t.confDat)
			end
		end
	end
end

get_ver_list = function ()
	local dat = get_ver_dat()
	local list = {}
	for k,v in pairs(dat) do 
		list[#list+1] = k
	end
	table.sort(list)
	return list
end

get_ver_name = function (ver)
	local ver =ver or  get_user_ver()
	local dat = get_ver_dat()
	local t = dat[ver]
	if not t then  return end 
	if  not t.readmeDat then update_readme_dat(ver,dat) end
	return t.readmeDat and t.readmeDat.name or ver
end

get_ver_env = function(ver)
	local ver =ver or  get_user_ver()
	local dat = get_ver_dat()
	local t = dat[ver]
	if not t then  return end 
	if  not t.confDat then update_conf_dat(ver,dat) end
	return t.confDat
end

get_id_name = function(id,ver)
	if not id then return end 
	local env = get_ver_env(ver)
	if not env then return end
	local newId = string.gsub(id,'&+',' ')
	local str = env[newId] or env[string.lower(newId)]
	if str then return str end

	local ver =ver or  get_user_ver()
	local saveSpace = ''
	if ver == 'en' then 
		saveSpace = ' '
	end
	local name;
	if string.find(id,'&&') and ver == 'en' then 
		return string.match(id,'&([^&]+)')
	elseif string.find(id,'&') and ver == 'en' then 
		return string.match(id,'[^&]+')
	end

	if string.find(newId,'%s') then 
		string.gsub(newId,'%S+',function(str)
			local envStr = env[str] or env[string.lower(str)] or str
			name = name and (name .. saveSpace ..  envStr ) or envStr 
		end
		)
	end
	return  name or newId
end

--ids = {'','',}
--return {id1 = '',id2 = ''}
get_ids_name = function(ids,ver)
	local env = get_ver_env(ver)
	if not env then return end
	assert(type(ids) == 'table')
	local t = {}
	for k,v in ipairs(ids) do 
		t[v] = env[v] or v
	end
	return t
end

local init_groups = function()
	local groups = {}
	return function()
		groups = {}
	end,
	function(groupName)
		groups[groupName] = groups[groupName] or {ids ={},updateFuns = {}}
	end,
	function(groupName,...)
		local args = {...}
		groups[groupName] = groups[groupName] or {ids ={},updateFuns = {}}
		for i = 1,#args do 
			groups[groupName].ids[args[i]] = true
		end
	end,
	function(groupName)
		return groups[groupName]
	end,
	function (groupName,...)
		local args = {...}
		for i = 1,#args do 
			if type(args[i]) == 'function' then 
				groups[groupName].updateFuns[args[i]] = true
			end
		end
	end,
	function()
		for groupName,groupT in pairs(groups) do 
			if groupT.updateFuns then 
				for fun in pairs(groupT.updateFuns) do 
					fun()
				end
			end
		end
	end,
	function(groupName,appClose)
		groups[groupName] = nil
		if appClose then 
			for name,v in pairs(groups) do 
				local curName =  string.match(name,'([^/%s]+)') 
				if curName == groupName then 
					groups[curName] = nil
				end
			end
		end
	end
end

init_group_dat,
add_group_name,
add_group_id,
get_group_ids,
add_group_update,
run_update,
delete_group = init_groups()
