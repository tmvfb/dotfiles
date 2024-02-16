-- function _G.put(...)
--   local objects = {}
--   for i = 1, select('#', ...) do
--     local v = select(i, ...)
--     table.insert(objects, vim.inspect(v))
--   end
--
--   print(table.concat(objects, '\n'))
--   return ...
-- end

P = function(v)
  print(vim.pretty_print(v))
  return v
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

function Surround(string_format)
  local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))

  local line_text = vim.fn.getline(csrow)
  local block_text_line = line_text:sub(cscol, cecol)

  local final_text = string_format:gsub("BLOCK_TEXT_LINE", block_text_line)
  -- local final_text = "{% translate '" .. block_text_line .. "' %}"
  vim.api.nvim_command([[normal! gv"_d]])
  vim.api.nvim_command('normal! i' .. final_text)  -- Insert the replacement text
end


function Surround_translation()
  Surround("{% translate 'BLOCK_TEXT_LINE' %}")
end


function Surround_url()
  Surround("{% url 'BLOCK_TEXT_LINE' %}")
end


function Surround_brackets()
  Surround("{{ BLOCK_TEXT_LINE }}")
end

function Surround_func()
  Surround("{% BLOCK_TEXT_LINE %}")
end

-- toggle dapui on dap run
-- local dap, dapui = require("dap"), require("dapui")
-- dap.listeners.before.attach.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.launch.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated.dapui_config = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--   dapui.close()
-- end

return {
  Surround = Surround,
  Surround_translation = Surround_translation,
  Surround_url = Surround_url,
  Surround_brackets = Surround_brackets,
  Surround_func = Surround_func
}
