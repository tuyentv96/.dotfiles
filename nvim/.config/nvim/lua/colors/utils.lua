local M = {}

function M.prop(fg, bg, style, v)
    return {
        fg    = fg,
        bg    = bg,
        style = style,
    }
end

function M.color(hex, v)
    return {hex,v}
end

local function highlight(group, properties)
    local fg = properties.fg == nil and "" or "guifg=" .. properties.fg
    local bg = properties.bg == nil and "" or "guibg=" .. properties.bg
    local style = properties.style == nil and "" or "gui=" .. properties.style

    local cmd = table.concat({
        "highlight", group, bg, fg, style
    }, " ")

    vim.api.nvim_command(cmd)
end

function M.initialise(skeleton)
    for group, properties in pairs(skeleton) do
        highlight(group, properties)
    end
end

return M
