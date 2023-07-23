local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    -- Open blame window
    -- blame = "Gb",
    -- quit_blame = "GB",
    diff = "Gd",
    diff_close = "GD",
    -- Open file/folder in git repository
    browse = "Go",
  }
})
