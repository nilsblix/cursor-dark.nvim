local M = {}

M.config = {
	-- Enable UI customizations (statuscolumn, line numbers)
	ui = true,
	-- Enable plugin integrations
	integrations = {
		lspsaga = true,
		nvim_tree = true,
		barbar = true,
	},
}

function M.setup(opts)
	-- Merge user config with defaults
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	-- Apply the theme
	require("cursor-dark.theme").setup()

	-- Apply UI customizations if enabled
	if M.config.ui then
		require("cursor-dark.ui").setup()
	end

	-- Apply plugin integrations
	if M.config.integrations.lspsaga then
		require("cursor-dark.integrations.lspsaga").setup()
	end

	if M.config.integrations.nvim_tree then
		require("cursor-dark.integrations.nvim-tree").setup()
	end

	if M.config.integrations.barbar then
		require("cursor-dark.integrations.barbar").setup()
	end
end

function M.load()
	M.setup()
end

-- Export integration configs for users who want to merge them
M.lspsaga_config = function()
	return require("cursor-dark.integrations.lspsaga").config
end

M.nvim_tree_config = function()
	return require("cursor-dark.integrations.nvim-tree").config
end

M.barbar_config = function()
	return require("cursor-dark.integrations.barbar").config
end

return M
