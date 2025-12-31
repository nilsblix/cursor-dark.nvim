local colors = require("cursor-dark.colors").palette

local M = {}

function M.setup()
	local config = require("cursor-dark").config
	local use_italics = config.italics

    local operator_colour = colors.operator
    if config.coloured_operators then
        operator_colour = colors.magenta
    end


	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "dark"
	vim.g.colors_name = "cursor-dark"

    -- All of the nvim-treesitter highlight groups are found here:
    -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
    local canon = {
        -- Identifiers
        ["@variable"] = { fg = colors.variable },
        ["@variable.builtin"] = { fg = colors.blue },               -- built-in variable names (e.g. `this`)
        ["@variable.parameter"] = { fg = colors.variable },         -- parameters of a function
        ["@variable.parameter.builtin"] = { fg = colors.variable }, -- special parameters (e.g. `_`, `it`)
        ["@variable.member"] = { fg = colors.property },            -- object and struct fields

        ["@constant"] = { fg = colors.purple },         -- constant identifiers
        ["@constant.builtin"] = { fg = colors.purple }, -- built-in constant values
        ["@constant.macro"] = { fg = colors.purple },   -- constants defined by the preprocessor

        ["@module"] = { fg = colors.type },         -- modules or namespaces
        ["@module.builtin"] = { fg = colors.type }, -- built-in modules or namespaces
        ["@label"] = { fg = colors.keyword },       -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

        -- Strings
        ["@string"] = { fg = colors.string },                   -- string literals
        ["@string.documentation"] = { fg = colors.string },     -- string documenting code (e.g. Python docstrings)
        ["@string.regexp"] = { fg = colors.string },            -- regular expressions
        ["@string.escape"] = { fg = colors.green },             -- escape sequences
        ["@string.special"] = { fg = colors.string },           -- other special strings (e.g. dates)
        ["@string.special.symbol"] = { fg = colors.string },    -- symbols or atoms
        ["@string.special.url"] = { fg = colors.string },       -- URIs (e.g. hyperlinks)
        ["@string.special.path"] = { fg = colors.string },      -- filenames

        ["@character"] = { fg = colors.string },            -- character literals
        ["@character.special"] = { fg = colors.string },    -- special characters (e.g. wildcards)

        ["@boolean"] = { fg = colors.literal },         -- boolean literals
        ["@number"] = { fg = colors.literal },          -- numeric literals
        ["@number.float"] = { fg = colors.literal },    -- floating-point number literals

        -- Types
        ["@type"] = { fg = colors.type },               -- type or class definitions and annotations
        ["@type.builtin"] = { fg = colors.type },       -- built-in types
        ["@type.definition"] = { fg = colors.type },    -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

        ["@attribute"] = { fg = colors.orange },                -- attribute annotations (e.g. Python decorators, Rust lifetimes)
        ["@attribute.builtin"] = { fg = colors.yellow_bright }, -- builtin annotations (e.g. `@property` in Python)
        ["@property"] = { fg = colors.property },               -- the key in key/value pairs

        -- Functions
        ["@function"] = { fg = colors.func },           -- function definitions
        ["@function.builtin"] = { fg = colors.func },   -- built-in functions
        ["@function.call"] = { fg = colors.func },      -- function calls
        ["@function.macro"] = { fg = colors.macro },    -- preprocessor macros

        ["@function.method"] = { fg = colors.func },        -- method definitions
        ["@function.method.call"] = { fg = colors.func },   -- method calls

        ["@constructor"] = { fg = colors.func },    -- constructor calls and definitions
        ["@operator"] = { fg = operator_colour },   -- standard operators

        -- Keywords
        ["@keyword"] = { fg = colors.keyword },             -- keywords not fitting into specific categories
        ["@keyword.coroutine"] = { fg = colors.keyword },   -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
        ["@keyword.function"] = { fg = colors.keyword },    -- keywords that define a function (e.g. `func` in Go, `def` in Python)
        ["@keyword.operator"] = { fg = colors.keyword },    -- operators that are English words (e.g. `and` / `or`)
        ["@keyword.import"] = { fg = colors.keyword },      -- keywords for including or exporting modules (e.g. `import` / `from` in Python)
        ["@keyword.type"] = { fg = colors.keyword },        -- keywords describing namespaces and composite types (e.g. `struct`, `enum`)
        ["@keyword.modifier"] = { fg = colors.keyword },    -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
        ["@keyword.repeat"] = { fg = colors.keyword },      -- keywords related to loops (e.g. `for` / `while`)
        ["@keyword.return"] = { fg = colors.keyword },      -- keywords like `return` and `yield`
        ["@keyword.debug"] = { fg = colors.keyword },       -- keywords related to debugging
        ["@keyword.exception"] = { fg = colors.keyword },   -- keywords related to exceptions (e.g. `throw` / `catch`)

        ["@keyword.conditional"] = { fg = colors.keyword },         -- keywords related to conditionals (e.g. `if` / `else`)
        ["@keyword.conditional.ternary"] = { fg = colors.keyword }, -- ternary operator (e.g. `?` / `:`)

        ["@keyword.directive"] = { fg = colors.comment },           -- various preprocessor directives & shebangs
        ["@keyword.directive.define"] = { fg = colors.comment },    -- preprocessor definition directives

        -- Punctuation
        ["@punctuation.delimiter"] = { fg = colors.fg },            -- delimiters (e.g. `;` / `.` / `,`)
        ["@punctuation.bracket"] = { fg = colors.fg },              -- brackets (e.g. `()` / `{}` / `[]`)
        ["@punctuation.special"] = { fg = colors.magenta_bright },  -- special symbols (e.g. `{}` in string interpolation)

        -- Comments
        ["@comment"] = { fg = colors.comment, italic = use_italics },               -- line and block comments
        ["@comment.documentation"] = { fg = colors.comment, italic = use_italics }, -- comments documenting code

        ["@comment.error"] = { fg = colors.comment },   -- error-type comments (e.g. `ERROR`, `BUG`, `DEPRECATED`)
        ["@comment.warning"] = { fg = colors.comment }, -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
        ["@comment.todo"] = { fg = colors.comment },    -- todo-type comments (e.g. `TODO`, `WIP`)
        ["@comment.note"] = { fg = colors.comment },    -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

        -- Markup
        ["@markup.strong"] = { bold = true },   -- bold text
        ["@markup.italic"] = { italic = true }, -- italic text
        ["@markup.strikethrough"] = { fg = colors.line_number, strikethrough = true },  -- struck-through text
        ["@markup.underline"] = { underline = true },   -- underlined text (only for literal underline markup!)

        ["@markup.heading"] = { fg = colors.green },    -- headings, titles (including markers)
        ["@markup.heading.1"] = { fg = colors.cyan },   -- top-level heading
        ["@markup.heading.2"] = { fg = colors.teal },   -- section heading
        ["@markup.heading.3"] = { fg = colors.green },  -- subsection heading
        ["@markup.heading.4"] = { fg = colors.blue },   -- and so on
        ["@markup.heading.5"] = { fg = colors.purple }, -- and so forth
        ["@markup.heading.6"] = { fg = colors.yellow }, -- six levels ought to be enough for anybody

        ["@markup.quote"] = { fg = colors.comment, italic = use_italics },  -- block quotes
        ["@markup.math"] = { fg = colors.orange },                          -- math environments (e.g. `$ ... $` in LaTeX)

        ["@markup.link"] = { fg = colors.fg_dark },         -- text references, footnotes, citations, etc.
        ["@markup.link.label"] = { fg = colors.fg_light },  -- link, reference descriptions
        ["@markup.link.url"] = { fg = colors.fg_dark },     -- URL-style links

        ["@markup.raw"] = { fg = colors.yellow },               -- literal or verbatim text (e.g. inline code)
        ["@markup.raw.block"] = { fg = colors.yellow_dark },    -- literal or verbatim text as a stand-alone block (use priority 90 for blocks with injections)

        ["@markup.list"] = { fg = colors.fg_dark },         -- list markers
        ["@markup.list.checked"] = { fg = colors.teal },    -- checked todo-style list markers
        ["@markup.list.unchecked"] = { fg = colors.teal },  -- unchecked todo-style list markers

        -- Diffs
        ["@diff.plus"] = { fg = colors.git_add },       -- added text (for diff files)
        ["@diff.minus"] = { fg = colors.git_delete },   -- deleted text (for diff files)
        ["@diff.delta"] = { fg = colors.git_change },   -- changed text (for diff files)

        -- Tags
        ["@tag"] = { fg = colors.green },               -- XML-style tag names (and similar)
        ["@tag.builtin"] = { fg = colors.type },        -- builtin tag names (e.g. HTML5 tags)
        ["@tag.attribute"] = { fg = colors.property },  -- XML-style tag attributes
        ["@tag.delimiter"] = { fg = colors.fg_dark },   -- XML-style tag delimiters

        -- Non-highlighting captures
        ["@none"] = { fg = colors.none, bg = colors.none },     -- completely disable the highlight
        ["@conceal"] = { fg = colors.fg_light },                -- captures that are only meant to be concealed
        ["@spell"] = { fg = colors.none, bg = colors.none },    -- for defining regions to be spellchecked
        ["@nospell"] = { fg = colors.none, bg = colors.none },  -- for defining regions that should NOT be spellchecked

		Normal = { fg = colors.fg, bg = colors.bg },
		NormalFloat = { fg = colors.fg, bg = colors.bg_float },
		NormalNC = { fg = colors.fg, bg = colors.bg },

		-- Cursor
		Cursor = { fg = colors.bg, bg = colors.cursor },
		CursorLine = { bg = colors.bg_line },
		CursorColumn = { bg = colors.bg_line },
		CursorLineNr = { fg = colors.line_number_active, bold = true },
		LineNr = { fg = colors.line_number },

		-- Selection
		Visual = { bg = colors.selection },
		VisualNOS = { bg = colors.selection },
		Search = { bg = colors.search },
		IncSearch = { bg = colors.search, fg = colors.fg },

		-- UI Elements
		Pmenu = { fg = colors.fg_dark, bg = colors.bg_float },
		PmenuSel = { bg = colors.selection_inactive, fg = colors.fg },
		PmenuSbar = { bg = colors.border },
		PmenuThumb = { bg = colors.line_number },
		StatusLine = { fg = colors.fg_dark, bg = colors.bg_statusline },
		StatusLineNC = { fg = colors.fg_darker, bg = colors.bg_statusline },
		TabLine = { fg = colors.fg_dark, bg = colors.bg_sidebar },
		TabLineFill = { bg = colors.bg_sidebar },
		TabLineSel = { fg = colors.fg, bg = colors.bg },
		VertSplit = { fg = colors.border },
		WinSeparator = { fg = colors.border },
		FloatBorder = { fg = colors.border },

		-- Windows and groups
		WinBar = { bg = colors.bg },
		WinBarNC = { bg = colors.bg },

		-- Diagnostics
		DiagnosticError = { fg = colors.error },
		DiagnosticWarn = { fg = colors.warning },
		DiagnosticInfo = { fg = colors.info },
		DiagnosticHint = { fg = colors.hint },
		DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
		DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning },
		DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info },
		DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint },

		-- Git signs
		DiffAdd = { bg = colors.diff_add_bg },
		DiffChange = { bg = colors.diff_add_text_bg },
		DiffDelete = { bg = colors.diff_delete_bg },
		DiffText = { bg = colors.diff_add_text_bg },

		GitSignsAdd = { fg = colors.git_add },
		GitSignsChange = { fg = colors.git_change },
		GitSignsDelete = { fg = colors.git_delete },

		-- Gitsigns (specific)
		GitSignsCurrentLineBlame = { fg = colors.git_ignored, italic = use_italics },

		-- Diff view
		diffAdded = { fg = colors.git_add },
		diffRemoved = { fg = colors.git_delete },
		diffChanged = { fg = colors.git_change },
		diffOldFile = { fg = colors.git_delete },
		diffNewFile = { fg = colors.git_add },
		diffFile = { fg = colors.blue },
		diffLine = { fg = colors.property },
		diffIndexLine = { fg = colors.fg_dark },

		-- Links
		Underlined = { fg = colors.link, underline = true },

		-- Misc
		ErrorMsg = { fg = colors.error },
		WarningMsg = { fg = colors.warning },
		MoreMsg = { fg = colors.info },
		Question = { fg = colors.info },
		Title = { fg = colors.blue, bold = true },
		Directory = { fg = colors.blue },
		MatchParen = { bg = colors.selection },
		Folded = { fg = colors.comment, bg = colors.bg_sidebar },
		FoldColumn = { fg = colors.comment },
		SignColumn = { bg = colors.bg },
		ColorColumn = { bg = colors.bg_line },

		-- Spell
		SpellBad = { undercurl = true, sp = colors.error },
		SpellCap = { undercurl = true, sp = colors.warning },
		SpellLocal = { undercurl = true, sp = colors.info },
		SpellRare = { undercurl = true, sp = colors.hint },

		-- Quickfix
		qfFileName = { fg = colors.blue },
		qfLineNr = { fg = colors.fg_dark },

		-- Indent guides
		IndentBlanklineChar = { fg = colors.border },
		IndentBlanklineContextChar = { fg = colors.border_focus },

		-- Whitespace
		Whitespace = { fg = colors.fg_light },
		NonText = { fg = colors.fg_light },
		SpecialKey = { fg = colors.fg_light },

		-- Wild menu
		WildMenu = { fg = colors.fg, bg = colors.selection },

		-- Help files
		helpCommand = { fg = colors.green },
		helpExample = { fg = colors.green },
		helpHeadline = { fg = colors.blue, bold = true },
		helpSectionDelim = { fg = colors.fg_dark },
    }

    local links = {
		Comment = canon["@comment"],
		Constant = canon["@constant"],
		String = canon["@string"],
		Character = canon["@character"],
		Number = canon["@number"],
		Boolean = canon["@boolean"],
		Float = canon["@number.float"],

		Identifier = canon["@variable"],
		Function = canon["@function"],

		Statement = canon["@variable"],
		Conditional = canon["@keyword.conditional"],
		Repeat = canon["@keyword.repeat"],
		Label = canon["@label"],
		Operator = canon["@operator"],
		Keyword = canon["@keyword"],
		Exception = canon["@keyword.exception"],

		PreProc = canon["@funcion.macro"],
		Include = canon["@keyword.import"],
		Define = canon["@keyword.import"],
		Macro = canon["@function.macro"],
		PreCondit = canon["@comment"],

		Type = canon["@type"],
		StorageClass = canon["@type"],
		Structure = canon["@type"],
		Typedef = canon["@type"],

		Special = canon["@string.special"],
		SpecialChar = canon["@string.escape"],
		Tag = canon["@tag"],
		Delimiter = canon["@variable"],
		SpecialComment = canon["@comment"],
		Debug = { fg = colors.red },

		-- LSP Semantic Tokens
		["@lsp.type.namespace"] = canon["@module"],
		["@lsp.type.type"] = canon["@type"],
		["@lsp.type.class"] = canon["@type"],
		["@lsp.type.enum"] = canon["@type"],
		["@lsp.type.interface"] = canon["@type"],
		["@lsp.type.struct"] = canon["@type"],
		["@lsp.type.parameter"] = canon["@variable.parameter"],
		["@lsp.type.variable"] = canon["@variable"],
		["@lsp.type.property"] = canon["@property"],
		["@lsp.type.enumMember"] = canon["@variable.member"],
		["@lsp.type.function"] = canon["@function"],
		["@lsp.type.method"] = canon["@function"],
		["@lsp.type.macro"] = canon["@function.macro"],
		["@lsp.type.decorator"] = canon["@function.macro"],
		["@lsp.type.comment"] = canon["@comment"],
		["@lsp.type.builtinType"] = canon["@type"],

        -- Language specific stuff (quite specific to my workflow/languages)
		["@function.builtin.zig"] = { fg = colors.yellow_bright },
    }

	for group, opts in pairs(canon) do
		vim.api.nvim_set_hl(0, group, opts)
	end

    for group, to_link in pairs(links) do
        vim.api.nvim_set_hl(0, group, to_link)
    end
end

return M
