local Worktree = require("git-worktree")

Worktree.setup({
    change_directory_command = "cd",
    update_on_change = true,
    update_on_change_command = "e .",
    clearjumps_on_change = true
})

Worktree.on_tree_change(function(op, metadata)
  if op == Worktree.Operations.Switch then
    require'nvim-tree.view'.close()
    require'nvim-tree'.open(metadata.path)
  end
end)
