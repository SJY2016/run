--[[
/*
*Author:Sun JinYang
*Begin:2018��05��17��
*Description:
*	tree �ع�
*Record:��Time Content��
*/
--]]
--[[
���ݽṹ��
	tree:
		map:ֵΪboolean���ͣ���ֵΪtrueʱ����������Ľ�������Ѿ���map��
		gidList:ֵΪtable���ͣ��洢��ļ��ϣ�����ĵ�ַ��Ϊkeyֵ������
		rmenu:ֵΪtable ���� function ���ͣ�����tree Ĭ�ϵ��Ҽ��˵�����.�����Ի��Զ�������ȫ�ֵ�attributes���Ա��С�
		lbtn:ֵΪfunction ���ͣ�����tree Ĭ�ϵĵ����������Ĺ���.
		dlbtn:ֵΪfunction ���ͣ�����tree Ĭ�ϵ�˫������������.
		attributes:ֵΪtable���߷���table��function���ͣ�����tree���������Ժͽڵ�����ԡ����£�(�����뿴�����attributes��keyֵ�б�)
			�����Ӧ��Ϣkey��
				rmenu:����tree�Ҽ��˵�
				lbtn:���������������Ӧ�ĺ���
				dlbtn:����˫����������Ӧ������
			�ڵ���ʽ���key��
				color:
				image:
				...
			�ڵ������key��
				userdata:
			����̳����ԣ�
				noShare:ֵΪboolean���ͣ����ֵΪtrue����ǰ�ڵ����Բ�����̳С�
				endShare:ֵΪboolean���ͣ����ֵΪtrue�����ӽڵ㲻�ڼ������ϼ̳С�
			��������ĸΪ���ŵ����ԣ���������Խ���ǰ�ڵ���Ч�����ᱻ�̳С�
			ע�⣺
				title��userdata������Ȼ������̳У�����ǰ�ڵ���Ч��
				--�ļ��ڵ���Ȼ����̳��ļ������еĽڵ����ԡ�
				function���͵ķ��ر����������̬�޸�ĳ�����ԡ�
				�ڵ��е����Ի᲻�ϵ����ϲ��ң����û���ҵ���ص����ԣ���ô��ʹ��ȫ�����õ����ԣ�����rmenu��lbtn��dlbtn��
		data��ֵΪtable���ͣ�����tree����(����tree��������ʽ���ڵ����ʽ��tree�����ݵĲ㼶�ṹ���ڵ������Ϊ��)��table �а��������ݽṹ���£�
		root:ֵΪtable���ͣ���¼����data�����и����ԣ������еĸ��ڵ����ԣ������൱��-1�ڵ�����ԣ����ĸ��ڵ�id��0������
	node:�ڵ��а��������ݽṹ���£�
		attributeId:ֵΪstring���ͣ�Gid������Ӧ��ǰ�ڵ�����Ա�
		rootAttributeId��ֵΪstring���ͣ�Gid������Ӧ�ӽڵ���ռ����Ա�
�ӿں�����
data�ṹ��������ת��β����
attributes:(�ɽ��ܵ�ֵ��)
	color:���ýڵ�title��ɫ
	image�����ýڵ�ͼƬ
	imageLeaf������ȫ��Ĭ���ļ��ڵ�ͼƬ
	imageBranch������ȫ��Ĭ���ļ��нڵ�ͼƬ��ֵ��table�ṹ��{expanded = ,collapsed = }
	imageBranchCollapsed:����ȫ��Ĭ���ļ��нڵ�պ�ʱ��ʾ��ͼƬ��
	imageBranchExpanded:����ȫ��Ĭ���ļ��нڵ�չ��ʱ��ʾ��ͼƬ��
	userdata:���ýڵ�󶨵��û�����
	rmenu:
	lbtn:
	dlbtn:
---------------------------------------------------------------------------------------------------------------------------
����һ����ʮ����ʮ�� 
treeStyleId :tree ����ʽ����gid
gidList��gid��Ӧ�������б�
�ڵ����ԣ�
	NodeStyleIndexIds:�ڵ���ʽgid�����б�Ĭ��ȡ��һ��gid��Ӧ�ı�ΪֵΪ��ǰ��ʽ��
	InheritableStyleIndexGids:�ɼ̳нڵ���ʽgid�����б�Ĭ��ȡ��һ��gid��Ӧ�ı�ΪֵΪ��ǰ��ʽ��
	UserdatIndexGids���ڵ������gid�����б�Ĭ��ȡ��һ��gid��Ӧ�����ݱ�Ϊ��ǰ���ݱ�
	
---------------------------------------------------------------------------------------------------------------------------
����һ����ʮ���¶�ʮ�� 

�����ڵ���ʽ���ԣ�
	iconFileType = true;
	imageLeaf = 'res/default.bmp'; --ϵͳĬ���ļ��ڵ�ͼ��
	rmenu = {file = 'sys/tree/tree_frame.lua',action = 'on_rbtn',};
	lbtn = {file = 'sys/tree/tree_frame.lua',action = 'on_lbtn',};
	dlbtn = {file = 'sys/tree/tree_frame.lua',action = 'on_dlbtn',};
	
��ʽ����ʾ����
return {
	attributes = { --�����
		iconFileType = true;
		imageLeaf = 'res/default.bmp'; --ϵͳĬ���ļ��ڵ�ͼ��
		rmenu = {file = 'sys/tree/tree_frame.lua',action = 'on_rbtn',};
		lbtn = {file = 'sys/tree/tree_frame.lua',action = 'on_lbtn',};
		dlbtn = {file = 'sys/tree/tree_frame.lua',action = 'on_dlbtn',};
	};
	{
		attributes = {title = 'Project'};
		{
			{
				attributes = {title = 'kya.bmp'};
			};
		};
	};
}
--]]

local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M


