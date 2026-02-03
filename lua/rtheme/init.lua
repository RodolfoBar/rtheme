local M = {}

function M.setup()
    vim.cmd('highlight clear')
    vim.cmd('syntax reset')

    local colors = {
        fg          = '#cbcbcb',
        bg          = '#000000',
        black       = '#191919',
        red         = '#ff5647',
        green       = '#c2ff00',
        yellow      = '#ffdb00',
        blue        = '#49B7FF',
        purple      = '#cc82ff',
        cyan        = '#6cffec',
        white       = '#4e4e4e',
        lblack      = '#323232',
        lred        = '#ff5647',
        lgreen      = '#c2ff00',
        lyellow     = '#ffdb00',
        lblue       = '#49B7FF',
        lpurple     = '#cc82ff',
        lcyan       = '#6cffec',
        lwhite      = '#aaaaaa',

        orange      = '#ff8c00'
    }

    local highlights = {
        Normal          = { fg = colors.fg, bg = colors.bg },
        Comment         = { fg = colors.white },
        Visual          = { bg = colors.black },
        Function        = { fg = colors.blue },
        Identifier      = { fg = colors.fg },
        String          = { fg = colors.green },
        Statement       = { fg = colors.purple },
        Constant        = { fg = colors.fg },
        Operator        = { fg = colors.fg },
        Delimiter       = { fg = colors.fg },
        Type            = { fg = colors.fg },
        Special         = { fg = colors.fg },
        Variable        = { fg = colors.fg },
        CursorLine      = { bg = colors.black },
        --ColorColumn     = { bg = "#1d1f21" },
        ColorColumn     = { bg = colors.lblack },
        CursorLineNr    = { fg = colors.orange },
        LineNr          = { fg = colors.white },
        Whitespace      = { fg = colors.white},
        Title           = { fg = colors.orange },


        -- Treesitter support
        ["@variable"]   = { fg = colors.fg },
        ["@variable.parameter"] = { fg = colors.orange },

        -- Treesitter Markdown support
        ["@markup.heading.1.markdown"] = { fg = colors.blue, bold = true, },
        ["@markup.heading.2.markdown"] = { fg = colors.orange, bold = true, },
        ["@markup.heading.3.markdown"] = { fg = colors.purple, bold = true, },
        ["@markup.heading.4.markdown"] = { fg = colors.red, bold = true, },
        ["@markup.heading.5.markdown"] = { fg = colors.cyan, bold = true, },
        ["@markup.heading.6.markdown"] = { fg = colors.green, bold = true, },

        -- Todo support
        -- NOTE: THING
        -- TODO: THING
        -- FIX: THING
        -- WARN: THING
        -- HACK: THING
        -- PERF: THING
        -- TEST: THING

        TodoBgNOTE      = { bg = colors.blue, fg = colors.bg, bold = true, italic = true },
        TodoFgNOTE      = { fg = colors.blue, italic = true },
        TodoSignNOTE    = { fg = colors.blue, italic = true },
        TodoBgTODO      = { bg = colors.lcyan, fg = colors.bg, bold = true, italic = true },
        TodoFgTODO      = { fg = colors.lcyan, italic = true },
        TodoSignTODO    = { fg = colors.lcyan, italic = true },
        TodoBgFIX       = { bg = colors.red, fg = colors.bg, bold = true, italic = true },
        TodoFgFIX       = { fg = colors.red, italic = true },
        TodoSignFIX     = { fg = colors.red, italic = true },
        TodoBgWARN      = { bg = colors.yellow, fg = colors.bg, bold = true, italic = true },
        TodoFgWARN      = { fg = colors.yellow, italic = true },
        TodoSignWARN    = { fg = colors.yellow, italic = true },
        TodoBgHACK      = { bg = colors.yellow, fg = colors.bg, bold = true, italic = true },
        TodoFgHACK      = { fg = colors.yellow, italic = true },
        TodoSignHACK    = { fg = colors.yellow, italic = true },
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
