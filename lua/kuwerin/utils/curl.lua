-- Execute cURL responses from the text editor
-- from string e.g. `curl -s http://jsonplaceholder.typicode.com/users`
-- and parse it with jq


local M = {}

-- Gets workspace location.
local get_workspace = function()
  return vim.g.nvim_curly_root_dir or "~/.vim/curl/"
end

-- Opens window in horisontal split
local open_split = function(filename)
  vim.cmd("split " .. get_workspace() .. filename)
  vim.api.nvim_buf_set_option(0, "modifiable", true)
end


-- Opens window in vertical split
local open_vsplit = function(filename)
  vim.cmd("vsplit " .. get_workspace() .. filename)
  vim.api.nvim_buf_set_option(0, "modifiable", true)
end

-- Opens float window
local open_float = function(filename)
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

  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.api.nvim_win_set_option(win, "cursorline", true)
  vim.api.nvim_buf_set_option(buf, "modifiable", true)
  vim.cmd(":e " .. get_workspace() .. filename)
end

-- A table of allowed window types
local window_types = {}
  window_types["vertical"] = open_vsplit
  window_types["horizontal"] = open_split
  window_types["float"] = open_float

-- Gets window type. Available variants: `vertical`, `horizontal`, `float`.
-- Default is `vertical`.
local get_window_type = function()
  return vim.g.nvim_curly_window_type or "vertical"
end

-- Goes to the nvim-curly workspace root
function M.go_to_root_dir()
  vim.cmd(":e " .. get_workspace())
end

-- Resolves filename
local get_filename = function()
  return "history/"..os.date("%d-%m-%y_%H:%M:%S")..".json"
end

-- Executes the command and writes output to the file
local execute_to_file = function(cmd, filename)
  vim.cmd('!'..cmd..'  > '..get_workspace().. filename)
end

-- Executes the command under the cursor
function M.execute_line()
  local linenr = vim.api.nvim_win_get_cursor(1)[1]
  local cmd = vim.api.nvim_buf_get_lines(0, linenr - 1, linenr, false)[1]
  local filename = get_filename()

  execute_to_file(cmd, filename)

  local window_type = get_window_type()

  window_types[window_type](filename)
end

-- Exectutes the command for the selected lines
function M.execute_multiline()
  local vstart = vim.fn.getpos("'<")

  local vend = vim.fn.getpos("'>")

  local line_start = vstart[2]
  local line_end = vend[2]

  -- or use api.nvim_buf_get_lines
  local lines = vim.fn.getline(line_start,line_end)
  local cmd = table.concat(lines, ' ')

  local filename = get_filename()

  execute_to_file(cmd, filename)

  local window_type = get_window_type()

  window_types[window_type](filename)
end

return M