local sysTools = require 'sys.tools'
local rpath,path = sysTools.get_path(modname)
local iupClass_ = require (rpath .. 'iupClass').Class
local classRmenu_ =  require (rpath .. 'rmenu')
local luaext_ = require 'luaext'
local iup = require 'iuplua'
require 'iupluacontrols'
require 'iupluaimglib'
local sysDisk = require 'sys.disk'
local lfs = require 'lfs'

local ipairs = ipairs
local pairs = pairs
local print = print
local type = type
local assert = assert
local error = error
local tostring = tostring
local tonumber = tonumber
local setmetatable = setmetatable
local getmetatable = getmetatable
local string = string
local table = table
local rawget = rawget
local rawset = rawset


_ENV = _M

local get_guid = luaext_.guid
------------------------------------------------------------------------
--define string
local NodeStyleIndexIds = 'NodeStyleIndexIds'
local NodeDatIndexIds = 'NodeDatIndexIds'
local NodeInheritableIndexIds = 'NodeInheritableIndexIds'
local resPath = 'res/'
------------------------------------------------------------------------
local default_style; --Ĭ��tree��ʽ��
local init_style;

------------------------------------------------------------------------
local Tree = {}

Class = Tree
iupClass_:met(Tree)

function Tree:new(arg)
	arg = type(arg) == 'table' and arg or {}
	local t = self:met()
	t:init_control(iup.tree(init_style(arg)))
	t:init_cbfs()
	t:init_regCbfs()
	return t
end


--�������ʱ����ʼ�������������
function Tree:init_cbfs()
	self:add_iup_cbf{key = 'map_cb',cbf = function(key)self:map_cb(key) end}
	self:add_iup_cbf{key = 'destroy_cb',cbf = function(key)self:destroy_cb(key) end}
	self:add_iup_cbf{key = 'togglevalue_cb',cbf =function(key)self:togglevalue_cb(key) end}
	self:add_iup_cbf{key = 'selection_cb',cbf = function(key) self:selection_cb(key) end}
	self:add_iup_cbf{key = 'button_cb',cbf = function(key) self:button_cb(key) end}
	self:add_iup_cbf{key = 'dragdrop_cb',cbf = function(key) self:dragdrop_cb(key) end}
	self:add_iup_cbf{key = 'tips_cb',cbf = function(key) self:tips_cb(key) end}
	self:add_iup_cbf{key = 'branchopen_cb',cbf = function(key) self:branchopen_cb(key) end}
	self:add_iup_cbf{key = 'branchclose_cb',cbf = function(key) self:branchclose_cb(key) end}
	self:add_iup_cbf{key = 'rightclick_cb',cbf = function(key) self:rightclick_cb(key) end}
	self:add_iup_cbf{key = 'executeleaf_cb',cbf = function(key) self:executeleaf_cb(key) end}
	self:add_iup_cbf{key = 'tips_cb',cbf = function(key) self:tips_cb(key) end}
	self:add_iup_cbf{key = 'motion_cb',cbf = function(key) self:motion_cb(key) end}
end

function Tree:init_regCbfs()
	self:reg_callback(
		'rightclick_cb',
		function(tree,id)
			self:set_markedId(id)
			self:update_selection(id)
			local sytleDat = self:get_styleDat(id) or {}
			local inheritableStyleDat = self:loop_getLastInheritableDat(id) or {}
			local rmenu =sytleDat.rmenu or inheritableStyleDat.rmenu
			if  rmenu then 
				local objRmenu = classRmenu_.new()
				local dat =  (type(rmenu) == 'table' and rmenu) or (type(rmenu) == 'function' and rmenu())
				if type(dat) == 'table' then 
					objRmenu:set_data(dat)
					return objRmenu:show(self,id)
				end
			end
		end
	)
	self:reg_callback(
		'executeleaf_cb',
		function(tree,id)
			local sytleDat = self:get_styleDat(id) or {}
			local inheritableStyleDat = self:loop_getLastInheritableDat(id) or {}
			local dlbtn =sytleDat.dlbtn or inheritableStyleDat.dlbtn
			if type(dlbtn) == 'function' then 
				return dlbtn(id,tree)
			end
		end
	)
	
	self:reg_callback(
		'selection_cb',
		function(tree,id,state)
			if self:get_kindId(id) == 'BRANCH' then return end 
			if state == 1 then 
				local sytleDat = self:get_styleDat(id) or {}
				local inheritableStyleDat = self:loop_getLastInheritableDat(id) or {}
				local lbtn =sytleDat.lbtn or inheritableStyleDat.lbtn
				if type(lbtn) == 'function' then 
					return lbtn(id,tree)
				end
			end
		end
		)
		
	self:reg_callback(
		'map_cb',
		function(tree)
			if self.data then 
				self:update()
			end
		end
	)
	self:reg_callback(
		'destroy_cb',
		function(tree)
			self.gidList = nil
		end
	)
end
-----------------------------------------------------------
--���tree �ؼ�
function Tree:get_tree()
	return self:get_control()
end

function Tree:set_data(data)
	self.data = data or {}
end

function Tree:get_data(data)
	return self.data 
end

-----------------------------------------------------------
function Tree:init_gidList()
	self.gidList = {}
end

function Tree:init_deleteAll()
	local dat = self:get_treeStyleDat()
	if  dat then 
		self.gidList = {[self.treeStyleId] = dat}
	end
end


function Tree:get_gidList(id)
	self.gidList = self.gidList or {}
	return  self.gidList
end

local function deepCopy(dat,newDat)
	local newDat = newDat or {}
	if type(dat) == 'table' then 
		for k,v in pairs(dat) do 
			if type(v) == 'table' then 
				newDat[k] = {}
				deepCopy(v,newDat[k])
			else 
				newDat[k] = v
			end
		end
	else 
		return dat
	end
	return newDat
