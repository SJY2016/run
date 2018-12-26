--[[
/*
*Author:Sun JinYang
*Begin:2018��03��02��
*Description:
*	����iup dialog 
*Import Update Record:��Time Content��
*	2018/03/30 �޸ĶԻ����лص��ķ�����Ϊ�µ�reg_callbackģʽ
*/
--]]
--[[
���ݽṹ��
	
�ӿں�����
	Class:new(childs)
		��������
		childs������ֵΪtable���ͣ�����Ϊiup.dialog��Ҫ�Ŀؼ���dialog��ʼ������ֵ��
		return :����ֵΪtable���ͣ�tableΪ�������Ķ���
	---------------------------------------------------------------------------------------
	--get
	Class:get_control()
		��ô�����iup����
		return:����ֵΪuserdata(IUP)���͡�
	Class:get_modal()
		��õ�ǰ�Ի���״̬,MODAL����ֵ
		return 'YES'(����ģʽΪpopup��ģ̬�Ի��� ) or 'NO'������ģʽΪshow����ģ̬�Ի��򡣻��߽���û��ʾ����
	Class:is_popup()
		�ж��Ƿ�Ϊģ̬�Ի����ڲ�������get_modal��
		return true or nil��true:����ǰΪģ̬�Ի������ǵ���״̬,nil ����ǰ�Ի������ػ��߷�ģ̬�Ի���
	Class:get_title()
		��öԻ���ı�������
		return:����ֵΪstring���͡����õı������ơ�
	---------------------------------------------------------------------------------------
	--set
	Class:set_opacity(number)
		���öԻ����͸����ʽ
		number:ֵΪnumber���ͣ�ȡֵ��Χ��0~255��255 Ϊ��͸����
	Class:set_title(title)
		���öԻ������Ͻ���ʾ�ı���
		title:ֵΪstring���ͣ�������

	---------------------------------------------------------------------------------------
	--show��hide
	Class:show()
		��ģ̬��ʾ�Ի���
	Class:popup()
		ģ̬��ʾ�Ի���
	Class:map()
		��ʾ�Ի���ǰ��map����
	Class:hide()
		���ضԻ���
--]]
local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local sysTools = require 'sys.tools'
local rpath,path = sysTools.get_path(modname)
local iupClass_ = require (rpath .. 'iupClass').Class
local iup = require 'iuplua'
require 'iupluacontrols'
local enablewindow = enablewindow
local frm_hwnd = frm_hwnd
local print = print
local type = type
local ipairs = ipairs
local pairs = pairs
local string = string
local tonumber = tonumber

_ENV = _M

Class = {}
iupClass_:met(Class)

local popCount = 0

function Class:new(childs)
	local t = self:met()
	t:init_control(iup.dialog(childs))
	t:init()
	iup.SetAttribute(t.iupElement,"NATIVEPARENT",frm_hwnd)
	return t
end

function Class:init()
	self:add_iup_cbf{key = 'map_cb',cbf = function(key) self:map_cb(key) end}
	self:add_iup_cbf{key = 'show_cb',cbf = function(key) self:show_cb(key) end}
	self:add_iup_cbf{key = 'close_cb',cbf = function(key) self:close_cb(key) end}
	self:add_iup_cbf{key = 'destroy_cb',cbf = function(key) self:destroy_cb(key) end}
end
-----------------------------------------------------------------

--��ֻ������öԻ���ĵ���ģʽ,��Ҫ�ڶԻ��򵯳���ʹ��,��һ�ε���ʱshow_cb��δ��ֵ�����Բ�����show_cb��ʹ�ø�����,'YES'����popup����
--ע�⣺����hide��Ի���رո�״̬�ͱ��ˡ�
function Class:get_modal()
	local element = self:get_control()
	if not self:warning(element) then return end 
	return element.MODAL
end

function Class:is_popup()
	if self:get_modal() == 'YES' then
		return true
	end
end

--number:0~255,���öԻ����͸����
function Class:set_opacity(number)
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.OPACITY  = number
end

function Class:set_title(title)
	local element = self:get_control()
	if not self:warning(element) then return end 
	element.TITLE = title
end
function Class:get_title()
	local element = self:get_control()
	if not self:warning(element) then return end 
	return element.TITLE
end
-----------------------------------------------------------------
--set callback

--[[
	state:number 
	possible value:
		IUP_HIDE (since 3.0)��
		IUP_SHOW��
		IUP_RESTORE (was minimized or maximized)��
		IUP_MINIMIZE��
		IUP_MAXIMIZE (since 3.0) (not received in Motif when activated from the maximize button)
--]]
function Class:show_cb(key)
	local temp = self
	local element = self:get_control()
	if not self:warning(element) then return end 
	function element:show_cb(state) 
		local t = temp:get_reg_cbfs(key)
		local close;
		for k,v in ipairs(t) do 
			if type(v) == 'function' then 
				local val = v(state)
				if val and val == iup.CLOSE then 
					close = true
				end
			end
		end
		if close then return iup.CLOSE end 
	end
end

function Class:map_cb(key)
	local temp = self
	local element = self:get_control()
	if not self:warning(element) then return end 
	function element:map_cb()
		return temp:run_callbacks(key,self)
	end
end

function Class:destroy_cb(key)
	local temp = self
	local element = self:get_control()
	if not self:warning(element) then return end 
	function element:destroy_cb()
		return temp:run_callbacks(key,self)
	end
end

function Class:close_cb(key)
	local temp = self
	local element = self:get_control()
	if not self:warning(element) then return end 
	function element:close_cb()
		local t = temp:get_reg_cbfs(key)
		local ignore;
		for k,v in ipairs(t) do 
			if type(v) == 'function' then 
				local val = v()
				if val and val == iup.IGNORE then
					ignore = true
				end
			end
		end
		if not temp:is_popup()  then
			iup.Destroy(element)
			return iup.IGNORE
		elseif ignore then 
			return iup.IGNORE
		end
	end
end

-----------------------------------------------------------------
-- show close hide ...
function Class:show()
	local element = self:get_control()
	if not self:warning(element) then return end 
	self:reg_callback('close_cb',function()   end)
	element:show()
end

-- show close hide ...
--...:x,y
function Class:showxy(...)
	local element = self:get_control()
	if not self:warning(element) then return end 
	self:reg_callback('close_cb',function()   end)
	element:showxy(...)
end

function Class:hide()
	local element = self:get_control()
	if not self:warning(element) then return end 
	local isPop = self:is_popup()
	element:hide()
	if not isPop  then 
		iup.Destroy(element)
	end
end

function Class:map()
	local element = self:get_control()
	if not self:warning(element) then return end 
	element:map()
end

function Class:popup()
	local element = self:get_control()
	if not self:warning(element) then return end 
	self:reg_callback('show_cb',function()
		enablewindow(frm_hwnd,false)
	end	
	)
	popCount = popCount + 1
	element:popup()
	iup.Destroy(element)
	popCount = popCount - 1
	if popCount == 0 then 
		enablewindow(frm_hwnd,true)
	end
end

function Class:child_popup()
	local element = self:get_control()
	if not self:warning(element) then return end 
	element:popup()
	iup.Destroy(element)
end
