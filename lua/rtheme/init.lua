local M = {}

local defaults = {
    transparency = false
}

M.config = {}

function M.setup(opts)
    vim.cmd('highlight clear')
    vim.cmd('syntax reset')

    local colors = {
        fg          = '#eeebff',
        bg          = '#110f15',
        black       = '#272133',
        lblack      = '#382f4a',
        red         = '#ff4f7f',
        lred        = '#ff79a0',
        green       = '#a6ff65',
        lgreen      = '#b9ff91',
        yellow      = '#ffa770',
        lyellow     = '#ffd986',
        blue        = '#6daeff',
        lblue       = '#76ddff',
        purple      = '#b483ff',
        lpurple     = '#fb97ff',
        cyan        = '#36ffc3',
        lcyan       = '#6fffe7',
        white       = '#645d87',
        lwhite      = '#9e9cc0',
    }

    M.config = vim.tbl_deep_extend("force", {}, defaults, opts or {})

    if M.config.transparency then
        colors.bg = "none"
    end

    local highlights = {
        Normal          = { fg = colors.fg, bg = colors.bg },
        Comment         = { fg = colors.white },
        Visual          = { bg = colors.black },
        Function        = { fg = colors.lblue },
        Identifier      = { fg = colors.fg },
        String          = { fg = colors.lgreen },
        Statement       = { fg = colors.purple },
        Constant        = { fg = colors.yellow },
        Operator        = { fg = colors.lblue },
        Delimiter       = { fg = colors.lblue },
        Type            = { fg = colors.blue },
        Special         = { fg = colors.fg },
        Variable        = { fg = colors.fg },
        CursorLine      = { bg = colors.black },
        ColorColumn     = { bg = colors.lblack },
        CursorLineNr    = { fg = colors.yellow },
        LineNr          = { fg = colors.white },
        Whitespace      = { fg = colors.lblack },
        Title           = { fg = colors.yellow },
        PreProc         = { fg = colors.lpurple },


        -- Treesitter support
        ["@variable"]                   = { fg = colors.fg },
        ["@variable.parameter"]         = { fg = colors.lpurple },
        ["@type.builtin"]               = { fg = colors.blue },
        ["@constructor"]                = { fg = colors.lblue },
        -- ["@type"]                       = { fg = colors.cyan },
        -- ["@type.builtin"]               = { fg = colors.cyan },

        -- Treesitter Markdown support
        ["@markup.heading.1.markdown"]  = { fg = colors.blue, bold = true, },
        ["@markup.heading.2.markdown"]  = { fg = colors.purple, bold = true, },
        ["@markup.heading.3.markdown"]  = { fg = colors.yellow, bold = true, },
        ["@markup.heading.4.markdown"]  = { fg = colors.cyan, bold = true, },
        ["@markup.heading.5.markdown"]  = { fg = colors.green, bold = true, },
        ["@markup.heading.6.markdown"]  = { fg = colors.red, bold = true, },

        ["@markup.list.markdown"] = { fg = colors.yellow },

        -- Todo support
        -- NOTE: THING
        -- TODO: THING
        -- FIX: THING
        -- WARN: THING
        -- HACK: THING
        -- PERF: THING
        -- TEST: THING

        TodoBgNOTE      = { bg = colors.lblue, fg = colors.black, bold = true, italic = true },
        TodoFgNOTE      = { fg = colors.lblue, italic = true },
        TodoSignNOTE    = { fg = colors.lblue, italic = true },
        TodoBgTODO      = { bg = colors.lcyan, fg = colors.black, bold = true, italic = true },
        TodoFgTODO      = { fg = colors.lcyan, italic = true },
        TodoSignTODO    = { fg = colors.lcyan, italic = true },
        TodoBgFIX       = { bg = colors.red, fg = colors.black, bold = true, italic = true },
        TodoFgFIX       = { fg = colors.red, italic = true },
        TodoSignFIX     = { fg = colors.red, italic = true },
        TodoBgWARN      = { bg = colors.lyellow, fg = colors.black, bold = true, italic = true },
        TodoFgWARN      = { fg = colors.lyellow, italic = true },
        TodoSignWARN    = { fg = colors.lyellow, italic = true },
        TodoBgHACK      = { bg = colors.lyellow, fg = colors.black, bold = true, italic = true },
        TodoFgHACK      = { fg = colors.lyellow, italic = true },
        TodoSignHACK    = { fg = colors.lyellow, italic = true },
        TodoBgPERF      = { bg = colors.lwhite, fg = colors.black, bold = true, italic = true },
        TodoFgPERF      = { fg = colors.lwhite, italic = true },
        TodoSignPERF    = { fg = colors.lwhite, italic = true },
        TodoBgTEST      = { bg = colors.lwhite, fg = colors.black, bold = true, italic = true },
        TodoFgTEST      = { fg = colors.lwhite, italic = true },
        TodoSignTEST    = { fg = colors.lwhite, italic = true },

        -- Diagnostics Support
        DiagnosticError = { fg = colors.red, bold = false },
        DiagnosticWarn  = { fg = colors.lyellow, bold = false },
        DiagnosticHint  = { fg = colors.lcyan, bold = false },
        DiagnosticInfo  = { fg = colors.lblue, bold = false },

        -- Gitsigns support
        GitsignsAdd     = { fg = colors.lgreen },
        GitsignsChange  = { fg = colors.lblue },
        GitsignsDelete  = { fg = colors.lred },
    }

    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end

end

return M