end

function Tree:get_gidDat(gid,change)
	self.gidList = self.gidList or {}
	if not change then 
		return deepCopy(self.gidList[gid])
	else 
		return self.gidList[gid]
	end
end



function Tree:set_gidDat(gid,dat,append)
	self.gidList = self.gidList or {}
	self.gidList[gid] = self.gidList[gid] or {}
	if not append then 
		self.gidList[gid] = dat
	elseif  append and dat then 
		for k,v in  pairs(dat) do 
			self.gidList[gid][k] = v
		end
	end
end

function Tree:del_gidDat(gid)
	self.gidList = self.gidList or {}
	self.gidList[gid] = nil
end

function Tree:get_gidKeyDat(gid,key)
	self.gidList = self.gidList or {}
	local t = self.gidList[gid]
	if type(t) == 'table' then 
		return deepCopy(t[key])
	end
end


function Tree:set_gidKeyDat(gid,key,value)
	self.gidList = self.gidList or {}
	self.gidList[gid] = self.gidList[gid] or {}
	self.gidList[gid][key] = value
end

function Tree:create_indexGid(tab)
	local gid =get_guid()
	self.gidList = self.gidList or {}
	self.gidList[gid] = tab or {}
	return gid
end

-----------------------------------------------------------

--��ð󶨽ڵ����ݴ�����gid
function Tree:get_userdatGid(id)
	local userDat = self:get_userId(id)
	if type(userDat) == 'table' then 
		return userDat[NodeDatIndexIds]  and userDat[NodeDatIndexIds][1]
	end	
end

--��ýڵ��������ݱ�
function Tree:get_userdat(id)
	local gid  = self:get_userdatGid(id)
	if gid then 
		return  self:get_gidDat(gid)
	end
end

--�󶨽ڵ����ݡ�
function Tree:set_userdat(dat,id)
	local gid =   self:get_userdatGid(id)
	if gid then 
		self:set_gidDat( gid,dat)
	else 
		local userDat =  self:get_userId(id) 
		userDat = type(userDat) == 'table' and userDat or {}
		userDat[NodeDatIndexIds] =userDat[NodeDatIndexIds]  or {}
		table.insert(userDat[NodeDatIndexIds],1, self:create_indexGid(dat) )
		self:set_userId(userDat,id)
	end
end

--�༭�󶨽ڵ����ݡ�
function Tree:edit_userdatKeyDat(key,value,id)
	local gid = self:get_userdatGid(id)
	if gid then 
		self:set_gidKeyDat(gid,key,value)
	else 
		self:set_userdat({[key] = value},id)
	end
end

--��ô����ڵ���ʽʱ��gid
function Tree:get_styleGid(id)
	local userDat = self:get_userId(id)
	if type(userDat) == 'table' then 
		return userDat[NodeStyleIndexIds]  and  userDat[NodeStyleIndexIds][1]
	end	
end

--��ýڵ���ʽ���ݱ�
--change �Ƿ�����ı�ԭ�����ݱ��ֵ
function Tree:get_styleDat(id,change)
	local gid  = self:get_styleGid(id)
	if gid then 
		return  self:get_gidDat(gid,change)
	end
end

function Tree:set_styleDat(dat,id)
	local id = id or self:get_id()
	local gid =   self:get_styleGid(id)
	if gid then 
		self:set_gidDat( gid,dat)
	else 
		local userDat =  self:get_userId(id) 
		userDat = type(userDat) == 'table' and userDat or {}
		userDat[NodeStyleIndexIds] =userDat[NodeStyleIndexIds]  or {}
		table.insert(userDat[NodeStyleIndexIds],1, self:create_indexGid(dat) )
		self:set_userId(userDat,id)
	end
end

function Tree:edit_styleKeyDat(key,value,id)
	local gid = self:get_styleGid(id)
	if gid then 
		self:set_gidKeyDat(gid,key,value)
	else 
		self:set_styleDat({[key] = value},id)
	end
end


--��ü̳нڵ���ʽ������id
function Tree:get_inheritableStyleGid(id)
	local userDat = self:get_userId(id)
	if type(userDat) == 'table' then 
		return userDat[NodeInheritableIndexIds] and userDat[NodeInheritableIndexIds][1]
	end	
end

--��ýڵ���ʽ���ݱ�
--change �Ƿ�����ı�ԭ�����ݱ��ֵ
function Tree:get_inheritableStyleDat(id,change)
	local gid  = self:get_inheritableStyleGid(id)
	if gid then 
		return  self:get_gidDat(gid,change)
	end
end

function Tree:set_inheritableStyleDat(dat,id)
	local gid =   self:get_inheritableStyleGid(id)
	if gid then 
		self:set_gidDat( gid,dat)
	else 
		local userDat =  self:get_userId(id) 
		userDat = type(userDat) == 'table' and userDat or {}		
		userDat[NodeInheritableIndexIds] =userDat[NodeInheritableIndexIds]  or {}
		table.insert(userDat[NodeInheritableIndexIds],1, self:create_indexGid(dat) )	
		self:set_userId(userDat,id)
	end
end

function Tree:edit_styleKeyDat(key,value,id)
	local gid = self:get_inheritableStyleGid(id)
	if gid then 
		self:set_gidKeyDat(gid,key,value)
	else 
		self:set_inheritableStyleDat({[key] = value},id)
	end
end

-----------------------------------------------------------

-----------------------------------------------------------
--ȫ��Ĭ��tree�ɼ̳���ʽ 
function Tree:set_treeStyleDat(dat)
	if self.treeStyleId then
		self:set_gidDat(self.treeStyleId,dat,true)
	else 
		self.treeStyleId = self:create_indexGid(dat)
	end
end

function Tree:get_treeStyleDat(change)
	if self.treeStyleId then 
		return self:get_gidDat(self.treeStyleId,change)
	end
