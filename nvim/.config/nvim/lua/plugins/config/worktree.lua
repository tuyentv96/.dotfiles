-- local Worktree = require("git-worktree")
-- local utils = require("core.utils")

-- Worktree.setup({
--     change_directory_command = "cd",
--     update_on_change = true,
--     update_on_change_command = "e .",
--     clearjumps_on_change = true
-- })

-- local env_files = {
--     ".env",
--     ".env.export",
-- }

-- local load_env = function(path)
--     for _, name in pairs(env_files) do
--         local file_path = path .. name
--         utils.load_env_file(file_path)
--     end
-- end

-- local on_switch = function(path)
--     require'nvim-tree.view'.close()
--     require'nvim-tree'.open(path)
--     -- load_env(path)
-- end

-- Worktree.on_tree_change(function(op, metadata)
--   if op == Worktree.Operations.Switch then
--       on_switch(metadata.path)
--   end
-- end)
