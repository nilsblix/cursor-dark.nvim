-- Color palette from Cursor Dark theme
-- Colors approximated from Cursor's alpha-blended values (Neovim doesn't support alpha)
local M = {}

M.palette = {
	-- Main editor colors
	bg = "#181818", -- editor.background
	fg = "#D6D6DD", -- editor.foreground
	fg_dark = "#A6A6A6", -- dimmed foreground
	fg_darker = "#535353", -- muted foreground
	fg_light = "#737373", -- whitespace and faint text

	bg_sidebar = "#181818", -- sideBar.background
	bg_statusline = "#181818", -- statusBar.background
	bg_line = "#181818", -- editor.lineHighlightBackground
	bg_float = "#1D1D1D", -- editorWidget/hover background

	-- Syntax colors (from Cursor Dark theme)
	comment = "#6D6D6D", -- Comments
	string = "#E394DC", -- Strings
	keyword = "#83D6C5", -- Keywords
	func = "#EFB080", -- Functions
	variable = "#D6D6DD", -- Variables
	constant = "#83D6C5", -- Constants
	number = "#EBC88D", -- Numbers
	type = "#87C3FF", -- Types, classes
	property = "#AA9BF5", -- Properties
	operator = "#D6D6DD", -- Operators
	operator_keyword = "#83D6C5", -- Operator keywords

	-- Special colors
	green = "#15AC91", -- Git added, decorators
	green_bright = "#A8CC7C", -- Brighter green
	cyan = "#75D3BA", -- Cyan
	teal = "#82D2CE", -- Built-ins, booleans
	orange = "#EFB080", -- Functions, parameters
	yellow = "#F8C762", -- Modified files, warnings
	yellow_dark = "#E5B95C", -- Darker yellow
	red = "#F14C4C", -- Errors, deleted
	red_bright = "#F44747", -- Brighter red
	magenta = "#E394DC", -- Special keywords, strings
	magenta_bright = "#E567DC", -- Brighter magenta
	purple = "#AA9BF5", -- Properties
	blue = "#228DF2", -- Links, buttons
	blue_light = "#4C9DF3", -- Lighter blue
	blue_bright = "#87C3FF", -- Bright blue

	-- UI element colors (approximations of alpha-blended values)
	cursor = "#D6D6DD",
	selection = "#163761", -- editor.selectionBackground
	selection_inactive = "#363636", -- editor.inactiveSelectionBackground
	line_number = "#535353", -- editorLineNumber.foreground
	line_number_active = "#C2C2C2", -- editorLineNumber.activeForeground
	border = "#383838", -- editorGroup.border
	border_focus = "#4F4F4F", -- checkbox.border
	visual = "#363636", -- selection inactive
	search = "#163764", -- editor.findMatchBackground
	search_match = "#7C511A", -- editor.findMatchHighlightBackground

	-- Semantic element colors
	error = "#F14C4C",
	warning = "#EA7620",
	info = "#228DF2",
	hint = "#75D3BA",

	-- Git decoration colors
	git_add = "#15AC91",
	git_change = "#E5B95C",
	git_delete = "#F14C4C",
	git_ignored = "#666666",
	git_untracked = "#3EA17F",

	-- Diff colors (approximations)
	diff_add_bg = "#2C3C39",
	diff_add_text_bg = "#3A544E",
	diff_delete_bg = "#412222",
	diff_delete_text_bg = "#5C2828",

	-- Special UI colors
	button_bg = "#228DF2",
	button_hover = "#359DFF",
	link = "#228DF2",

	-- Transparent
	none = "NONE",
}

return M
