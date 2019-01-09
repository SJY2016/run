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
--local app = ap.getApp()

local setmetatable = setmetatable
local type = type;
local trace_out = trace_out;
local tonumber  = tonumber
local ipairs = ipairs;
local table = table;
local string = string
local print = print
local assert = assert

local add_menu = add_menu;
local sub_menu = sub_menu
local get_submenu = get_submenu
local insert_menu = insert_menu
local frm = frm;
local MF_POPUP = MF_POPUP;
local MF_SEPARATOR = MF_SEPARATOR;
local remove_menu = remove_menu
local del_menu = del_menu
local get_mainmenu = get_mainmenu
local MFS_CHECKED = MFS_CHECKED

--[[
Value Meaning 
MFS_CHECKED Checks the menu item. For more information about selected menu items, see the hbmpChecked member. 
MFS_DEFAULT Specifies that the menu item is the default. A menu can contain only one default menu item, which is displayed in bold. 
MFS_DISABLED Disables the menu item and grays it so that it cannot be selected. This is equivalent to MFS_GRAYED. 
MFS_ENABLED Enables the menu item so that it can be selected. This is the default state. 
MFS_GRAYED Disables the menu item and grays it so that it cannot be selected. This is equivalent to MFS_DISABLED. 
MFS_HILITE Highlights the menu item. 
MFS_UNCHECKED Unchecks the menu item. For more information about clear menu items, see the hbmpUnchecked member. 
MFS_UNHILITE Removes the highlight from the menu item. This is the default state. 

--]]

_ENV = _M

--------------------------------------------------

local menuStyleTab;
local itemsStyleTab;

function init_menuStyleTab(tab)
	menuStyleTab = tab
end

function init_itemsStyleTab(tab)
	itemsStyleTab = tab
end


local function init_menu()
	local pos = 0
	local menu  = get_mainmenu(frm)
	while true do 
		local submenu = get_submenu(frm,pos)
		if not submenu or tonumber(submenu) == 0 then return 	
		else 
			del_menu(frm,menu,pos)
		end
	end
end


local function create_items(data,items,level,itemDat)
	if type(data) ~= 'table' then return end 
	local names,pos;
	if not level then 
		names,pos = {},-1 
		itemDat = itemDat or itemsStyleTab
	end 
	
	for k,v in ipairs (data) do 
		if #v ~= 0 and not level  then 
			local name =  string.lower(v.name)
			
			local menuhwnd = names[name]
			if menuhwnd then 
				local items = {}
				create_items(v,items,1,itemDat and itemDat[v.name]) 
				for i = #items,1,-1 do 
					insert_menu(menuhwnd,items[i]) 
				end 
			else 
				pos = pos+ 1;
				local menu = {}
				menu.name = v.name
				menu.nposition = pos
				menu.items = {}
				create_items(v,menu.items,1,itemDat and itemDat[v.name]) 
				add_menu(frm,menu)
				names[name] = get_submenu(frm,pos)
			end
		elseif   #v ~= 0 and level  then 
			local submenu = {};
			submenu.name =v.name
			submenu.items = {}
			create_items(v,submenu.items,1,itemDat and itemDat[v.name])
			table.insert(
				items,
				{
					name =v.name,
					fState  = MFS_CHECKED,
					id = sub_menu(submenu) ,
					flags = MF_POPUP
				}
			)
		elseif  #v == 0  and items then
			if v.name and v.name ~= '-' then 
				local sys_id = sysMsgId.get_command_id();
				sysMsgId.map(sys_id,itemDat and itemDat[v.name]);
				table.insert(
					items,
					{
						name = v.name; 
						id = sys_id;
					}
				)
			else 
				table.insert(items,{name = '' ,flags =  MF_SEPARATOR })
			end 
		end 
	end 
end

local function create_menu()
	if type(menuStyleTab) ~= 'table' then return end 
	create_items(menuStyleTab);
end

init = init_menu
update = create_menu



