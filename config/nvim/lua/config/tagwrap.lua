-- tagwrap.lua
-- Simple visual-line wrapper: asks for a tag name and wraps the selected lines.
-- Usage: visually select lines, press <leader>w (or remap), type tag name (no < >), Enter.

local M = {}

function M.wrap_visual_with_tag()
    local buf = vim.api.nvim_get_current_buf()

    -- Get visual selection line numbers
    local s = vim.fn.getpos("'<")[2]
    local e = vim.fn.getpos("'>")[2]
    if s > e then
        s, e = e, s
    end

    -- Prompt user for tag (no angle brackets). empty -> do nothing
    local tag = vim.fn.input("Tag name (e.g. h1, p, section): ")
    if tag == nil or tag == "" then
        print("Cancelled: no tag entered.")
        return
    end

    -- Prepare lines to insert
    local open = "<" .. tag .. ">"
    local close = "</" .. tag .. ">"

    -- Insert opening tag above start line
    local open_index = s - 1 -- 0-based index to insert
    vim.api.nvim_buf_set_lines(buf, open_index, open_index, false, { open })

    -- After inserting opening tag, the end line shifts +1
    local close_index = e + 1 -- still 0-based insertion index where we want closing tag
    vim.api.nvim_buf_set_lines(buf, close_index, close_index, false, { close })

    -- Move cursor to the opening tag line
    vim.api.nvim_win_set_cursor(0, { s, 0 })

    -- Clear visual selection (just in case)
    vim.cmd("normal! :<C-u>")
end

-- Map <leader>w in visual mode to run this function.
-- If you already have a keymap loader, you can just call the function instead of setting a new map.
vim.keymap.set("v", "<leader>w", M.wrap_visual_with_tag, {
    noremap = true,
    silent = true,
    desc = "Visual: wrap selection with tag (interactive)",
})

return M