end

function Tree:set_treeStyleKeyDat(key,value)
	self.treeStyleId =self.treeStyleId or get_guid()
	self:set_gidKeyDat(self.treeStyleId,key,value)
end

function Tree:get_treeStyleKeyDat(key)
	if self.treeStyleId then 
		return self:get_gidKeyDat(self.treeStyleId,key)
	end
end

-----------------------------------------------------------

function Tree:set_rmenu(menu)
	assert(type(menu) == 'table' or type(menu) == 'function')
	self:set_treeStyleKeyDat('rmenu',menu)
end


function Tree:get_rmenu()
	return self:get_treeStyleKeyDat('rmenu')
end

function Tree:set_lbtn(fun)
	assert(type(fun) == 'function')
	self:set_treeStyleKeyDat('lbtn',fun)
end

function Tree:get_lbtn()
	return self:get_treeStyleKeyDat('lbtn')
end

function Tree:set_dlbtn(fun)
	assert(type(fun) == 'function')
	self:set_treeStyleKeyDat('dlbtn',fun)
end

function Tree:get_dlbtn()
	return self:get_treeStyleKeyDat('dlbtn')
end

-----------------------------------------------------------

function Tree:loopIds(id,rec,isDat)
	local count = self:get_childCountId(id)
	local ids = {}
	if rec then 
		local count = self:get_totalChildCountId(id)
		for i = 1,count do 
			ids[#ids+1] = id + i
		end
	else 
		local count = self:get_childCountId(id)
		local curId = id + 1
		for i = 1,count do 
			ids[#ids+1] = curId
			curId = curId + self:get_totalChildCountId(curId)+1
		end
	end
	local pos = 0;
	return function()	
		pos = pos + 1
		local curid =  ids[pos]
		if curid then 
				if isDat then 
					return self:get_styleDat(curId),self:get_userdat(curId)
				else 
					return self:get_styleGid(curId),self:get_userdatGid(curId)
				end
		end
	end
end

Tree.loopIdsDat = function(self,id,rec) return self:loopIds(id,rec,true) end
Tree.loopIdsGids = function(self,id,rec) return self:loopIds(id,rec) end 

-------------------------------------------------------------------------
--tree attributes
--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_imageLeaf('IMGPAPER') --���ַ�����iup�ṩ
	����
	tree:set_imageLeaf('c:\\image\\test.bmp') --�����ļ���������windows��bmp��ʽ���ļ�bmp��ʽ���ļ�
	�����뿴IMAGELEAF���ԡ�
--]]
function Tree:set_imageLeaf(str)
	local element = self:get_control()
	if not self:warning(element) then return end
	element.IMAGELEAF = str 
end

function Tree:set_imageBranchCollapsed(str) 
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.IMAGEBRANCHCOLLAPSED = str 
end

function Tree:set_imageBranchExpanded(str) 
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.IMAGEBRANCHEXPANDED = str 
end

--arg = {expanded,collapsed}
--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_imageBranch{expanded = ��collapsed = } --����ֵ��leaf image�����÷�������
	�����뿴 IMAGEBRANCHEXPANDED �� IMAGEBRANCHCOLLAPSED ���ԡ�
--]]
function Tree:set_imageBranch(arg) 
	arg = arg or {}
	self:set_imageBranchExpanded(arg.expanded or arg.open) 
	self:set_imageBranchCollapsed(arg.collapsed or arg.close) 
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_fgColor('255 0 0') -- �ַ����ĺ�����"R G B"��R��G��B��ȡֵ��Χ��0~255
	����
	tree:set_fgColor('#ff0000') -- ��ɫ16���Ʊ�ʾ����Ч�����ϵ�ͬ���Ǻ�ɫ��
--]]
function Tree:set_fgColor(str)
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.FGCOLOR =  str
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_bgColor('255 0 0') -- �ַ����ĺ�����"R G B"��R��G��B��ȡֵ��Χ��0~255
	����
	tree:set_bgColor('#ff0000') -- ��ɫ16���Ʊ�ʾ����Ч�����ϵ�ͬ���Ǻ�ɫ��
--]]
function Tree:set_bgColor(str)
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.BGCOLOR=  str
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_hlColor('255 0 0') -- �ַ����ĺ�����"R G B"��R��G��B��ȡֵ��Χ��0~255
	����
	tree:set_hlColor('#ff0000') -- ��ɫ16���Ʊ�ʾ����Ч�����ϵ�ͬ���Ǻ�ɫ��
