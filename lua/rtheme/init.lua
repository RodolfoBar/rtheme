local M = {}

function M.setup()
    vim.cmd('highlight clear')
    vim.cmd('syntax reset')

    local colors = {
        fg          = '#bfc5d2',
        bg          = '#000000',
        black       = '#1a1b1d',
        lblack      = '#242527',
        red         = '#ff3551',
        lred        = '#ff5f7c',
        green       = '#4be451',
        lgreen      = '#82ed7b',
        yellow      = '#ff9a46',
        lyellow     = '#ffd155',
        blue        = '#77a8ff',
        lblue       = '#81d8ff',
        purple      = '#b582ff',
        lpurple     = '#da7fff',
        cyan        = '#33fad5',
        lcyan       = '#99ffde',
        white       = '#4c4e53',
        lwhite      = '#b3b7c1',
    }

    local highlights = {
        Normal          = { fg = colors.fg, bg = colors.bg },
        Comment         = { fg = colors.white },
        Visual          = { bg = colors.black },
        Function        = { fg = colors.lblue },
        Identifier      = { fg = colors.fg },
        String          = { fg = colors.lgreen },
        Statement       = { fg = colors.purple },
        Constant        = { fg = colors.lcyan },
        Operator        = { fg = colors.fg },
        Delimiter       = { fg = colors.fg },
        Type            = { fg = colors.fg },
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
        ["@variable.parameter"]         = { fg = colors.yellow },
        -- ["@type"]                       = { fg = colors.cyan },
        -- ["@type.builtin"]               = { fg = colors.cyan },

        -- Treesitter Markdown support
        ["@markup.heading.1.markdown"]  = { fg = colors.blue, bold = true, },
        ["@markup.heading.2.markdown"]  = { fg = colors.orange, bold = true, },
        ["@markup.heading.3.markdown"]  = { fg = colors.purple, bold = true, },
        ["@markup.heading.4.markdown"]  = { fg = colors.red, bold = true, },
        ["@markup.heading.5.markdown"]  = { fg = colors.cyan, bold = true, },
        ["@markup.heading.6.markdown"]  = { fg = colors.green, bold = true, },

        -- Todo support
        -- NOTE: THING
        -- TODO: THING
        -- FIX: THING
        -- WARN: THING
        -- HACK: THING
        -- PERF: THING
        -- TEST: THING

        TodoBgNOTE      = { bg = colors.lblue, fg = colors.bg, bold = true, italic = true },
        TodoFgNOTE      = { fg = colors.lblue, italic = true },
        TodoSignNOTE    = { fg = colors.lblue, italic = true },
        TodoBgTODO      = { bg = colors.lcyan, fg = colors.bg, bold = true, italic = true },
        TodoFgTODO      = { fg = colors.lcyan, italic = true },
        TodoSignTODO    = { fg = colors.lcyan, italic = true },
        TodoBgFIX       = { bg = colors.red, fg = colors.bg, bold = true, italic = true },
        TodoFgFIX       = { fg = colors.red, italic = true },
        TodoSignFIX     = { fg = colors.red, italic = true },
        TodoBgWARN      = { bg = colors.lyellow, fg = colors.bg, bold = true, italic = true },
        TodoFgWARN      = { fg = colors.lyellow, italic = true },
        TodoSignWARN    = { fg = colors.lyellow, italic = true },
        TodoBgHACK      = { bg = colors.lyellow, fg = colors.bg, bold = true, italic = true },
        TodoFgHACK      = { fg = colors.lyellow, italic = true },
        TodoSignHACK    = { fg = colors.lyellow, italic = true },
        TodoBgPERF      = { bg = colors.lwhite, fg = colors.bg, bold = true, italic = true },
        TodoFgPERF      = { fg = colors.lwhite, italic = true },
        TodoSignPERF    = { fg = colors.lwhite, italic = true },
        TodoBgTEST      = { bg = colors.lwhite, fg = colors.bg, bold = true, italic = true },
        TodoFgTEST      = { fg = colors.lwhite, italic = true },
        TodoSignTEST    = { fg = colors.lwhite, italic = true },
    }

    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end

end

return M
