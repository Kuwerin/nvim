function callCurl()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local lines = vim.api.nvim_buf_get_lines(0, row-1, vim.api.nvim_buf_line_count(0), false) or {""}
    local commandLines = ""
    for k,v in pairs(lines) do
        if v ~= "" then
            commandLines = vim.api.nvim_buf_get_lines(0, row-1, row+k-1, false)
            break
        end
    end

    local command = table.concat(commandLines, " ")
    command = command:gsub('[%c]', '')
    vim.cmd('!'..command..' | jq  > /tmp/curl-responses/response.json')
    buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    local win_height = math.ceil(height * 0.8 - 4)
    local win_width = math.ceil(width * 0.8)

    local row = math.ceil((height - win_height) / 2 - 1)
    local col = math.ceil((width - win_width) / 2)

    local opts = {
        style = "minimal",
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        border = "rounded",
    }

    win = vim.api.nvim_open_win(buf, true, opts)
    vim.api.nvim_win_set_option(win, "cursorline", true)
    vim.api.nvim_buf_set_option(buf, "modifiable", true)
    vim.cmd(":edit /tmp/curl-responses/response.json")
    vim.api.nvim_buf_set_option(0, "modifiable", false)
end