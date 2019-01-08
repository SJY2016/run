--[[
/*
*Author:Sun JinYang
*Begin:
*Description:
*	
*Import Update Record:£¨Time Content£©
*/
--]]
--[[

--]]
local _M = {}
local modname = ...
_G[modname] = _M
package.loaded[modname] = _M

local sysMsgId =  require ('sys.msg.id')
local sysRes = require 'sys.res'

local setmetatable = setmetatable
local tonumber = tonumber
local type =type
local print =print
local assert = assert
local type =type
local ipairs = ipairs
local pairs = pairs
local next = next
local table = table
local string = string

local sub = string.sub
local sort = table.sort
local unpack =  table.unpack

local trace_out = trace_out;
local remove_toolbar = remove_toolbar
local crt_toolbar = crt_toolbar;
local frm = frm;
local BTNS_SEP = BTNS_SEP;
local TBSTATE_ENABLED = TBSTATE_ENABLED;
local BTNS_CHECK = BTNS_CHECK;


--[[

TBSTATE_CHECKED  The button has the TBSTYLE_CHECK style and is being clicked. 
TBSTATE_ELLIPSES  Version 4.70. The button's text is cut off and an ellipsis is displayed. 
TBSTATE_ENABLED  The button accepts user input. A button that doesn't have this state is grayed. 
TBSTATE_HIDDEN  The button is not visible and cannot receive user input. 
TBSTATE_INDETERMINATE  The button is grayed. 
TBSTATE_MARKED  Version 4.71. The button is marked. The interpretation of a marked item is dependent upon the application.  
TBSTATE_PRESSED  The button is being clicked. 
TBSTATE_WRAP  The button is followed by a line break. The button must also have the TBSTATE_ENABLED state. 

--]]

_ENV = _M

--------------------------------------------------

local toolbarStyleTab;
local itemsStyleTab;

function init_toolbarStyleTab(tab)
	toolbarStyleTab = tab
end

function init_itemsStyleTab(tab)
	itemsStyleTab = tab
end

function create_toolbar(dat,itemDat)
	local btns = {}
	local id,btnDat,fsStyle;
	local iconPos = 0 ; 
	local images = {}

	if #dat==0 then return end 
	for k,btn in ipairs(dat) do 
		if btn.name ~= '-'  then 
			id = sysMsgId.get_command_id();
			btnDat = itemDat and itemDat[btn.name]
			sysMsgId.map(id,btnDat);
			fsStyle = btnDat and btnDat.checkbox  and  BTNS_CHECK
			icon = btnDat and btnDat.icon 
			images[#images+1] =icon or 'default.bmp'
			btns[#btns+1] = {
				iBitmap = iconPos;
				idCommand = id,
				iString = btn.name ;
				fsState  = TBSTATE_ENABLED,
				fsStyle = fsStyle;
			}
		iconPos = iconPos + 1;
		else
			btns[#btns+1] = {iString = '',fsStyle = BTNS_SEP,fsState = TBSTATE_ENABLED}
		end
	end
	local bmpname = sysRes.save_bmpfile{bmpfile = dat.name ,icons = images,}
	
	local id = sysMsgId.get_command_id()
	add_toolbarId(id)
	crt_toolbar(frm,{
		id = id;
		bmpname = bmpname;
		nbmps = 1;
		buttons = btns;
	})
end
-----------------------------------------------------------------------------
local init_toolbarIds = function()
	local toolbarIds = {};
	return function()
		for k,v in ipairs (toolbarIds) do 
			remove_toolbar(frm,v)
		end
		toolbarIds = {}
	end,
	function(id)
		toolbarIds[#toolbarIds + 1] = id
	end
end
remove_toolbarIds,add_toolbarId = init_toolbarIds()

function init()
	remove_toolbarIds()
end

function create()
	if type(toolbarStyleTab) ~= 'table' then return end 
	for _,toolbar in ipairs(toolbarStyleTab) do 
		if type(toolbar) == 'table' then 
			create_toolbar(toolbar,itemsStyleTab and itemsStyleTab[toolbar.name])
		end
	end
end
update = create



