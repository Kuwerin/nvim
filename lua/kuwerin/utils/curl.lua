-- Execute cURL responses from the text editor
-- from string e.g. `curl -s http://jsonplaceholder.typicode.com/users`
-- and parse it with jq


-- TODO: refactor envvar sourcing
-- Needs to set as vim global variable
local curl_history_dir = os.getenv("CURL_HISTORY_DIR").."/" or "~/.vim/curl/history/"

function callCurl()
  local linenr = vim.api.nvim_win_get_cursor(0)[1]
  local cmd = vim.api.nvim_buf_get_lines(0, linenr - 1, linenr, false)[1]
  local filename = os.date("%d-%m-%y_%H:%M:%S").. ".json"

  vim.cmd('!'..cmd..'  > '..curl_history_dir.. filename)

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
  vim.cmd(":edit " .. curl_history_dir .. filename)
  vim.api.nvim_buf_set_option(0, "modifiable", true)
end
