vim.api.nvim_set_option('shell', '/bin/bash')

local core_modules = {
   "plugins",
   "core.options",
   "core.mappings",
   "core.themes",
}

for _, module in ipairs(core_modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end

