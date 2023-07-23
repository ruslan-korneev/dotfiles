local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

gitsigns.setup {
  current_line_blame = true,
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d %T> - <summary>',
  current_line_blame_opts = {
    delay = 1,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    map('n', 'ga', gs.stage_hunk)
    map('v', 'ga', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    map('n', 'gA', gs.stage_buffer)
    map('n', 'gu', gs.undo_stage_hunk)
    map('n', 'gb', function() gs.blame_line { full = true } end)
    -- map('n', '<leader>hr', gs.reset_hunk)
    -- map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    -- map('n', '<leader>hR', gs.reset_buffer)
    -- map('n', '<leader>hp', gs.preview_hunk)
    -- map('n', '<leader>tb', gs.toggle_current_line_blame)
    -- map('n', '<leader>hd', gs.diffthis)
    -- map('n', ';hd', function() gs.diffthis('~') end)
    -- map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
