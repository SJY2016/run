ap = {}

---------------------------------------------------------------------------------------
-- api
ap.trim = function (s) 
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end
---------------------------------------------------------------------------------------
--reg functions
local cmds = {}

ap.register_frmcommand = function (key,cmd) 
	if type(key) == 'string' and type(cmd) = 'function' then 
		cmds['frm_on_command'] = cmds['frm_on_command']  or {}
		cmds['frm_on_command'][key] = cmd
	end
end

ap.register_command = function (key,cmd) 
	if type(key) == 'string' and type(cmd) = 'function' then 
		cmds['on_command'] = cmds['on_command']  or {}
		cmds['on_command'][key] = cmd
	end
end


