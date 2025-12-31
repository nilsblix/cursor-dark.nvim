local M = {}

M.config = {
	-- Enable UI customizations (statuscolumn, line numbers).
	ui = true,
	-- Disable all italic styling.
	italics = true,
    -- Use magenta instead of white/grey for the operators.
    coloured_operators = false,
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
end

function M.load()
	M.setup()
end

return M