--]]
function Tree:set_hlColor(str)  
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.HLCOLOR  = str
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_rastersize('100x100')
--]]
function Tree:set_rastersize(str)
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.rastersize = str
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_size('100x100')
--]]
function Tree:set_size(str) 
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.size = str
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_tabTitle('Project')
--]]
function Tree:set_tabTitle(str)
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.TABTITLE  = str
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_userId({test = 'Test'},1)
	ע�⣺
		data ���յ�ֵֻ���� table��userdata��nil ���������ͣ�nil ɾ�����ݣ���
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣
--]]
function Tree:set_userId(data,id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id()
	iup.TreeSetUserId(element,id,data)
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_titleId('TestText',1)
	ע�⣺
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣
--]]
function Tree:set_titleId(text,id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id()
	element['TITLE' .. id] = text
end


--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_colorId('255 0 0',1)
	ע�⣺
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣
--]]
function Tree:set_colorId(color,id) 
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id  or self:get_id()
	element['COLOR' .. id] = color
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_stateId('EXPANDED',1)
	ע�⣺
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣
--]]
function Tree:set_stateId(state,id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id()
	element["STATE" .. id] = state or "COLLAPSED"
end

--[[
���ýڵ�������ʽ��
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_titleFontStyleId('Bold',1)
	ע�⣺
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣	
--]]
function Tree:set_titleFontStyleId(style,id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id()
	element["TITLEFONTSTYLE" .. id] = style
end
--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_imageId('IMGPAPER',1)
	ע�⣺
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣
		������õĽڵ���branch,��ô�����õ�ͼ�������պ�״̬�µ�ͼ����ʽ��
--]]
function Tree:set_imageId(image,id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id  or self:get_id()
	if type(image) == 'table'  then 
		if image.open then 
			self:set_imageExpandedId(image.open,id)
		end
		if image.close then 
			element['IMAGE' .. id] =image.close
		end
	else 
		element['IMAGE' .. id] =image
		
	end
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_imageExpandedId('IMGPAPER',1)
	ע�⣺
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣
		��������branch�ڵ�չ��״̬�µ�ͼ��
--]]
function Tree:set_imageExpandedId(image,id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id and tonumber(id) or self:get_id()
	element['IMAGEEXPANDED' .. id] = image
end


--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_topItem(5)
--]]
function Tree:set_topItem(id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id  or self:get_id()
	element.TOPITEM = id
end

function Tree:set_showDragDrop(status)
	if not self:map_warning() then return end 
	element.SHOWDRAGDROP  = status or 'yes'
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_markedId(5)
--]]
function Tree:set_markedId(id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	element['MARKED' .. id] = 'YES'
end

--[[
�������ܣ�
	�����Ƿ��ڴ����ļ��нڵ�ʱչ���ļ��У����Ƶ��ļ��нڵ���յ���һ���ӽڵ�ʱ�Զ�չ������
	Ĭ��ֵ'yes'
����˵����
	status��ֵ������string��'yes' or 'no'
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_addExpanded(true)
--]]
function Tree:set_addExpanded(status)
	if type(status) ~= 'string' then return end 
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.ADDEXPANDED = status and 'YES' or 'NO'
end

--[[
�������ܣ�
	�����Ƿ���Ӹ��ڵ㡣
	Ĭ��ֵ��'yes'
����˵����
	status��ֵ������string��'yes' or 'no'
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_addRoot('yes')
--]]
function Tree:set_addRoot(status)
	if type(status) ~= 'string' then return end 
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.ADDROOT = status
end

--[[
�������ܣ�
	�����Զ���ý��㡣��windows�е���ڵ�ʱ��Ȼ��õ����㡣
	Ĭ��ֵ��'yes'
����˵����
	status��ֵ������string��'yes' or 'no'
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_canfocus('yes')
--]]
function Tree:set_canfocus(status)
	if type(status) ~= 'string' then return end 
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.CANFOCUS = status
end

--[[
�������ܣ�
	�����Զ���ý��㡣��windows�е���ڵ�ʱ��Ȼ��õ����㡣
	Ĭ��ֵ��'yes'
����˵����
	status��ֵ������string��
	�ɽ��յ�ֵ�У�
		"YES" (both directions), "HORIZONTAL", "VERTICAL", "HORIZONTALFREE", "VERTICALFREE" or "NO".

ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_expand('yes')
--]]
function Tree:set_expand(status)
	if type(status) ~= 'string' then return end 
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.EXPAND = status
end

--[[
�������ܣ�
	չ�����߱պ������ļ��нڵ㡣
����˵����
	status��ֵ������string��'yes' or 'no'
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_expandAll('yes')
--]]
function Tree:set_expandAll(status)
	if type(status) ~= 'string' then return end 
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.EXPANDALL = status
end


function Tree:set_tip(tip)
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.tip = tip
end

-------------------------------------------------------------
--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local count = tree:get_count(5)
	print(type(count)) --> number
--]]
function Tree:get_count()
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	return tonumber(element.COUNT)
end


function Tree:get_totalChildCountId(id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id  or self:get_id()
	return tonumber(element['TOTALCHILDCOUNT' .. id]) or 0
end

function Tree:get_childCountId(id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id  or self:get_id()
	return tonumber(element['CHILDCOUNT' .. id]) or 0
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
		local count = tree:get_id_count(1,true)
		print(count)
		���� 
		local count = tree:get_id_count(1)
		print(count)
		
		print(type(count)) --> number
--]]
function Tree:get_id_count(id,total)
	local id = id or self:get_id()
	if id == -1 then 
		return self:get_count()
	elseif total then 
		return self:get_totalChildCountId(id)
	else
		return self:get_childCountId(id)
	end
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local depth = tree:get_depthId(1)
	print(type(depth)) --> number
	ע�⣺
		���ڵ����ڵĲ㼶�� 0 ��
--]]
function Tree:get_depthId(id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id()
	return tonumber(element["DEPTH" .. id])
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local kind = tree:get_kindId(1)
	print(type(kind)) --> string
	ע�⣺
		����ֵ�ǿ����ǣ�"BRANCH"����"LEAF"��
--]]
function Tree:get_kindId(id)	
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id()
	return element["KIND" .. id]
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local id = tree:get_parentId(1)
	print(type(id)) --> number
	ע�⣺
		���ڵ��id �� 0 ��
--]]
function Tree:get_parentId(id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id()
	return tonumber(element["parent" .. id])
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local state = tree:get_stateId(1)
	print(type(state)) --> string
	ע�⣺
		����ֵ�ǿ����ǣ�"EXPANDED"����"COLLAPSED"��
--]]
function Tree:get_stateId(id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id()
	return element["STATE" .. id]
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local title = tree:get_titleId(1)
	print(type(title)) --> string
--]]
function Tree:get_titleId(id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id()
	return element['TITLE' .. id]
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local id = tree:get_value()
	print(type(id)) --> number
--]]
function Tree:get_value()
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	return tonumber(element.VALUE )
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local data = tree:get_userId(3)
	print(type(id)) --> userdata or table or nil
