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
        black       = '#241e2e',
        lblack      = '#342d42',
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
        white       = '#706897',
        lwhite      = '#a7a5cb',
    }

    M.config = vim.tbl_deep_extend('force', {}, defaults, opts or {})

    if M.config.transparency then
        colors.bg = 'none'
    end

    local panel_bg = colors.black

    local highlights = {
        -- Core editor UI
        Normal          = { fg = colors.fg, bg = colors.bg },
        NormalNC        = { fg = colors.fg, bg = colors.bg },
        EndOfBuffer     = { fg = colors.black, bg = colors.bg },
        SignColumn      = { fg = colors.fg, bg = colors.bg },
        CursorLine      = { bg = colors.lblack },
        CursorColumn    = { bg = colors.lblack },
        ColorColumn     = { bg = colors.black },
        CursorLineNr    = { fg = colors.yellow },
        CursorLineSign  = { link = 'SignColumn' },
        CursorLineFold  = { link = 'FoldColumn' },
        LineNr          = { fg = colors.white },
        LineNrAbove     = { link = 'LineNr' },
        LineNrBelow     = { link = 'LineNr' },
        Whitespace      = { fg = colors.lblack },
        FoldColumn      = { fg = colors.white, bg = colors.bg },
        Folded          = { fg = colors.white, bg = colors.black },
        Conceal         = { fg = colors.white },
        NonText         = { fg = colors.lblack },
        SpecialKey      = { fg = colors.lblack },
        Directory       = { fg = colors.blue },
        Visual          = { bg = colors.lblack },
        MatchParen      = { fg = colors.yellow, bg = colors.lblack, bold = true },
        WildMenu        = { fg = colors.black, bg = colors.lblue, bold = true },
        QuickFixLine    = { bg = colors.black, bold = true },

        -- Window/split/status/tab
        VertSplit       = { fg = colors.lblack, bg = colors.bg },
        WinSeparator    = { link = 'VertSplit' },
        StatusLine      = { fg = colors.fg, bg = panel_bg },
        StatusLineNC    = { fg = colors.white, bg = panel_bg },
        TabLine         = { fg = colors.white, bg = panel_bg },
        TabLineFill     = { fg = colors.white, bg = panel_bg },
        TabLineSel      = { fg = colors.fg, bg = colors.lblack, bold = true },
        WinBar          = { fg = colors.fg, bg = panel_bg },
        WinBarNC        = { fg = colors.white, bg = panel_bg },

        -- Popup/floating/completion
        NormalFloat     = { fg = colors.fg, bg = panel_bg },
        FloatBorder     = { fg = colors.lblack, bg = panel_bg },
        FloatTitle      = { link = 'Title' },
        Pmenu           = { fg = colors.fg, bg = panel_bg },
        PmenuSel        = { fg = colors.black, bg = colors.lblue, bold = true },
        PmenuSbar       = { bg = colors.lblack },
        PmenuThumb      = { bg = colors.white },

        -- Search/match/messages
        Search          = { fg = colors.black, bg = colors.lyellow },
        IncSearch       = { fg = colors.black, bg = colors.lblue, bold = true },
        CurSearch       = { fg = colors.black, bg = colors.lcyan, bold = true },
        Substitute      = { fg = colors.black, bg = colors.lpurple, bold = true },
        ErrorMsg        = { fg = colors.red, bold = true },
        WarningMsg      = { fg = colors.lyellow, bold = true },
        MoreMsg         = { fg = colors.lgreen, bold = true },
        ModeMsg         = { fg = colors.lblue, bold = true },
        Question        = { fg = colors.cyan, bold = true },
        MsgArea         = { fg = colors.fg, bg = colors.bg },
        MsgSeparator    = { link = 'WinSeparator' },

        -- Diff/spell
        DiffAdd         = { fg = colors.lgreen, bg = colors.black },
        DiffChange      = { fg = colors.lblue, bg = colors.black },
        DiffDelete      = { fg = colors.lred, bg = colors.black },
        DiffText        = { fg = colors.yellow, bg = colors.lblack, bold = true },
        SpellBad        = { undercurl = true, sp = colors.red },
        SpellCap        = { undercurl = true, sp = colors.lblue },
        SpellLocal      = { undercurl = true, sp = colors.lcyan },
        SpellRare       = { undercurl = true, sp = colors.purple },

        -- Terminal
        TermCursor      = { fg = colors.black, bg = colors.fg },
        TermCursorNC    = { link = 'Cursor' },

        -- Telescope support
        TelescopeNormal             = { fg = colors.fg, bg = colors.bg },
        TelescopeBorder             = { fg = colors.lblack, bg = colors.bg },
        TelescopePromptNormal       = { fg = colors.fg, bg = colors.bg },
        TelescopePromptBorder       = { fg = colors.lblue, bg = colors.bg },
        TelescopeResultsNormal      = { link = 'TelescopeNormal' },
        TelescopeResultsBorder      = { link = 'TelescopeBorder' },
        TelescopePreviewNormal      = { link = 'TelescopeNormal' },
        TelescopePreviewBorder      = { link = 'TelescopeBorder' },
        TelescopeTitle              = { link = 'Title' },
        TelescopePromptTitle        = { link = 'TelescopeTitle' },
        TelescopeResultsTitle       = { link = 'TelescopeTitle' },
        TelescopePreviewTitle       = { link = 'TelescopeTitle' },
        TelescopePromptPrefix       = { fg = colors.lblue, bg = colors.bg, bold = true },
        TelescopePromptCounter      = { fg = colors.white, bg = colors.bg },
        TelescopeSelection          = { bg = colors.lblack },
        TelescopeSelectionCaret     = { fg = colors.lblue, bg = colors.lblack },
        TelescopeMatching           = { fg = colors.lyellow, bold = true },
        TelescopeMultiSelection     = { link = 'TelescopeSelection' },
        TelescopeMultiIcon          = { fg = colors.lblue },
        TelescopePreviewLine        = { bg = colors.lblack },
        TelescopePreviewMatch       = { fg = colors.lyellow, bold = true },
        TelescopeResultsDiffAdd     = { link = 'DiffAdd' },
        TelescopeResultsDiffChange  = { link = 'DiffChange' },
        TelescopeResultsDiffDelete  = { link = 'DiffDelete' },

        -- render-markdown.nvim support
        RenderMarkdownH1              = { fg = colors.blue, bold = true },
        RenderMarkdownH2              = { fg = colors.purple, bold = true },
        RenderMarkdownH3              = { fg = colors.yellow, bold = true },
        RenderMarkdownH4              = { fg = colors.cyan, bold = true },
        RenderMarkdownH5              = { fg = colors.green, bold = true },
        RenderMarkdownH6              = { fg = colors.red, bold = true },
        RenderMarkdownH1Bg            = { fg = colors.blue, bg = colors.black, bold = true },
        RenderMarkdownH2Bg            = { fg = colors.purple, bg = colors.black, bold = true },
        RenderMarkdownH3Bg            = { fg = colors.yellow, bg = colors.black, bold = true },
        RenderMarkdownH4Bg            = { fg = colors.cyan, bg = colors.black, bold = true },
        RenderMarkdownH5Bg            = { fg = colors.green, bg = colors.lblack, bold = true },
        RenderMarkdownH6Bg            = { fg = colors.red, bg = colors.lblack, bold = true },
        RenderMarkdownCode            = { fg = colors.fg, bg = colors.black },
        RenderMarkdownCodeInfo        = { fg = colors.lpurple, bg = colors.black },
        RenderMarkdownCodeBorder      = { fg = colors.lblack, bg = colors.black },
        RenderMarkdownCodeFallback    = { fg = colors.fg, bg = colors.black },
        RenderMarkdownCodeInline      = { fg = colors.lgreen, bg = colors.lblack },
        RenderMarkdownQuote           = { fg = colors.white },
        RenderMarkdownQuote1          = { fg = colors.blue },
        RenderMarkdownQuote2          = { fg = colors.purple },
        RenderMarkdownQuote3          = { fg = colors.yellow },
        RenderMarkdownQuote4          = { fg = colors.cyan },
        RenderMarkdownQuote5          = { fg = colors.green },
        RenderMarkdownQuote6          = { fg = colors.red },
        RenderMarkdownInlineHighlight = { fg = colors.lyellow, bg = colors.lblack, bold = true },
        RenderMarkdownBullet          = { fg = colors.yellow },
        RenderMarkdownDash            = { fg = colors.white },
        RenderMarkdownSign            = { fg = colors.white, bg = colors.bg },
        RenderMarkdownMath            = { fg = colors.lpurple },
        RenderMarkdownIndent          = { fg = colors.lblack },
        RenderMarkdownHtmlComment     = { fg = colors.white, italic = true },
        RenderMarkdownLink            = { fg = colors.lblue, underline = true },
        RenderMarkdownLinkTitle       = { fg = colors.blue, italic = true },
        RenderMarkdownWikiLink        = { fg = colors.cyan, underline = true },
        RenderMarkdownUnchecked       = { fg = colors.white },
        RenderMarkdownChecked         = { fg = colors.lgreen, bold = true },
        RenderMarkdownTodo            = { fg = colors.lyellow, italic = true },
        RenderMarkdownTableHead       = { fg = colors.yellow, bold = true },
        RenderMarkdownTableRow        = { fg = colors.fg },
        RenderMarkdownSuccess         = { fg = colors.lgreen },
        RenderMarkdownInfo            = { fg = colors.lblue },
        RenderMarkdownHint            = { fg = colors.lcyan },
        RenderMarkdownWarn            = { fg = colors.lyellow },
        RenderMarkdownError           = { fg = colors.red },

        -- Syntax (existing)
        Comment         = { fg = colors.white },
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
        Title           = { fg = colors.yellow },
        PreProc         = { fg = colors.lpurple },

        -- Treesitter support (existing)
        ['@variable']                   = { fg = colors.fg },
        ['@variable.parameter']         = { fg = colors.cyan },
        ['@type.builtin']               = { fg = colors.blue },
        ['@constructor']                = { fg = colors.lblue },
        -- ['@type']                       = { fg = colors.cyan },
        -- ['@type.builtin']               = { fg = colors.cyan },

        -- Treesitter Markdown support (existing)
        ['@markup.heading.1.markdown']  = { fg = colors.blue, bold = true, },
        ['@markup.heading.2.markdown']  = { fg = colors.purple, bold = true, },
        ['@markup.heading.3.markdown']  = { fg = colors.yellow, bold = true, },
        ['@markup.heading.4.markdown']  = { fg = colors.cyan, bold = true, },
        ['@markup.heading.5.markdown']  = { fg = colors.green, bold = true, },
        ['@markup.heading.6.markdown']  = { fg = colors.red, bold = true, },
        ['@markup.list.markdown']       = { fg = colors.yellow },

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

        -- Diagnostics support (existing)
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

    vim.g.terminal_color_0  = colors.black
    vim.g.terminal_color_1  = colors.red
    vim.g.terminal_color_2  = colors.green
    vim.g.terminal_color_3  = colors.yellow
    vim.g.terminal_color_4  = colors.blue
    vim.g.terminal_color_5  = colors.purple
    vim.g.terminal_color_6  = colors.cyan
    vim.g.terminal_color_7  = colors.fg
    vim.g.terminal_color_8  = colors.lblack
    vim.g.terminal_color_9  = colors.lred
    vim.g.terminal_color_10 = colors.lgreen
    vim.g.terminal_color_11 = colors.lyellow
    vim.g.terminal_color_12 = colors.lblue
    vim.g.terminal_color_13 = colors.lpurple
    vim.g.terminal_color_14 = colors.lcyan
    vim.g.terminal_color_15 = colors.lwhite

end

return M
