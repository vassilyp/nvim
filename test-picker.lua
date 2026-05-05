local M = {}

M.commands = {}

M.commands.EditNeovimConfig = {
	command = ":e " .. vim.fn.stdpath("config") .. "/init.lua",
	description = "😎 Edit neovim config",
}

-- M.commands.SourceCurrentLuaFile = { 
--   command = ":luafile %",
--   description = "🏄 Lua: source current file"
-- }

M.run = function()
	vim.ui.select(vim.tbl_keys(M.commands), {
		prompt = "Whattya wanna do?",
		format_item = function(item)
			return M.commands[item].description
		end,
	}, function(choice)
		local chosen_command = M.commands[choice]
		vim.cmd(chosen_command.command)
	end)
end

M.run()