--]]
function Tree:get_userId(id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id() 
	return iup.TreeGetUserId(element,id)
end

local function get_selected_ids(tree)
	if not tree  then error("Missing parameter !") return end 
	local str = tree.MARKEDNODES
	if type(str) ~= 'string' then return {} end
	local ids = {}
	for i = 1,#str do 
		if string.sub(str,i,i) == "+" then
			ids[#ids+1] = i-1 
		end
	end
	return ids
end

function Tree:get_id()
	if not self:map_warning() then return end 
	return self:get_value() or get_selected_ids(self:get_control())[1]
end

function Tree:get_markedNodes()
	local element= self:get_control()
	if not self:warning(element) then return end 
	return element.MARKEDNODES
end


--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:add_branchId('name',1)
	ע�⣺
		��ӵ�λ��������ļ��нڵ㣬���Ϊ���ļ��е��׽ڵ㣬�����������ļ��ڵ��·��������ڲ��������
--]]
function Tree:add_branchId(name,id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id() 
	element["ADDBRANCH" .. id] = name
	return id  + 1
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:add_leafId('name',1)
	ע�⣺
		��ӵ�λ��������ļ��нڵ㣬���Ϊ���ļ��е��׽ڵ㣬�����������ļ��ڵ��·��������ڲ��������
--]]
function Tree:add_leafId(name,id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id()	
	element["ADDLEAF" .. id] = name
	return id + 1
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:insert_branchId('name',1)
return:
	����ӽڵ��id
--]]
function Tree:insert_branchId(name,id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id()
	element["INSERTBRANCH" .. id] = name
	return id +  self:get_totalChildCountId(id) + 1
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:insert_leafId('name',1)
--]]
function Tree:insert_leafId(name,id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	local id = id or self:get_id()
	element["INSERTLEAF" .. id] = name
	return id +  self:get_totalChildCountId(id) + 1
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:delete_nodeId('SELECTED',1)
	ע�⣺	
		status ��ֵ����Ϊ��
			"ALL": deletes all nodes, id is ignored (Since 3.1)
			"SELECTED": deletes the specified node and its children
			"CHILDREN": deletes only the children of the specified node
			"MARKED": deletes all the selected nodes (and all their children), id is ignored
--]]
function Tree:delete_nodeId(status,id)
	local element = self:get_control()
	if not self:warning(element) then return end 
	if not self:map_warning() then return end 
	status = status or "SELECTED"
	if string.lower( status) == 'all' then
		element['DELNODE'] = 'ALL' 
		self:init_deleteAll()
	elseif string.lower( status ) ~= 'marked' then
		local id = id or self:get_id()
		for styleGids,userdatGids in self:loopIdsGids(id,true) do 
			if styleGids then 
				for _,gid in ipairs(styleGids) do 
					self:set_gidDat(gid,nil)
				end
			end
			if userdatGids then 
					for _,gid in ipairs(userdatGids) do 
						self:set_gidDat(gid,nil)
					end
			end
		end
		-- self:loop_childNode{id = id,rule = function(id) self:set_gidDat(id,nil) end}
		element["DELNODE" .. id] = status
	end 
end


-------------------------------------------------------------------------
function Tree:set_selection_cb(f)
	self:reg_callback('selection_cb',f)
end

function Tree:set_branchopen_cb(f)
	self:reg_callback('branchopen_cb',f)
end

function Tree:set_branchclose_cb(f)
	self:reg_callback('branchclose_cb',f)
end

function Tree:set_dragdrop_cb(f)
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.SHOWDRAGDROP  = 'yes'
	self:reg_callback('dragdrop_cb',f)
end


function Tree:update_selection(id)
	local id = id or self:get_id()
	return self:run_callbacksAll('selection_cb',self:get_control(),id,1)
end

function Tree:init_node_data(data,id)
	if id < 0 then 
		self:delete_nodeId('ALL')
	else 
		self:delete_nodeId('CHILDREN',id)
	end
	self:set_tree_data(data,id)
	if id >=0  then
		self:update_nodeStyle(id)
	end
end

function Tree:init_tree_data(data)
	if not data then return end 
	self:set_data(data)
	if self.map then 
		self:update()
	end
end

function Tree:set_treeAddNodes(data,id)
	iup.TreeAddNodes(self:get_control(), data,id)
end

function Tree:update()
	if self.map then 
		self:delete_nodeId('ALL')
		self:set_tree_data()
	end
end

--�ڵ���ʽ
--fname ��������ʵ����������ʽ����
--waitExe �Ǻ���ת����ȴ�ִ��
function Tree:get_styleList()
	return {
		userdata = {fname = 'set_userdat',};
		color = {fname = 'set_colorId',};
		image = {fname = 'set_imageId',};
		state = {fname = 'set_stateId',};
		fontstyle =  {fname = 'set_titleFontStyleId',};
		title = {fname = 'set_titleId',};
		rmenu = {waitExe = true};
		lbtn = {waitExe = true};
		dlbtn = {waitExe = true};	
	}
end

function Tree:get_globalStyleList()
	return {
		rmenu = {waitExe = true};
		lbtn = {waitExe = true};
		dlbtn = {waitExe = true};	
		--global
		imageLeaf = {fname = 'set_imageLeaf'};
		iconFileType = {fname = 'set_iconFileType',waitExe = true};
		imageBranch = {fname = 'set_imageBranch'}; 
		imageBranchCollapsed = {fname = 'set_imageBranchCollapsed'};
		imageBranchExpanded = {fname = 'set_imageBranchExpanded'};
	}

end


function Tree:init_fileTypeIcon(id)
	local id = id or self:get_id()
	local title = self:get_titleId(id) or ''
	local fileType =  string.match(title,'.+%.([^%.]+)')
	if fileType then 
		local bmpFile = resPath .. fileType .. '.bmp'
		return  iup.LoadImage(bmpFile)
	end
	local bmpFile = resPath ..  'default.bmp'
	return iup.LoadImage(bmpFile)
end

--���ݽڵ���ļ���������ͼ����ʽ
function Tree:set_iconFileType(val)
	if val  then 	
		 self:set_treeStyleKeyDat('image',function(id) 
			if self:get_kindId(id) == 'LEAF' then 
				return self:init_fileTypeIcon(id) 
			end
		end)
	end
end

function Tree:turn_fun(key,styleFunTab,dat,id)
	local val;
	if dat.action and dat.file then 
		local mod = sysDisk.file_require(dat.file)
		if mod then 
			val = mod[dat.action]
		end
	end
	if not val then return dat  end 
	if id and id == -1 then 
		if not styleFunTab.waitExe then 
			val = val()
		end
		self:set_treeStyleKeyDat(key,val)
	else 
		id = id or self:get_id()
		local gid = self:get_styleGid(id)
		if not gid then return end 
		if not styleFunTab.waitExe then 
			val = val()
		end
		self:set_gidKeyDat(gid,key,val)
	end
	return val
end

function Tree:update_nodeStyle(id)
	local id = id or self:get_id()
	local inheritableStyleDat,inheritableId = self:loop_getLastInheritableDat(id)
	local styleDat = self:get_styleDat(id)
	local curId = id
	for k,v in pairs(self:get_styleList()) do 
		local val = styleDat and styleDat[k]
		if not val then 
			val =  inheritableStyleDat and inheritableStyleDat[k]
			curId = inheritableId
		end
		if type(val) == 'table' then 
			val = self:turn_fun(k,v,val,curId)
		end
		if val and v.fname  then 
			if type(val) == 'function' and not v.waitExe then 
				val = val(id)
			end
			self[v.fname](self,val,id)
		end
	end
end

function Tree:update_treeStyle()
	local dat = self:get_treeStyleDat()
	for k,v in pairs(self:get_globalStyleList()) do 
		local val = dat[k]
		if type(val) == 'table'  then 
			val = self:turn_fun(k,v,val,-1)
		end
		if val and v.fname then 
			if type(val) == 'function' and not v.waitExe then 
				val = val(id)
			end
			self[v.fname](self,val,id)
		end
	end
end

function Tree:init_nodeStyleDat(attrTab,id)
	if not attrTab then return end
	local id = id or self:get_id()
	local userdata = attrTab.userdata
	self:set_styleDat(attrTab,id)
end

--[[
data style:
	{
		--attributes = {color= ,imageLeaf = '',...}; -- ��ѡ�ļ̳����Ա��ӽڵ��Զ��̳���ʽ
		{--��һ���ڵ�
			attributes = {title = '1'};--����ǰ�ڵ���Ϣ�����Ա�������title����
			{--����ǰ�ڵ�Ϊ�ļ��нڵ�
				--attributes = {} -- ��ѡ�ļ̳����Ա��ӽڵ��Զ��̳���ʽ
				{attributes = {title = 3}}��--�ļ����ڲ���һ���ڵ㡣
				{attributes = {title = 4}}��--�ļ����ڵڶ����ڵ�
			}
		}��
		{
			--�ڶ����ڵ�
			attributes = {title = '2'}
			
		}
	}
--]]
function Tree:loop_getLastInheritableId(id)
	local dat = self:get_inheritableStyleDat(id)
	if dat then return id end 
	if self:get_depthId(id)  == 0  then  
		return -1
	end
	return self:loop_getLastInheritableId(self:get_parentId(id))
end

function Tree:loop_getLastInheritableDat(id)
	local dat = self:get_inheritableStyleDat(id,true)
	if dat then 
		local temp = {}
		setmetatable(temp,{__index = dat})
		return temp,id 
	end 
	if self:get_depthId(id)  == 0  then  	
		return self:get_treeStyleDat(true),-1
	end
	return self:loop_getLastInheritableDat(self:get_parentId(id))
end

function Tree:set_metDat(lastInheritableId,dat)
	local temp;
	if  not lastInheritableId or  lastInheritableId == -1 then 
		temp = self:get_treeStyleDat(true) 
	else
		temp =  self:get_inheritableStyleDat(lastInheritableId,true)
	end
	if temp then 
		setmetatable(dat,{__index = temp})
	end
end

 function Tree:set_tree_data(data,id,lev,lastInheritableId)
	if not lev then 
		data = data or self.data
		id = id or -1
	end
	if type(data) ~= 'table' then return end 
	if data.attributes then 
		if id == -1  then 
			self:set_treeStyleDat(data.attributes)
			self:update_treeStyle()
			lastInheritableId =  -1
		else 
			if not lastInheritableId then 
				lastInheritableId = self:loop_getLastInheritableId(id)
			end
			self:set_inheritableStyleDat(data.attributes,id)
			local dat = data.attributes
			self:set_metDat(lastInheritableId,dat)
			lastInheritableId =  id
		end
	end
	
	 if  #data == 0 then return end 
	 local curId = id
	for k ,v in ipairs(data) do 
		assert(v and v.attributes and v.attributes.title)
		if k == 1 then 
			if #v ~= 0 then 
				self:add_branchId(v.attributes.title,curId)
			else 
				self:add_leafId(v.attributes.title,curId)
			end
		else
			if #v ~= 0 then 
				self:insert_branchId(v.attributes.title,curId)
			else
				self:insert_leafId(v.attributes.title,curId)
			end
			curId = curId + self:get_totalChildCountId(curId)
		end
		curId = curId + 1
		self:init_nodeStyleDat(v.attributes,curId)
		self:set_tree_data(v[1],curId,true,lastInheritableId)
		self:update_nodeStyle(curId)
	end
 end

-------------------------------------------------------------------------
--callbacks

function Tree:destroy_cb(key)
	local element = self:get_control()
	if not self:warning(element) then return end 
	local temp = self
	function element:destroy_cb()
		return temp:run_callbacks(key,self)
	end
end

function Tree:togglevalue_cb(key)
	local iupControl = self:get_control()
	local temp = self
	if not self:warning(iupControl) then return end 
	function iupControl:togglevalue_cb(id, state) 
		return temp:run_callbacks(key,self,id,state)
	end
end

function Tree:selection_cb(key)
	local iupControl = self:get_control()
	local temp = self
	if not self:warning(iupControl) then return end 
	function iupControl:selection_cb(id, state) 
		if state == 1 then 
			return temp:run_callbacks(key,self,id,state)
		end
	end
end

function Tree:button_cb(key)
	local iupControl = self:get_control()
	local temp = self
	if not self:warning(iupControl) then return end 
	function iupControl:button_cb(button,pressed,x,y,str)
		return temp:run_callbacks(key,self,button,pressed,x,y,str)
	end
end

function Tree:rightclick_cb(key)
	local iupControl = self:get_control()
	local temp = self
	if not self:warning(iupControl) then return end 
	function iupControl:rightclick_cb(id) 
		return temp:run_callbacks(key,self,id)
	end
end

function Tree:dragdrop_cb(key)
	local iupControl = self:get_control()
	local temp = self
	if not self:warning(iupControl) then return end 
	function iupControl:dragdrop_cb(drag_id, drop_id, isshift, iscontrol) 
		local status = temp:run_callbacks(key,self,drag_id, drop_id, isshift, iscontrol)
		return status
	end
end


function Tree:branchopen_cb(key)
	local iupControl = self:get_control()
	local temp = self
	if not self:warning(iupControl) then return end 
	function iupControl:branchopen_cb(id)
		return temp:run_callbacks(key,self,id)
	end
end

function Tree:branchclose_cb(key)
	local iupControl = self:get_control()
	local temp = self
	if not self:warning(iupControl) then return end 
	function iupControl:branchclose_cb(id)
		return temp:run_callbacks(key,self,id)
	end
end

function Tree:executeleaf_cb(key)
	local iupControl = self:get_control()
	local temp = self
	if not self:warning(iupControl) then return end 
	function iupControl:executeleaf_cb(id)
		return temp:run_callbacks(key,self,id)
	end
end

function Tree:motion_cb(key)
	local iupControl = self:get_control()
	local temp = self
	if not self:warning(iupControl) then return end 
	function iupControl:motion_cb(x,y,status)
		return temp:run_callbacks(key,self,x,y,status)
	end
end


function Tree:tips_cb(key)
	local iupControl = self:get_control()
	local temp = self
	if not self:warning(iupControl) then return end 
	function iupControl:tips_cb(x,y)
		return temp:run_callbacks(key,self,x,y)
	end
end

--]]
---------------------------------------------------------------------------
--����һ����ʮ���¶�ʮһ��
function Tree:get_treePath(id)
	local id = id or self:get_id()
	local title = self:get_titleId(id)
	if self:get_kindId(id) == 'BRANCH' then 
		title = title .. '/'
	end
	if id == 0 then return title end
	return self:get_treePath(self:get_parentId(id))   .. title
end

function Tree:get_childTitleId(title,pid)
	local  pid = pid or self:get_id()
	local count = self:get_childCountId(pid)
	if count == 0 then return end 
	local curId = pid + 1
	for i = 1,count do 
		if self:get_titleId(curId) == title then 
			return curId
		end
		curId = curId + 1 + self:get_totalChildCountId(curId)
	end
end

---------------------------------------------------------------------------
--
default_style = {}
default_style.addexpanded = "NO";
default_style.expand=   "YES";
default_style.EXPANDALL=   "NO";
 default_style.showrename = "NO";
default_style.MARKMODE =  "SINGLE";
default_style.IMAGELEAF = "IMGPAPER";
default_style.ADDROOT = 'YES'; 
default_style.title0 = 'Tree'; 
--[[
default_style.INFOTIP = 'no'; 
default_style.TIP = 'tips'; 
--default_style.TIPVISIBLE = 'YES'; 
default_style.TIPBALLOONTITLEICON  = '1'; 
default_style.TIPBALLOON = 'YES'; 
default_style.TIPBALLOONTITLE = 'Tip'; 
default_style.TIPDELAY = '10000'; 
--]]

init_style = function(userStyle)
	local userStyle = userStyle or {}
	for k,v in pairs(default_style) do 
		if not userStyle[k] then 
			userStyle[k]  = v
		end
	end
	return userStyle
end

--[[
�������ݣ�
{
	attributes = { --��������趨Tree��ȫ��Ĭ����ʽ��ע������趨tree map�������
		color = '0 0 255';
		rmenu = {
			{title = '1'};
			{title = '2'};
		};
	};
	{
		attributes = {
			title = "0"; --�ڵ�idΪ0��
			color = '255 0 0';
		};
		{
			attributes = { --titleΪ0�Ľڵ�󶨵ļ̳���ʽ��
				 state = 'COLLAPSED';
				 fontstyle = 'Bold, Italic';
			};
			{
				attributes = {
					title = "1";
					 -- color = '0 255 0';
				};
				{
					attributes = {  --titleΪ1�Ľڵ�󶨵ļ̳���ʽ��
						color = '0 255 0';
						fontstyle = 'Bold';
						rmenu = {
							{title = '3'};
							{title = '4'};
						};
					};
						{attributes = {
						title = "2";
						-- color = '0 255 0';
					};};
					{attributes = {
					title = "3";
					-- color = '0 255 0';
				};};
				};
			};
			{
				attributes = {
					title = "4";
					-- color = '0 255 0';
				};
			}
		};
	};
	{
		attributes = {
			title = "5";
		};
	};

}
--]]

-----------------------------------------------------------------------
